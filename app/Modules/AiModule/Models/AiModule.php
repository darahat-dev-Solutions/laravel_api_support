<?php

namespace App\Modules\AiModule\Models;

use App\Modules\AiModule\Database\Factories\AiModuleFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AiModule extends Model
{
    use HasFactory;

    protected $fillable = [
        'module_id',
        'name',
        'description',
        'prompt',
        'created_at',
        'updated_at',
    ];



    /**
     * Create a new factory instance for the model.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    protected static function newFactory()
    {
        return AiModuleFactory::new();
    }
}