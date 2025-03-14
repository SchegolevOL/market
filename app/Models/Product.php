<?php

namespace App\Models;

use App\Observers\ProductObserver;
use Illuminate\Database\Eloquent\Attributes\ObservedBy;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Nette\Utils\ImageType;

#[ObservedBy(ProductObserver::class)]
class Product extends Model
{
    public function images():HasMany
    {
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
    public function params(): BelongsToMany
    {
        return $this->belongsToMany(Param::class)->withPivot('value');
    }
    public function children(): HasMany
    {
        return $this->hasMany(Product::class, 'parent_id', 'id');
    }

    public function getPreviewImageUrlAttribute():string|null
    {
        return $this->images()->first()->url ?? null;
    }

}
