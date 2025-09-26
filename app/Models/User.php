<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Modules\CoffeeShop\Models\ItemRating;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    /**
     * Get the item ratings made by the user.
     */
    public function itemRatings()
    {
        return $this->hasMany(ItemRating::class);
    }

    /**
     * Get the user's average rating given to items.
     */
    public function getAverageRatingGivenAttribute()
    {
        return $this->itemRatings()->avg('rating') ?? 0;
    }

    /**
     * Get the count of ratings made by the user.
     */
    public function getRatingsCountAttribute()
    {
        return $this->itemRatings()->count();
    }

    /**
     * Check if user has rated a specific menu item.
     */
    public function hasRatedItem($menuItemId)
    {
        return $this->itemRatings()->where('item_id', $menuItemId)->exists();
    }

    /**
     * Get user's rating for a specific menu item.
     */
    public function getRatingForItem($menuItemId)
    {
        return $this->itemRatings()->where('menu_item_id', $menuItemId)->first();
    }
}