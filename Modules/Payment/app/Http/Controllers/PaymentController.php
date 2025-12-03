<?php

namespace Modules\Payment\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Modules\Payment\Http\Requests\CreatePaymentIntentRequest;
use Stripe\Stripe;
use Stripe\PaymentIntent;
use Stripe\Exception\ApiErrorException;

class PaymentController extends Controller
{
    public function __construct()
    {
        // Resolve and set Stripe API key from multiple sources
        $key = $this->resolveStripeSecret();
        if (!empty($key)) {
            Stripe::setApiKey($key);
        }
    }

    private function resolveStripeSecret(): ?string
    {
        // Try module flat config first
        $candidates = [
            config('payment.stripe_secret_key'),
            // Try nested module config
            config('payment.stripe.secret'),
            // Direct env fallback
            env('STRIPE_SECRET_KEY'),
            // Common alternative locations
            config('services.stripe.secret'),
        ];

        foreach ($candidates as $value) {
            if (is_string($value) && trim($value) !== '') {
                return trim($value);
            }
        }
        return null;
    }

    /**
     * Create a payment intent
     *
     * @param CreatePaymentIntentRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createPaymentIntent(CreatePaymentIntentRequest $request)
    {
        try {
            // Get validated data
            $validated = $request->validated();

            // Create payment intent
            $paymentIntent = PaymentIntent::create([
                'amount' => $validated['amount'],
                'currency' => strtolower($validated['currency']),
                'description' => $validated['description'] ?? null,
                'metadata' => $validated['metadata'] ?? [],
                'automatic_payment_methods' => [
                    'enabled' => true,
                ],
            ]);

            Log::info('Payment intent created', [
                'id' => $paymentIntent->id,
                'amount' => $validated['amount'],
                'currency' => $validated['currency']
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Payment intent created successfully',
                'data' => [
                    'id' => $paymentIntent->id,
                    'client_secret' => $paymentIntent->client_secret,
                    'amount' => $paymentIntent->amount,
                    'currency' => $paymentIntent->currency,
                    'status' => $paymentIntent->status,
                    'description' => $paymentIntent->description,
                    'metadata' => $paymentIntent->metadata->toArray(),
                ]
            ], 201);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);

        } catch (ApiErrorException $e) {
            Log::error('Stripe API error', [
                'error' => $e->getMessage(),
                'type' => get_class($e)
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Payment processing error: ' . $e->getMessage()
            ], 500);

        } catch (\Exception $e) {
            Log::error('Payment intent creation error', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'An unexpected error occurred'
            ], 500);
        }
    }

    /**
     * Get payment intent details
     *
     * @param string $paymentIntentId
     * @return \Illuminate\Http\JsonResponse
     */
    public function getPaymentIntent($paymentIntentId)
    {
        try {
            $paymentIntent = PaymentIntent::retrieve($paymentIntentId);

            return response()->json([
                'success' => true,
                'data' => [
                    'id' => $paymentIntent->id,
                    'amount' => $paymentIntent->amount,
                    'currency' => $paymentIntent->currency,
                    'status' => $paymentIntent->status,
                    'description' => $paymentIntent->description,
                    'metadata' => $paymentIntent->metadata->toArray(),
                ]
            ], 200);

        } catch (ApiErrorException $e) {
            Log::error('Stripe API error retrieving payment intent', [
                'payment_intent_id' => $paymentIntentId,
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Payment intent not found'
            ], 404);

        } catch (\Exception $e) {
            Log::error('Error retrieving payment intent', [
                'payment_intent_id' => $paymentIntentId,
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'An unexpected error occurred'
            ], 500);
        }
    }

