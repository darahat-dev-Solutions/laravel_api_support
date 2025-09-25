<?php

namespace Modules\CoffeeShop\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\DB;

class OrderItem extends Model
{
    use HasFactory;

    protected $table = 'order_items';

    protected $fillable = [
        'order_id',
        'item_id',
        'quantity',
        'price',
    ];

    protected $casts = [
        'quantity' => 'integer',
        'price' => 'decimal:2',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the order that owns the order item.
     */
    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class, 'order_id', 'order_id');
    }

    /**
     * Get the menu item that this order item refers to.
     */
    public function menuItem(): BelongsTo
    {
        return $this->belongsTo(Menu::class, 'item_id', 'item_id');
    }

    /**
     * Get the subtotal for this order item.
     */
    public function getSubtotalAttribute()
    {
        return $this->price * $this->quantity;
    }

    /**
     * Boot the model.
     */
    protected static function boot()
    {
        parent::boot();

        // Auto-update order total when order items are created/updated/deleted
        static::created(function ($orderItem) {
            $orderItem->order->update([
                'total_price' => $orderItem->order->orderItems()->sum(DB::raw('price * quantity'))
            ]);
        });

        static::updated(function ($orderItem) {
            $orderItem->order->update([
                'total_price' => $orderItem->order->orderItems()->sum(DB::raw('price * quantity'))
            ]);
        });

        static::deleted(function ($orderItem) {
            $orderItem->order->update([
                'total_price' => $orderItem->order->orderItems()->sum(DB::raw('price * quantity'))
            ]);
        });
    }

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory()
    {
        return \Database\Factories\OrderItemFactory::new();
    }
}
