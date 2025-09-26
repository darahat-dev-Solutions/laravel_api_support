<?php

namespace Modules\CoffeeShop\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class ItemRating extends Model
{
    use HasFactory;

    protected $table = 'item_ratings';

    protected $fillable = [
        'user_id',
        'item_id',
        'rating',
        'review',
    ];

    protected $casts = [
        'rating' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Validation rules for rating values
     */
    public static function validationRules(): array
    {
        return [
            'user_id' => 'required|exists:users,id',
            'item_id' => 'required|exists:menu_items,item_id',
            'rating' => 'required|integer|between:1,5',
            'review' => 'nullable|string|max:1000',
        ];
    }

    /**
     * Get the user who made this rating.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the menu item that was rated.
     */
    public function menuItem()
    {
        return $this->belongsTo(MenuItem::class, 'item_id', 'item_id');
    }

    /**
     * Scope to filter ratings by a specific rating value.
     */
    public function scopeByRating($query, $rating)
    {
        return $query->where('rating', $rating);
    }

    /**
     * Scope to filter ratings with reviews.
     */
    public function scopeWithReview($query)
    {
        return $query->whereNotNull('review')->where('review', '!=', '');
    }

    /**
     * Scope to get recent ratings.
     */
    public function scopeRecent($query, $days = 30)
    {
        return $query->where('created_at', '>=', now()->subDays($days));
    }

    /**
     * Get rating with star display format.
     */
    public function getStarsAttribute()
    {
        return str_repeat('★', $this->rating) . str_repeat('☆', 5 - $this->rating);
    }

    /**
     * Create a new factory instance for the model.
     */
    protected static function newFactory()
    {
        return \Database\Factories\ItemRatingFactory::new();
    }
}