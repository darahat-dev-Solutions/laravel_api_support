# LEMP Stack Setup Troubleshooting Guide

## Problem Summary

Setting up a LEMP (Linux, Nginx, MariaDB, PHP-FPM) stack on Amazon Linux 2023 encountered several issues including wrong package manager, repository errors, service conflicts, and port conflicts.

## Environment

-   **OS**: Amazon Linux 2023
-   **Package Manager**: `dnf` (not `apt`)
-   **Services**: Nginx, PHP-FPM, MariaDB

## Step-by-Step Solution

### 1. Identify Package Manager

```bash
# Check available package managers
which yum || which dnf || which apt || which apk || which pacman || which zypper

# Identify OS version
cat /etc/os-release
```

### 2. Install Required Packages

```bash
# Remove problematic repositories if any
sudo rm -f /etc/yum.repos.d/mariadb.repo

# Clean cache
sudo dnf clean all
sudo dnf makecache

# Install packages
sudo dnf install -y php php-cli php-fpm php-mysqlnd php-mbstring php-xml unzip curl git composer nginx mariadb105-server mariadb105
```

### 3. Fix MariaDB Repository Issues

If you see MariaDB 404 errors:

```bash
# Remove problematic repo
sudo rm -f /etc/yum.repos.d/mariadb.repo

# Use Amazon's packages instead
sudo dnf install -y mariadb105-server mariadb105
```

### 4. Start and Enable Services

```bash
# Start services
sudo systemctl start mariadb
sudo systemctl start php-fpm
sudo systemctl start nginx

# Enable auto-start on boot
sudo systemctl enable mariadb
sudo systemctl enable php-fpm
sudo systemctl enable nginx
```

### 5. Troubleshoot Service Issues

#### If services don't exist:

```bash
# Check available service names
systemctl list-unit-files | grep -E '(php|nginx|mariadb|mysql)'

# For Amazon Linux 2023, typical service names:
# - php-fpm.service
# - nginx.service
# - mariadb.service (not mysqld.service)
```

#### If port 80 is already in use:

```bash
# Find what's using port 80
sudo ss -tulpn | grep :80

# Stop conflicting services (often httpd/Apache)
sudo systemctl stop httpd
sudo systemctl disable httpd

# Or kill processes using port 80
sudo fuser -k 80/tcp
sudo pkill nginx  # If orphaned nginx processes exist

# Then restart nginx
sudo systemctl start nginx
```

### 6. Verify Installation

```bash
# Check all services status
sudo systemctl status php-fpm nginx mariadb

# Test PHP
echo "<?php phpinfo(); ?>" | sudo tee /usr/share/nginx/html/info.php
curl http://localhost/info.php

# Test MariaDB
sudo mysql -u root -e "SELECT VERSION();"
```

### 7. Secure MariaDB

```bash
sudo mysql_secure_installation
```

## Common Issues and Solutions

### 1. `sudo: apt: command not found`

-   **Cause**: Using wrong package manager on Amazon Linux
-   **Solution**: Use `dnf` instead of `apt`

### 2. MariaDB 404 Repository Errors

-   **Cause**: Broken MariaDB repository configuration
-   **Solution**: Remove problematic repo and use Amazon's packages

### 3. `Unit file does not exist`

-   **Cause**: Services not installed or wrong service names
-   **Solution**: Install packages and verify service names with `systemctl list-unit-files`

### 4. `Address already in use` (port 80)

-   **Cause**: Another web server (often httpd) running on port 80
-   **Solution**: Stop conflicting service and free port 80

### 5. `Refusing to operate on alias name`

-   **Cause**: Using alias service names like `mysqld` instead of actual service `mariadb`
-   **Solution**: Use actual service names from `systemctl list-unit-files`

## Key Takeaways

1. **Amazon Linux 2023 uses `dnf`**, not `apt`
2. **Service names matter**: Use `mariadb.service`, not `mysqld.service`
3. **Check for port conflicts** before starting web servers
4. **Verify service names** with `systemctl list-unit-files`
5. **Remove problematic repositories** that cause 404 errors

## Final Working Commands

```bash
# Install
sudo dnf install -y php php-fpm php-mysqlnd nginx mariadb105-server

# Start services
sudo systemctl start mariadb php-fpm nginx
sudo systemctl enable mariadb php-fpm nginx

# Verify
sudo systemctl status mariadb php-fpm nginx
curl http://localhost
```
