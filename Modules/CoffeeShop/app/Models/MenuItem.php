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
     * Get the ratings for the menu item.
     */
    public function ratings(): HasMany
    {
        return $this->hasMany(ItemRating::class, 'item_id', 'item_id');
    }

    /**
     * Get the average rating for the menu item.
     */
    public function getAverageRatingAttribute()
    {
        return $this->ratings()->avg('rating') ?? 0;
    }

    /**
     * Get the total number of ratings for the menu item.
     */
    public function getRatingsCountAttribute()
    {
        return $this->ratings()->count();
    }

    /**
     * Get formatted average rating (e.g., 4.5/5.0).
     */
    public function getFormattedRatingAttribute()
    {
        $avg = $this->average_rating;
        return $avg > 0 ? number_format($avg, 1) . '/5.0' : 'No ratings';
    }

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory()
    {
        return MenuItemFactory::new();
    }
}
