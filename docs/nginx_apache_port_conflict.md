Here’s a structured **documentation draft** you can put inside your `docs/` folder (e.g., `docs/nginx_apache_port_conflict.md`):

---

# Nginx and Apache Port Conflict Issue

## Overview

During deployment of the Laravel application inside a Docker container on an AWS EC2 instance, the application endpoints were returning **404 errors**, and Nginx logs showed multiple `open() ... failed (2: No such file or directory)` errors.

The root cause was a **port conflict**: Nginx was already running on port `80`, preventing the Docker container (which runs Apache) from binding to the same port.

---

## Problem Details

-   **Nginx Status:** Active and listening on port 80.

-   **Docker Container:** Apache inside the container needs to listen on port 80.

-   **Symptoms:**

    -   Laravel routes returning `404`.
    -   `/api/form-submissions` and static files like `.txt` returning `404`.
    -   Nginx error logs showing missing files in `/usr/share/nginx/html/`.

-   **Root Cause:** Nginx intercepts traffic on port 80, so requests never reached Apache inside the Docker container.

---

## Steps to Resolve

### 1. Stop and disable Nginx

```bash
sudo systemctl stop nginx
sudo systemctl disable nginx
```

-   `stop` immediately stops the Nginx service.
-   `disable` prevents it from starting on reboot.

---

### 2. Run the Docker container with Apache on port 80

```bash
sudo docker run -d --name laravel-api -p 80:80 darahat42/laravel-api:latest
```

-   `-p 80:80` maps host port 80 directly to container port 80.
-   Apache inside the container will now receive all incoming HTTP requests.

---

### 3. Verify Deployment

1. Check running container:

```bash
sudo docker ps
```

2. Test Laravel endpoints:

```
http://<EC2_PUBLIC_IP>/api/form-submissions
http://<EC2_PUBLIC_IP>/api/form-submissions/text.txt
```

-   The routes should now respond correctly.
-   Static files and `.htaccess` are respected inside the container.

---

### 4. Key Notes

-   Do **not** run Nginx on the host when using Docker containers that bind to port 80.
-   Apache inside the container handles `.htaccess` and Laravel routing.
-   `.htaccess` might appear hidden; use `ls -la public/` to verify it exists.

---

✅ After following these steps, Laravel runs correctly inside Docker on EC2 without port conflicts.

---
