# Laravel API

This is a Laravel-based API that provides user authentication and product management functionalities.

## Features

- User registration, login, and logout
- Sanctum-based API authentication
- Product CRUD operations (Create, Read, Update, Delete)
- Modular architecture
- Clean and scalable code

## Getting Started

### Prerequisites

- PHP >= 8.1
- Composer
- MySQL or any other database supported by Laravel

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/laravel-api.git
   ```

2. Install the dependencies:
   ```bash
   composer install
   ```

3. Create a copy of the `.env.example` file and name it `.env`:
   ```bash
   cp .env.example .env
   ```

4. Generate a new application key:
   ```bash
   php artisan key:generate
   ```

5. Configure your database credentials in the `.env` file.

6. Run the database migrations:
   ```bash
   php artisan migrate
   ```

### API Endpoints

#### Authentication

- `POST /api/register` - Register a new user
- `POST /api/login` - Authenticate a user and get a token
- `POST /api/logout` - Log the user out (requires authentication)
- `GET /api/user` - Get the authenticated user's information (requires authentication)

#### Products

- `GET /api/products` - Get a list of all products (requires authentication)
- `POST /api/products` - Create a new product (requires authentication)
- `GET /api/products/{id}` - Get a specific product (requires authentication)
- `PUT /api/products/{id}` - Update a specific product (requires authentication)
- `DELETE /api/products/{id}` - Delete a specific product (requires authentication)