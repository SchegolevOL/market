<?php

namespace App\Services;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class ProductService
{
    /**
     * @param array $data
     * @
     * @return Product
     */
    public static function store(array $data):Product
    {
        try {
            DB::beginTransaction();
            $product = Product::create($data['product']);
            ProductService::attachBatchParams($product, $data);
            ImageService::storeBatch($product, $data);
            DB::commit();
        }catch(\Exception $exception){
            DB::rollBack();
            abort(500, $exception->getMessage());
        }



        return $product;
    }
    public static function update(array $data, Product $product)
    {
        try {
            DB::beginTransaction();
            $product->update($data['product']);
            ProductService::syncBatchParams($product, $data);
            ImageService::storeBatch($product, $data);
            DB::commit();
        }catch(\Exception $exception){
            DB::rollBack();
            abort(500, $exception->getMessage());
        }




        return $product->fresh();
    }
    public static function attachBatchParams(Product $product, array $data):void
    {
        foreach ($data['params'] as $param) {
            $product->params()->attach($param['id'], ['value' => $param['value']]);
        }
    }
    public static function syncBatchParams(Product $product, array $data):void
    {
        $product->params()->detach();
        ProductService::attachBatchParams($product, $data);
    }

    public static function productIndexByCategory(array $categoryChildren)
    {


        return Product::byCategories($categoryChildren)->get();
    }

    private static function findArray ($arr, $key)
    {

    }


}
