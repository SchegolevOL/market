<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Product\StoreRequest;
use App\Http\Requests\Admin\Product\UpdateRequest;
use App\Http\Resources\Category\CategoryResource;
use App\Http\Resources\Param\ParamResource;
use App\Http\Resources\Product\ProductResource;
use App\Http\Resources\Product\ProductShowResource;
use App\Http\Resources\ProductGroup\ProductGroupResource;
use App\Models\Category;
use App\Models\Param;
use App\Models\Product;
use App\Models\ProductGroup;
use App\Services\ProductService;
use Illuminate\Http\Response;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::query()->whereNull('parent_id')->get();
        $products = ProductResource::collection($products)->resolve();

        return inertia("Admin/Product/Index", compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = CategoryResource::collection(Category::all())->resolve();
        $productGroups = ProductGroupResource::collection(ProductGroup::all())->resolve();
        $params = ParamResource::collection(Param::all())->resolve();
        return inertia("Admin/Product/Create", compact('categories', 'productGroups', 'params'));
    }
    /**
     * Show the form for creating a new resource.
     */
    public function createChildren(Product $product)
    {
        $categories = CategoryResource::collection(Category::all())->resolve();
        $productGroups = ProductGroupResource::collection(ProductGroup::all())->resolve();
        $params = ParamResource::collection(Param::all())->resolve();
        $product = ProductResource::make($product)->resolve();
        return inertia("Admin/Product/CreateChild", compact('categories', 'productGroups', 'params', 'product'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRequest $request)
    {

        $data = $request->validationData();


        $product = ProductService::store($data);
        return ProductResource::make($product)->response();
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        $product = ProductShowResource::make($product)->resolve();

        return inertia("Admin/Product/Show", compact('product'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {

        $product = ProductResource::make($product)->resolve();
        $categories = CategoryResource::collection(Category::all())->resolve();
        $productGroups = ProductGroupResource::collection(ProductGroup::all())->resolve();
        $params = ParamResource::collection(Param::all())->resolve();


        return inertia("Admin/Product/Edit", compact('product', 'categories', 'productGroups', 'params'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRequest $request, Product $product)
    {
        $data = $request->validationData();

        $product = ProductService::update($data, $product);

        return ProductResource::make($product)->response();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {

        $product->delete();
        return response()->json(['message'=>'success'], Response::HTTP_OK);
    }
    public function indexChildren(Product $product)
    {
        return ProductResource::collection($product->children)->resolve();
    }


}
