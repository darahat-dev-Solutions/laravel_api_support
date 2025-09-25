<?php

namespace Modules\CoffeeShop\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    protected $table = 'customers';
    protected $primaryKey = 'customers_id';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'img_url',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the orders for the customer.
     */
    public function orders()
    {
        return $this->hasMany(Order::class, 'customer_id', 'customers_id');
    }

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory()
    {
        return \Database\Factories\CustomerFactory::new();
    }
}
