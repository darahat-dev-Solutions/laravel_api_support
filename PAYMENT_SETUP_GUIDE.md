# Payment Integration Setup Guide

## ✅ What Has Been Implemented

### 1. Laravel Payment Module Created

-   **Location:** `Modules/Payment/`
-   **Controller:** `PaymentController.php` with full Stripe integration
-   **Routes:** Configured in `routes/api.php`
-   **Configuration:** `config/config.php` for Stripe settings
-   **Form Request:** `CreatePaymentIntentRequest.php` for validation

### 2. Stripe PHP SDK Installed

-   Package: `stripe/stripe-php` v19.0.0
-   Installed via Composer

### 3. API Endpoints Available

All endpoints are prefixed with `/api/v1/`:

| Method | Endpoint                                     | Auth Required | Description                 |
| ------ | -------------------------------------------- | ------------- | --------------------------- |
| POST   | `/api/v1/payment/create-payment-intent`      | ✅ Yes        | Create a new payment intent |
| GET    | `/api/v1/payment/payment-intent/{id}`        | ✅ Yes        | Get payment intent details  |
| POST   | `/api/v1/payment/payment-intent/{id}/cancel` | ✅ Yes        | Cancel a payment intent     |
| POST   | `/api/v1/payment/webhook`                    | ❌ No         | Stripe webhook handler      |

---

## 🔧 Required Setup Steps

### Step 1: Get Your Stripe API Keys

