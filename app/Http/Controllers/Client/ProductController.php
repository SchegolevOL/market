<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Http\Resources\Product\ProductResource;
use App\Models\Product;

class ProductController extends Controller
{
    public function index()
    {
        $products = ProductResource::collection(Product::query()->whereNull('parent_id')->get())->resolve();
        //$products = ProductResource::collection(Product::all())->resolve();

        return inertia('Client/Product/Index', compact('products'));
    }
}
