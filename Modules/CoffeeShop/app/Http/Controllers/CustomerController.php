<?php

namespace Modules\CoffeeShop\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\CoffeeShop\Models\Customer;
use Modules\CoffeeShop\Http\Requests\CustomerRequest;
use Illuminate\Http\JsonResponse;

class CustomerController extends Controller
{
    /**
     * Display a listing of customers.
     */
    public function index(): JsonResponse
    {
        $customers = Customer::with('orders')->get();
        return response()->json($customers);
    }

    /**
     * Store a newly created customer.
     */
    public function store(CustomerRequest $request): JsonResponse
    {
        $customer = Customer::create($request->validated());
        return response()->json($customer, 201);
    }

    /**
     * Display the specified customer.
     */
    public function show(Customer $customer): JsonResponse
    {
        $customer->load('orders.orderItems.menuItem');
        return response()->json($customer);
    }

    /**
     * Update the specified customer.
     */
    public function update(CustomerRequest $request, Customer $customer): JsonResponse
    {
        $customer->update($request->validated());
        return response()->json($customer);
    }

    /**
     * Remove the specified customer.
     */
    public function destroy(Customer $customer): JsonResponse
    {
        $customer->delete();
        return response()->json(null, 204);
    }
}
