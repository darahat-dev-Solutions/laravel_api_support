<?php

namespace App\Modules\Product\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\Product\Services\ProductService;
use App\Modules\Product\Requests\ProductRequest;
use App\Modules\Product\Resources\ProductResource;
use App\Modules\Product\Models\Product;

class ProductController extends Controller
{
    protected $productService;

    public function __construct(ProductService $productService)
    {
        $this->productService = $productService;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */
    public function index()
    {
        $products = $this->productService->getAllProducts();
        return ProductResource::collection($products);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Modules\Product\Requests\ProductRequest  $request
     * @return \App\Modules\Product\Resources\ProductResource
     */
    public function store(ProductRequest $request)
    {
        $product = $this->productService->createProduct($request->validated());
        return new ProductResource($product);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Modules\Product\Models\Product  $product
     * @return \App\Modules\Product\Resources\ProductResource
     */
    public function show(Product $product)
    {
        return new ProductResource($product);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Modules\Product\Requests\ProductRequest  $request
     * @param  \App\Modules\Product\Models\Product  $product
     * @return \App\Modules\Product\Resources\ProductResource
     */
    public function update(ProductRequest $request, Product $product)
    {
        $product = $this->productService->updateProduct($product, $request->validated());
        return new ProductResource($product);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Modules\Product\Models\Product  $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Product $product)
    {
        $this->productService->deleteProduct($product);
        return response()->json(null, 24);
    }
}
