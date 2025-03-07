<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    public function images():HasMany{
        return $this->hasMany(Image::class);
    }
    public function category():BelongsTo
    {
        return $this->belongsTo(Category::class);
    }
    public function productGroup():BelongsTo
    {
        return $this->belongsTo(ProductGroup::class);
    }

}
