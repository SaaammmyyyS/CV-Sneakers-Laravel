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
        Schema::create('records', function (Blueprint $table) {
            $table->id();
            $table->string('admin_id');
            $table->string('product_id');
            $table->string('invoice_no');
            $table->string('quantity');
            $table->string('price');
            $table->string('total_price');
            $table->string('type');
            $table->string('stock_in_date')->nullable();
            $table->string('stock_out_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('records');
    }
};
