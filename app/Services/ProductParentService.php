<?php

namespace App\Services;

use App\Models\ProductParent;

class ProductParentService
{
    public static function store(array $data):ProductParent
    {
        return ProductParent::create($data);
    }
    public static function update(array $data, ProductParent $productParent)
    {
        $productParent->update($data);
        return $productParent->fresh();
    }
}
