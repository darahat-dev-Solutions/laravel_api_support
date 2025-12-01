# Payment Module

This module handles Stripe payment integration for the Laravel API.

## Setup

### 1. Install Stripe PHP SDK

```bash
composer require stripe/stripe-php
```

### 2. Configure Environment Variables

Add these variables to your `.env` file:

```env
STRIPE_PUBLISHABLE_KEY=pk_test_YOUR_PUBLISHABLE_KEY_HERE
STRIPE_SECRET_KEY=sk_test_YOUR_SECRET_KEY_HERE
STRIPE_WEBHOOK_SECRET=whsec_YOUR_WEBHOOK_SECRET_HERE
PAYMENT_DEFAULT_CURRENCY=usd
```

**Getting Stripe Keys:**

1. Go to [Stripe Dashboard](https://dashboard.stripe.com/)
2. Navigate to Developers > API keys
3. Copy your Publishable key and Secret key
4. For webhooks: Developers > Webhooks > Add endpoint

### 3. Enable the Module

```bash
php artisan module:enable Payment
```

## API Endpoints

### Base URL

All endpoints are prefixed with: `/api/v1/`

### 1. Create Payment Intent

**Endpoint:** `POST /api/v1/payment/create-payment-intent`

**Authentication:** Required (Bearer Token)

**Request Body:**

```json
{
    "amount": 5000,
    "currency": "usd",
    "description": "Payment for order #12345",
    "metadata": {
        "order_id": "12345",
        "customer_name": "John Doe"
    }
}
```

**Parameters:**

-   `amount` (required, integer): Amount in cents (e.g., 5000 = $50.00)
-   `currency` (required, string): 3-letter currency code (usd, eur, gbp, etc.)
-   `description` (optional, string): Description of the payment
-   `metadata` (optional, object): Additional data to attach to the payment

**Response (201):**

```json
{
    "success": true,
    "message": "Payment intent created successfully",
    "data": {
        "id": "pi_3ABC123...",
        "client_secret": "pi_3ABC123..._secret_XYZ...",
        "amount": 5000,
        "currency": "usd",
        "status": "requires_payment_method",
        "description": "Payment for order #12345",
        "metadata": {
            "order_id": "12345",
            "customer_name": "John Doe"
        }
    }
}
```

### 2. Get Payment Intent Details

**Endpoint:** `GET /api/v1/payment/payment-intent/{paymentIntentId}`

**Authentication:** Required (Bearer Token)

**Response (200):**

```json
{
    "success": true,
    "data": {
        "id": "pi_3ABC123...",
        "amount": 5000,
        "currency": "usd",
        "status": "succeeded",
        "description": "Payment for order #12345",
        "metadata": {
            "order_id": "12345"
        }
    }
}
```

### 3. Cancel Payment Intent

**Endpoint:** `POST /api/v1/payment/payment-intent/{paymentIntentId}/cancel`

**Authentication:** Required (Bearer Token)

**Response (200):**

```json
{
    "success": true,
    "message": "Payment intent cancelled successfully",
    "data": {
        "id": "pi_3ABC123...",
        "status": "canceled"
    }
}
```

### 4. Stripe Webhook

**Endpoint:** `POST /api/v1/payment/webhook`

**Authentication:** None (Verified by Stripe signature)

This endpoint receives events from Stripe. Configure this in your Stripe Dashboard:

-   URL: `https://your-domain.com/api/v1/payment/webhook`
-   Events to listen for: `payment_intent.succeeded`, `payment_intent.payment_failed`, `payment_intent.canceled`

## Flutter Integration

Your Flutter app should call the `/api/v1/payment/create-payment-intent` endpoint:

```dart
final baseUrl = dotenv.env['BASE_API_URL'];
final response = await _dio.post(
  '$baseUrl/api/v1/payment/create-payment-intent',
  data: {
    'amount': amount,
    'currency': currency,
    'description': description,
    'metadata': metadata,
  },
  options: Options(
    headers: {
      'Authorization': 'Bearer $yourAuthToken',
    },
  ),
);
```

## Supported Currencies

-   `usd` - US Dollar
-   `eur` - Euro
-   `gbp` - British Pound
-   `cad` - Canadian Dollar
-   `aud` - Australian Dollar
-   `jpy` - Japanese Yen

## Testing

### Test Cards (Stripe Test Mode)

**Successful Payment:**

-   Card: `4242 4242 4242 4242`
-   Any future expiry date
-   Any 3-digit CVC

**Payment Declined:**

-   Card: `4000 0000 0000 0002`

**Requires Authentication:**

-   Card: `4000 0025 0000 3155`

## Error Handling

All endpoints return errors in this format:

```json
{
    "success": false,
    "message": "Error description",
    "errors": {
        "field": ["Validation error message"]
    }
}
```

**Common HTTP Status Codes:**

-   `200` - Success
-   `201` - Created
-   `400` - Bad Request
-   `401` - Unauthorized
-   `422` - Validation Error
-   `500` - Server Error

## Security Notes

1. **Never expose your Secret Key** - Keep it in `.env` and never commit it to version control
2. **Use HTTPS in production** - Stripe requires HTTPS for webhook endpoints
3. **Verify webhook signatures** - Always validate webhook requests using `STRIPE_WEBHOOK_SECRET`
4. **Handle amounts in cents** - Always work with the smallest currency unit (e.g., cents for USD)

## Logging

Payment activities are logged in `storage/logs/laravel.log`:

-   Payment intent creation
-   Payment successes/failures
-   Webhook events
-   API errors

## Support

For Stripe-specific questions, refer to:

-   [Stripe API Documentation](https://stripe.com/docs/api)
-   [Stripe PHP Library](https://github.com/stripe/stripe-php)
