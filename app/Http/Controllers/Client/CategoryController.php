<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Http\Resources\Category\CategoryResource;
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
//dd($categoryChildren);
        $breadcrumbs = CategoryResource::collection(CategoryService::getCategoryParent($category)->reverse())->resolve();

        $products = ProductResource::collection(ProductService::productIndexByCategory($categoryChildren))->resolve();

        $category = CategoryResource::make($category)->resolve();

        return inertia('Client/Category/ProductIndex', compact('products', 'breadcrumbs', 'category'));
    }
}
