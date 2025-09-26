<?php

namespace Modules\CoffeeShop\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    use HasFactory;

    protected $table = 'menu';
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
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the order items for the menu item.
     */
    public function orderItems()
    {
        return $this->hasMany(OrderItem::class, 'item_id', 'item_id');
    }

    /**
     * Get the ratings for the menu item.
     */
    public function ratings()
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
     * Get star display for average rating.
     */
    public function getStarsAttribute()
    {
        $rating = round($this->average_rating);
        return str_repeat('★', $rating) . str_repeat('☆', 5 - $rating);
    }

    /**
     * Scope a query to only include available items.
     */
    public function scopeAvailable($query)
    {
        return $query->where('is_available', true);
    }

    /**
     * Scope to filter items by minimum rating.
     */
    public function scopeByMinRating($query, $minRating = 4.0)
    {
        return $query->whereHas('ratings', function ($q) use ($minRating) {
            $q->havingRaw('AVG(rating) >= ?', [$minRating]);
        });
    }

    /**
     * Scope to order by average rating (highest first).
     */
    public function scopeOrderByRating($query)
    {
        return $query->withAvg('ratings', 'rating')
                    ->orderByDesc('ratings_avg_rating');
    }

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory()
    {
        return \Database\Factories\MenuFactory::new();
    }
}