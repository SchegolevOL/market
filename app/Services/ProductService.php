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
        ProductService::attachBatchParams($product, $data);
        ImageService::storeBatch($product, $data);
        return $product;
    }
    public static function update(array $data, Product $product)
    {

        $product->update($data['product']);
        ImageService::storeBatch($product, $data);
        return $product->fresh();
    }
    public static function attachBatchParams(Product $product, array $data):void
    {
        foreach ($data['params'] as $param) {
            $product->params()->attach($param['id'], ['value' => $param['value']]);
        }
    }

}
