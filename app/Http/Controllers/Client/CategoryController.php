<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Http\Resources\Product\ProductResource;
use App\Models\Category;
use App\Models\Product;
use App\Services\CategoryService;
use App\Services\ProductService;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function productIndex(Category $category)
    {

        $categoryChildren = CategoryService::getCategoryChildren($category);


        $products = ProductResource::collection(ProductService::productIndexByCategory($categoryChildren))->resolve();

        return inertia('Client/Category/ProductIndex', compact('products'));
    }
}
