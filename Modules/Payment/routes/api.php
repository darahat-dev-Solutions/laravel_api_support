<?php

use Illuminate\Support\Facades\Route;
use Modules\Payment\Http\Controllers\PaymentController;

/*
|--------------------------------------------------------------------------
| Payment API Routes
|--------------------------------------------------------------------------
*/

// Test route to verify module is working
Route::get('payment/test', function () {
    return response()->json([
        'success' => true,
        'message' => 'Payment module is working!',
        'module' => 'Payment',
        'version' => '1.0.0',
        'stripe_configured' => !empty(config('payment.stripe_secret_key')),
        'endpoints' => [
            'create_payment_intent' => 'POST /api/v1/payment/create-payment-intent',
            'get_payment_intent' => 'GET /api/v1/payment/payment-intent/{id}',
            'cancel_payment_intent' => 'POST /api/v1/payment/payment-intent/{id}/cancel',
            'webhook' => 'POST /api/v1/payment/webhook',
        ]
    ]);
});

// Payment intent routes (protected by authentication)
     Route::post('payment/create-payment-intent', [PaymentController::class, 'createPaymentIntent']);
    Route::get('payment/payment-intent/{paymentIntentId}', [PaymentController::class, 'getPaymentIntent']);
    Route::post('payment/payment-intent/{paymentIntentId}/cancel', [PaymentController::class, 'cancelPaymentIntent']);


// Webhook route (no authentication - Stripe will send requests here)
Route::post('payment/webhook', [PaymentController::class, 'webhook']);

// Config diagnostic route (no auth - for debugging)
Route::get('payment/config-check', [PaymentController::class, 'configCheck']);