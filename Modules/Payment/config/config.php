<?php

return [
    'name' => 'Payment',

    /*
    |--------------------------------------------------------------------------
    | Stripe Configuration
    |--------------------------------------------------------------------------
    |
    | Here you may configure your Stripe API keys. You can get your API keys
    | from the Stripe Dashboard: https://dashboard.stripe.com/apikeys
    |
    */

    'stripe_publishable_key' => env('STRIPE_PUBLISHABLE_KEY', ''),
    'stripe_secret_key' => env('STRIPE_SECRET_KEY', ''),
    'stripe_webhook_secret' => env('STRIPE_WEBHOOK_SECRET', ''),

    /*
    |--------------------------------------------------------------------------
    | Payment Settings
    |--------------------------------------------------------------------------
    */

    'default_currency' => env('PAYMENT_DEFAULT_CURRENCY', 'usd'),
    'supported_currencies' => ['usd', 'eur', 'gbp', 'cad', 'aud', 'jpy'],
];
