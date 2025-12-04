#!/usr/bin/env php
<?php
/**
 * Quick DB connectivity diagnostic
 * Run inside container: php db-test.php
 */

echo "=== Database Connection Test ===\n\n";

// Read .env manually
$envPath = __DIR__ . '/.env';
if (!file_exists($envPath)) {
    die("ERROR: .env not found at $envPath\n");
}

$env = parse_ini_file($envPath);

$host = $env['DB_HOST'] ?? '127.0.0.1';
$port = $env['DB_PORT'] ?? '3306';
$database = $env['DB_DATABASE'] ?? 'laravel_api';
$username = $env['DB_USERNAME'] ?? 'root';
$password = $env['DB_PASSWORD'] ?? '';

echo "DB_HOST: $host\n";
echo "DB_PORT: $port\n";
echo "DB_DATABASE: $database\n";
echo "DB_USERNAME: $username\n";
echo "DB_PASSWORD: " . (empty($password) ? '(empty)' : '***set***') . "\n\n";

// Test 1: DNS resolution
echo "[1] Testing DNS resolution for '$host'...\n";
$ip = gethostbyname($host);
if ($ip === $host && !filter_var($host, FILTER_VALIDATE_IP)) {
    echo "   WARNING: Could not resolve '$host' to an IP\n";
} else {
    echo "   OK: Resolved to $ip\n";
}
echo "\n";

// Test 2: TCP socket connection
echo "[2] Testing TCP connection to $host:$port...\n";
$socket = @fsockopen($host, (int)$port, $errno, $errstr, 5);
if ($socket) {
    echo "   OK: TCP port $port is reachable\n";
    fclose($socket);
} else {
    echo "   FAILED: Cannot connect to $host:$port\n";
    echo "   Error: [$errno] $errstr\n";
    echo "\n";
    echo "=== Troubleshooting ===\n";
    echo "- If DB_HOST=127.0.0.1: MySQL must run inside this container (unlikely)\n";
    echo "- If DB runs on EC2 host: Set DB_HOST=host.docker.internal in .env\n";
    echo "- If DB is RDS/external: Set DB_HOST to the actual endpoint\n";
    echo "- Ensure security groups allow connections from this IP\n";
    exit(1);
}
echo "\n";

// Test 3: PDO MySQL connection
echo "[3] Testing PDO MySQL connection...\n";
try {
    $dsn = "mysql:host=$host;port=$port;dbname=$database;charset=utf8mb4";
    $pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_TIMEOUT => 5,
    ]);
    echo "   OK: Connected to MySQL successfully\n";

    // Test query
    $stmt = $pdo->query("SELECT VERSION() as version");
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "   MySQL Version: " . $row['version'] . "\n";

} catch (PDOException $e) {
    echo "   FAILED: " . $e->getMessage() . "\n";
    exit(1);
}

echo "\n=== All checks passed! ===\n";
echo "Your database connection is working correctly.\n";