<?php

namespace App\Models;

use App\Observers\ProductObserver;
use Illuminate\Database\Eloquent\Attributes\ObservedBy;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Collection;

#[ObservedBy(ProductObserver::class)]
class Product extends Model
{
    public function images(): HasMany
    {
        return $this->hasMany(Image::class);
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function productGroup(): BelongsTo
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

    public function getPreviewImageUrlAttribute(): string|null
    {
        return $this->images()->first()->url ?? null;
    }

    public function scopeByCategories(Builder $query, Collection $categoryChildren): Builder
    {
        /*return $query->whereIn('category_id', array_column($categoryChildren, 'id'))
            ->whereNull('parent_id');*/



        return $query->whereIn('category_id', $categoryChildren->pluck('id'))
            ->whereNotNull('parent_id');


        /*return $query->whereIn('category_id', self::getArrayById($categoryChildren)->unique())
            ->whereNull('parent_id');*/

    }

    public static function getArrayById($list)
    {
        $result = collect();
        foreach ($list as $obj) {

            if (isset($obj->id))
                $result->push($obj->id);
            else
                $result = $result->merge(self::getArrayById( $obj));
        }
        return $result;

    }




}
