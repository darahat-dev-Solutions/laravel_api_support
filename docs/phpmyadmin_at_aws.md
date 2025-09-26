# Enabling phpMyAdmin on Apache Server in AWS EC2 (Amazon Linux)

This guide documents the full process we followed to set up **phpMyAdmin** on an **Amazon Linux EC2 instance** with Apache.

---

## 🔹 Prerequisites

-   An **AWS EC2 instance** (Amazon Linux 2 or Amazon Linux 2023).
-   Security Group with **port 80 (HTTP)** open to your IP.
-   Apache, PHP, and MySQL/MariaDB installed (or an RDS MySQL instance available).

---

## 🔹 Step 1: Update Packages

```bash
sudo dnf update -y   # Amazon Linux 2023
# or
sudo yum update -y   # Amazon Linux 2
```
