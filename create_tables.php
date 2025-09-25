<?php

require_once __DIR__ . '/bootstrap/app.php';

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

$app = new \Illuminate\Foundation\Application(
    $_ENV['APP_BASE_PATH'] ?? dirname(__DIR__, 2)
);

$app->singleton(
    Illuminate\Contracts\Http\Kernel::class,
    App\Http\Kernel::class
);

$app->singleton(
    Illuminate\Contracts\Console\Kernel::class,
    App\Console\Kernel::class
);

$app->singleton(
    Illuminate\Contracts\Debug\ExceptionHandler::class,
    App\Exceptions\Handler::class
);

$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

// Create menu_items table
if (!Schema::hasTable('menu_items')) {
    Schema::create('menu_items', function (Blueprint $table) {
        $table->id('item_id');
        $table->string('item_name');
        $table->text('description')->nullable();
        $table->decimal('price', 10, 2);
        $table->string('image_url')->nullable();
        $table->boolean('is_available')->default(true);
        $table->timestamps();
    });
    echo "menu_items table created successfully\n";
} else {
    echo "menu_items table already exists\n";
}

// Create order_items table
if (!Schema::hasTable('order_items')) {
    Schema::create('order_items', function (Blueprint $table) {
        $table->id('order_item_id');
        $table->foreignId('order_id')->constrained('orders', 'order_id')->onDelete('cascade');
        $table->foreignId('item_id')->constrained('menu_items', 'item_id')->onDelete('cascade');
        $table->integer('quantity')->default(1);
        $table->decimal('unit_price', 10, 2);
        $table->decimal('total_price', 10, 2);
        $table->timestamps();
    });
    echo "order_items table created successfully\n";
} else {
    echo "order_items table already exists\n";
}
