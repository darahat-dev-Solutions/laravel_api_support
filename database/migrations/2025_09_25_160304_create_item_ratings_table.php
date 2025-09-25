<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('item_ratings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('menu_item_id')->constrained('menu', 'item_id')->onDelete('cascade');
            $table->tinyInteger('rating')->unsigned()->comment('Rating from 1 to 5');
            $table->text('review')->nullable()->comment('Optional review text');
            $table->timestamps();

            // Ensure one rating per user per menu item
            $table->unique(['user_id', 'menu_item_id'], 'unique_user_menu_rating');

            // Add index for faster queries
            $table->index(['menu_item_id', 'rating']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('item_ratings');
    }
};
