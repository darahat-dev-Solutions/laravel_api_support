<?php

namespace Modules\CoffeeShop\Models;

use Modules\CoffeeShop\Database\Factories\MenuItemFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class MenuItem extends Model
{
    use HasFactory;

    protected $table = 'menu_items';
    protected $primaryKey = 'item_id';

    protected $fillable = [
        'item_name',
        'description',
        'price',
        'image_url',
        'is_available',
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'is_available' => 'boolean',
    ];

    /**
     * Get the order items for the menu item.
     */
    public function orderItems(): HasMany
    {
        return $this->hasMany(OrderItem::class, 'item_id', 'item_id');
    }

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory()
    {
        return MenuItemFactory::new();
    }
}