    /**
     * Cancel a payment intent
     *
     * @param string $paymentIntentId
     * @return \Illuminate\Http\JsonResponse
     */
    public function cancelPaymentIntent($paymentIntentId)
    {
        try {
            $paymentIntent = PaymentIntent::retrieve($paymentIntentId);
            $paymentIntent->cancel();

            Log::info('Payment intent cancelled', ['id' => $paymentIntentId]);

            return response()->json([
                'success' => true,
                'message' => 'Payment intent cancelled successfully',
                'data' => [
                    'id' => $paymentIntent->id,
                    'status' => $paymentIntent->status,
                ]
            ], 200);

        } catch (ApiErrorException $e) {
            Log::error('Stripe API error cancelling payment intent', [
                'payment_intent_id' => $paymentIntentId,
                'error' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to cancel payment intent'
            ], 500);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'An unexpected error occurred'
            ], 500);
        }
    }

    /**
     * Webhook handler for Stripe events
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function webhook(Request $request)
    {
        $payload = $request->getContent();
        $sigHeader = $request->header('Stripe-Signature');
        $webhookSecret = config('payment.stripe_webhook_secret');

        try {
            if ($webhookSecret) {
                $event = \Stripe\Webhook::constructEvent(
                    $payload,
                    $sigHeader,
                    $webhookSecret
                );
            } else {
                $event = json_decode($payload, true);
            }

            // Handle the event
            switch ($event['type']) {
                case 'payment_intent.succeeded':
                    $paymentIntent = $event['data']['object'];
                    Log::info('Payment intent succeeded', ['id' => $paymentIntent['id']]);
                    // Handle successful payment
                    break;

                case 'payment_intent.payment_failed':
                    $paymentIntent = $event['data']['object'];
                    Log::warning('Payment intent failed', ['id' => $paymentIntent['id']]);
                    // Handle failed payment
                    break;

                case 'payment_intent.canceled':
                    $paymentIntent = $event['data']['object'];
                    Log::info('Payment intent canceled', ['id' => $paymentIntent['id']]);
                    // Handle canceled payment
                    break;

                default:
                    Log::info('Unhandled webhook event', ['type' => $event['type']]);
            }

            return response()->json(['success' => true], 200);

        } catch (\Stripe\Exception\SignatureVerificationException $e) {
            Log::error('Webhook signature verification failed', ['error' => $e->getMessage()]);
            return response()->json(['error' => 'Invalid signature'], 400);

        } catch (\Exception $e) {
            Log::error('Webhook error', ['error' => $e->getMessage()]);
            return response()->json(['error' => 'Webhook error'], 500);
        }
    }

    /**
     * Check configuration status (for debugging)
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function configCheck()
    {
        $secretKey = config('payment.stripe_secret_key');
        $publishableKey = config('payment.stripe_publishable_key');

        $envPath = base_path('.env');
        $envExists = file_exists($envPath);
        $envReadable = is_readable($envPath);
        $hasStripeSecretLine = false;
        $hasStripePublishableLine = false;
        $hasStripePublicLine = false;
        $envSample = [];

        if ($envReadable) {
            try {
                $lines = @file($envPath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) ?: [];
                foreach ($lines as $line) {
                    if (str_starts_with($line, 'STRIPE_SECRET_KEY=')) { $hasStripeSecretLine = true; $envSample[] = 'STRIPE_SECRET_KEY=***masked***'; }
                    if (str_starts_with($line, 'STRIPE_PUBLISHABLE_KEY=')) { $hasStripePublishableLine = true; $envSample[] = 'STRIPE_PUBLISHABLE_KEY=***masked***'; }
                    if (str_starts_with($line, 'STRIPE_PUBLIC_KEY=')) { $hasStripePublicLine = true; $envSample[] = 'STRIPE_PUBLIC_KEY=***masked***'; }
                    if (str_starts_with($line, 'DB_HOST=')) { $envSample[] = $line; }
                    if (str_starts_with($line, 'APP_ENV=')) { $envSample[] = $line; }
                    if (str_starts_with($line, 'APP_URL=')) { $envSample[] = $line; }
                }
            } catch (\Throwable $t) {
                // ignore
            }
        }

        return response()->json([
            'module' => 'Payment',
            'config_loaded' => config('payment.name') !== null,
            'stripe_secret_configured' => !empty($secretKey),
            'stripe_secret_prefix' => !empty($secretKey) ? substr($secretKey, 0, 7) . '...' : 'NOT SET',
            'stripe_publishable_configured' => !empty($publishableKey),
            'stripe_publishable_prefix' => !empty($publishableKey) ? substr($publishableKey, 0, 7) . '...' : 'NOT SET',
            'webhook_secret_configured' => !empty(config('payment.stripe_webhook_secret')),
            'default_currency' => config('payment.default_currency'),
            'supported_currencies' => config('payment.supported_currencies'),
            'env_check' => [
                'STRIPE_SECRET_KEY' => env('STRIPE_SECRET_KEY') ? 'SET' : 'NOT SET',
                'STRIPE_PUBLISHABLE_KEY' => env('STRIPE_PUBLISHABLE_KEY') ? 'SET' : 'NOT SET',
                'getenv_STRIPE_SECRET_KEY' => getenv('STRIPE_SECRET_KEY') ? 'SET' : 'NOT SET',
                'getenv_STRIPE_PUBLISHABLE_KEY' => getenv('STRIPE_PUBLISHABLE_KEY') ? 'SET' : 'NOT SET',
                'env_path' => $envPath,
                'env_exists' => $envExists,
                'env_readable' => $envReadable,
                'env_has_secret_line' => $hasStripeSecretLine,
                'env_has_publishable_line' => $hasStripePublishableLine,
                'env_has_public_line' => $hasStripePublicLine,
                'env_sample' => $envSample,
                'app_env' => env('APP_ENV') ?: config('app.env'),
            ]
        ]);
    }
}