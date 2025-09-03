Here’s a structured approach to deploy your Laravel application on AWS EC2 (Free Tier) and expose it as an API endpoint for other projects. I'll keep it step-by-step and flag important security considerations.

---

## **1. Prepare Your Laravel Project**

Before touching AWS, make sure your project is ready to run in production:

-   Set `APP_ENV=production` and `APP_DEBUG=false` in `.env`
-   Run `composer install --optimize-autoloader --no-dev`
-   Run `php artisan config:cache` and `php artisan route:cache`
-   Ensure your `.env` file has database credentials and correct `APP_URL`

---

## **2. Set Up Your EC2 Instance**

1. **Launch an EC2 instance**

    - Amazon Linux 2023, Ubuntu 22.04 LTS, or Debian are all fine.
    - Use **t2.micro (Free Tier)**.
    - Select **Create new key pair** or use existing — download `.pem`.
    - In Security Group:

        - Allow SSH (22) only from your IP
        - Allow HTTP (80) (so Laravel API is reachable)
        - (Optional) Allow HTTPS (443) if you'll use SSL

2. **Connect to your instance:**

    ```bash
    ssh -i your-key.pem ec2-user@<your-ec2-public-ip>
    ```

    - For Ubuntu AMIs, use `ubuntu@<ip>`

---

## **3. Install Required Packages on EC2**

Update packages and install:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y php php-cli php-fpm php-mysql php-mbstring php-xml unzip curl git composer mariadb-server nginx
```

(If using Amazon Linux, packages differ: `sudo yum install -y php-cli php-fpm php-mysqlnd git mariadb105-server composer nginx`)

Enable services:

```bash
sudo systemctl enable php-fpm mariadb nginx
sudo systemctl start php-fpm mariadb nginx
```

---

## **4. Set Up Database (Optional if needed)**

If Laravel uses MySQL:

```bash
sudo mysql_secure_installation
sudo mysql -u root -p
```

Inside MySQL:

```sql
CREATE DATABASE laravel_api;
CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'strongpassword';
GRANT ALL PRIVILEGES ON laravel_api.* TO 'laravel'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Update `.env`:

```
DB_DATABASE=laravel_api
DB_USERNAME=laravel
DB_PASSWORD=strongpassword
```

---

## **5. Deploy Laravel Project**

Choose **either** Git or SFTP/zip upload.

**Using Git (recommended):**

```bash
cd /var/www
sudo git clone <your-repo-url> laravel-api
cd laravel-api
composer install --optimize-autoloader --no-dev
php artisan key:generate
php artisan migrate --force
php artisan config:cache
php artisan route:cache
```

Adjust permissions:

```bash
sudo chown -R www-data:www-data /var/www/laravel-api
sudo chmod -R 775 /var/www/laravel-api/storage /var/www/laravel-api/bootstrap/cache
```

---

## **6. Configure Nginx**

Create site config:

```bash
sudo nano /etc/nginx/sites-available/laravel-api
```

Add:

```nginx
server {
    listen 80;
    server_name _;

    root /var/www/laravel-api/public;

    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock; # adjust version if needed
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

Enable and restart:

```bash
sudo ln -s /etc/nginx/sites-available/laravel-api /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

---

## **7. Test API Endpoint**

Visit:

```
http://<your-ec2-public-ip>/api/<your-endpoint>
```

You should see JSON response.

---

## **8. (Optional but Recommended) Add SSL**

Use Certbot:

```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d yourdomain.com
```

Now your API works on HTTPS.

---

## **9. Secure the Instance**

-   Close port 22 when not in use, or restrict SSH to your IP only.
-   Never expose `.env` publicly (keep it outside `/public`).
-   Use a non-root DB user (already done).
-   Consider deploying with **GitHub Actions + Docker** for repeatability later.

---

### **Would you like me to create a ready-to-use GitHub Actions CI/CD workflow** that:

-   builds your Laravel project into a Docker container
-   pushes it to Docker Hub
-   auto-deploys to EC2 (without manual SSH)

Or do you want to first **deploy manually** and automate later?
apt-get update && apt-get install -y nano
nano .env
