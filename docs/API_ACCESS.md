# API Access Guide

This document explains how to access and interact with the project's API.

## Base URL

All API endpoints are prefixed with `/api`. If you are running the application locally using `php artisan serve`, the base URL will be:

```
http://127.0.0.1:8000/api
```

## Authentication

This API uses token-based authentication (Laravel Sanctum). To access protected endpoints, you first need to obtain an authentication token.

### 1. Register a new user

To get started, register a new user by sending a `POST` request to the `/register` endpoint.

**Request:**

`POST /api/register`

**Headers:**

```
Content-Type: application/json
Accept: application/json
```

**Body:**

```json
{
    "name": "Your Name",
    "email": "your.email@example.com",
    "password": "your_password",
    "password_confirmation": "your_password"
}
```

### 2. Log in to get a token

After registering, you can log in to receive an authentication token.

**Request:**

`POST /api/login`

**Headers:**

```
Content-Type: application/json
Accept: application/json
```

**Body:**

```json
{
    "email": "your.email@example.com",
    "password": "your_password"
}
```

**Response:**

The API will return a plain-text authentication token in the response body.

### 3. Accessing Protected Endpoints

To access protected endpoints, include the authentication token in the `Authorization` header of your request as a Bearer token.

**Example Header:**

```
Authorization: Bearer <YOUR_AUTH_TOKEN>
Accept: application/json
```

## API Endpoints

Here is a list of the available API endpoints.

### Authentication

-   `POST /api/register`: Register a new user.
-   `POST /api/login`: Log in and receive an authentication token.
-   `POST /api/logout`: Log out and invalidate the token (requires authentication).
-   `GET /api/user`: Get information about the currently authenticated user (requires authentication).

### AI Modules

These endpoints are for managing AI modules and require authentication.

-   `GET /api/ai-module`: Get a list of AI modules.
-   `POST /api/ai-module`: Create a new AI module.
-   `GET /api/ai-module/{id}`: Get a specific AI module.
-   `PUT/PATCH /api/ai-module/{id}`: Update an AI module.
-   `DELETE /api/ai-module/{id}`: Delete an AI module.

### Form Submissions

These endpoints are for managing form submissions and require authentication.

-   `GET /api/form-submissions`: Get a list of form submissions.
-   `POST /api/form-submissions`: Create a new form submission.
-   `GET /api/form-submissions/{id}`: Get a specific form submission.
-   `PUT/PATCH /api/form-submissions/{id}`: Update a form submission.
-   `DELETE /api/form-submissions/{id}`: Delete a form submission.
