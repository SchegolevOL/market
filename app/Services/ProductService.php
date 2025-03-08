<?php

namespace App\Services;

use App\Models\Product;

class ProductService
{
    /**
     * @param array $data
     * @
     * @return Product
     */
    public static function store(array $data):Product
    {
        $product = Product::create($data['product']);
        ImageService::storeBatch($product, $data);
        return $product;
    }
    public static function update(array $data, Product $product)
    {

        $product->update($data['product']);
        ImageService::storeBatch($product, $data);
        return $product->fresh();
    }
}
