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
       Schema::create('ai_modules', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description');
            $table->text('prompt');
            $table->json('tools')->nullable(); // <-- new field for tool definitions
            $table->timestamps(); // shorter version of created_at + updated_at
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ai_modules');
    }
};