1. Go to [Stripe Dashboard](https://dashboard.stripe.com/)
2. Create an account or login
3. Navigate to **Developers** → **API keys**
4. Copy both keys:
    - **Publishable key** (starts with `pk_test_...`)
    - **Secret key** (starts with `sk_test_...`)

### Step 2: Configure Environment Variables

Create or update your `.env` file with these Stripe credentials:

```env
# Stripe Payment Configuration
STRIPE_PUBLISHABLE_KEY=pk_test_YOUR_PUBLISHABLE_KEY_HERE
STRIPE_SECRET_KEY=sk_test_YOUR_SECRET_KEY_HERE
STRIPE_WEBHOOK_SECRET=whsec_YOUR_WEBHOOK_SECRET_HERE
PAYMENT_DEFAULT_CURRENCY=usd
```

**Replace the placeholder values with your actual Stripe keys!**

### Step 3: Set Up Stripe Webhook (Optional but Recommended)

1. In Stripe Dashboard, go to **Developers** → **Webhooks**
2. Click **Add endpoint**
3. Enter your webhook URL:
    ```
    https://your-domain.com/api/v1/payment/webhook
    ```
4. Select events to listen for:
    - `payment_intent.succeeded`
    - `payment_intent.payment_failed`
    - `payment_intent.canceled`
5. Copy the **Signing secret** and add it to your `.env` as `STRIPE_WEBHOOK_SECRET`

---

## 📱 Flutter App Integration

### Update Your Flutter Code

Your Flutter code is already correctly structured! Just update your `.env` file in Flutter:

```env
BASE_API_URL=https://your-laravel-api-domain.com
```

### Example API Call from Flutter

```dart
import 'package:dio/dio.dart';

final dio = Dio();

// Get your auth token (from login/sanctum)
final authToken = 'your_bearer_token_here';

// Create payment intent
final response = await dio.post(
  'https://your-api-domain.com/api/v1/payment/create-payment-intent',
  data: {
    'amount': 5000,        // $50.00 in cents
    'currency': 'usd',
    'description': 'Payment for order #12345',
    'metadata': {
      'order_id': '12345',
      'customer_name': 'John Doe'
    },
  },
  options: Options(
    headers: {
      'Authorization': 'Bearer $authToken',
      'Accept': 'application/json',
    },
  ),
);

final clientSecret = response.data['data']['client_secret'];
// Use clientSecret with Flutter Stripe SDK
```

---

## 🧪 Testing the API

### 1. Using Postman/Thunder Client

**Create Payment Intent:**

```
POST https://your-domain.com/api/v1/payment/create-payment-intent
Headers:
  Authorization: Bearer YOUR_AUTH_TOKEN
  Content-Type: application/json
  Accept: application/json

Body (JSON):
{
    "amount": 5000,
    "currency": "usd",
    "description": "Test payment",
    "metadata": {
        "test": "true"
    }
}
```

**Expected Response:**

```json
{
    "success": true,
    "message": "Payment intent created successfully",
    "data": {
        "id": "pi_3ABC123...",
        "client_secret": "pi_3ABC123..._secret_...",
        "amount": 5000,
        "currency": "usd",
        "status": "requires_payment_method",
        "description": "Test payment",
        "metadata": {
            "test": "true"
        }
    }
}
```

### 2. Test Cards (Stripe Test Mode)

Use these test cards when processing payments:

**✅ Successful Payment:**

-   Card Number: `4242 4242 4242 4242`
-   Expiry: Any future date
-   CVC: Any 3 digits
-   ZIP: Any 5 digits

**❌ Payment Declined:**

-   Card Number: `4000 0000 0000 0002`

**🔐 Requires Authentication (3D Secure):**

-   Card Number: `4000 0025 0000 3155`

---

## 📋 Supported Currencies

The following currencies are supported:

-   `usd` - US Dollar
-   `eur` - Euro
-   `gbp` - British Pound
-   `cad` - Canadian Dollar
-   `aud` - Australian Dollar
-   `jpy` - Japanese Yen

You can modify this list in `Modules/Payment/config/config.php`

---

## 🔒 Security Checklist

-   [x] ✅ Stripe SDK installed and configured
-   [ ] ⚠️ Add Stripe keys to `.env` file
-   [ ] ⚠️ Never commit `.env` file to git
-   [ ] ⚠️ Use HTTPS in production
-   [ ] ⚠️ Verify webhook signatures
-   [ ] ⚠️ Handle amounts in smallest currency unit (cents)
-   [ ] ⚠️ Implement proper error handling in Flutter app
-   [ ] ⚠️ Add rate limiting to prevent abuse

---

## 🐛 Troubleshooting

### Error: "Stripe secret key not configured"

**Solution:** Add `STRIPE_SECRET_KEY` to your `.env` file

### Error: "Class 'Stripe\Stripe' not found"

**Solution:** Run `composer install` or `composer dump-autoload`

### Error: 401 Unauthorized

**Solution:** Include valid Bearer token in Authorization header

### Error: 422 Validation Error

**Solution:** Check request payload matches required format (amount, currency required)

---

## 📊 Monitoring & Logs

### Application Logs

Payment activities are logged in: `storage/logs/laravel.log`

Check logs for:

-   Payment intent creation
-   API errors
-   Webhook events

### Stripe Dashboard

Monitor payments in real-time:

-   Go to **Payments** → **All payments**
-   View payment status, amounts, and customer details
-   Test mode vs Live mode toggle

---

## 🚀 Going Live

When ready for production:

1. **Switch to Live Keys:**

    - Get live API keys from Stripe Dashboard
    - Update `.env` with live keys (starts with `pk_live_` and `sk_live_`)

2. **Update Webhook URL:**

    - Use production domain
    - Update webhook signing secret

3. **Enable HTTPS:**

    - Stripe requires HTTPS for webhooks
    - Use SSL certificate

4. **Test Thoroughly:**
    - Test with real payment amounts
    - Verify webhook delivery
    - Monitor error logs

---

## 📚 Additional Resources

-   [Stripe API Documentation](https://stripe.com/docs/api)
-   [Stripe PHP Library](https://github.com/stripe/stripe-php)
-   [Flutter Stripe Plugin](https://pub.dev/packages/flutter_stripe)
-   [Payment Intents Guide](https://stripe.com/docs/payments/payment-intents)

---

## ✉️ Need Help?

Check the detailed README at: `Modules/Payment/README.md`

For Stripe-specific issues, consult [Stripe Support](https://support.stripe.com/)
