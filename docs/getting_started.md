# Getting Started with the Laravel API Support Project

This document will guide you through the process of setting up the project on your local development machine.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

-   PHP (>= 8.2)
-   Composer
-   Node.js & npm
-   A database server (e.g., MariaDB, MySQL)

## Installation

1.  **Clone the repository:**

    ```bash
    git clone <repository-url>
    cd laravel_api_support
    ```

2.  **Install PHP dependencies:**

    ```bash
    composer install
    ```

3.  **Install JavaScript dependencies:**

    ```bash
    npm install
    ```

## Configuration

1.  **Create the environment file:**

    Copy the `.env.example` file to a new file named `.env`. This file will hold your application's environment-specific settings.

    ```bash
    cp .env.example .env
    ```

2.  **Generate Application Encryption Key:**

    The application encryption key is used by Laravel's encrypter services. A new key must be generated for each new installation.

    ```bash
    php artisan key:generate
    ```

    This command will generate a new random key and automatically add it to your `.env` file.

3.  **Configure your database:**

    Open the `.env` file and update the `DB_*` variables to match your local database credentials.

    ```
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=laravel_api
    DB_USERNAME=root
    DB_PASSWORD=
    ```

## Database Setup

Run the database migrations to create the necessary tables. The `--seed` flag will also populate the database with initial data from the seeders.

```bash
php artisan migrate --seed
```

## Running the Application

You can now start the local development server:

```bash
php artisan serve
```

The application will be accessible at `http://127.0.0.1:8000`.
