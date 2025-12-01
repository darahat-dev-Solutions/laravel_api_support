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
        // Set Stripe API key
        Stripe::setApiKey(config('payment.stripe_secret_key'));
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
}
