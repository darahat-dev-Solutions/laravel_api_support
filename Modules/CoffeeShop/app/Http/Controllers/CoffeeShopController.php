<?php

namespace Modules\CoffeeShop\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Modules\CoffeeShop\Models\MenuItem;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\Customer;
use Illuminate\Support\Facades\DB;

class CoffeeShopController extends Controller
{
    /**
     * Display dashboard statistics.
     */
       public function dashboard(): JsonResponse
    {
        try {
            $stats = [
                'total_customers' => Customer::count(),
                'total_menu_items' => MenuItem::count(),
                'total_orders' => Order::count(),
                'pending_orders' => Order::where('status', 'pending')->count(),
                'completed_orders' => Order::where('status', 'completed')->count(),
            ];

            return response()->json([
                'success' => true,
                'data' => $stats,
                'message' => 'Dashboard data retrieved successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to load dashboard data',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    /**
     * Get recent orders.
     */
     public function recentOrders(): JsonResponse
    {
        try {
            $recentOrders = Order::with('customer')
                ->orderBy('created_at', 'desc')
                ->take(10)
                ->get();

            return response()->json([
                'success' => true,
                'data' => $recentOrders,
                'message' => 'Recent orders retrieved successfully',
                'count' => $recentOrders->count()
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to retrieve recent orders',
                'error' => $e->getMessage()
            ], 500);
        }
    }
     /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        try {
            return response()->json([
                'success' => true,
                'message' => 'Coffee Shop API is working!',
                'available_endpoints' => [
                    'dashboard' => '/api/v1/coffee-shop/dashboard',
                    'popular_items' => '/api/v1/coffee-shop/popular-items',
                    'recent_orders' => '/api/v1/coffee-shop/recent-orders',
                    'customers' => '/api/v1/coffee-shop/customers',
                    'menu_items' => '/api/v1/coffee-shop/menu-items',
                    'orders' => '/api/v1/coffee-shop/orders'
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error occurred',
                'error' => $e->getMessage()
            ], 500);
        }
    }
        /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        return response()->json([
            'success' => true,
            'message' => 'Store method not implemented yet'
        ]);
    }
 /**
     * Show the specified resource.
     */
    public function show($id): JsonResponse
    {
        return response()->json([
            'success' => true,
            'message' => 'Show method not implemented yet'
        ]);
    }
      /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id): JsonResponse
    {
        return response()->json([
            'success' => true,
            'message' => 'Update method not implemented yet'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id): JsonResponse
    {
        return response()->json([
            'success' => true,
            'message' => 'Delete method not implemented yet'
        ]);
    }
    /**
     * Get popular menu items.
     */

    public function popularItems(): JsonResponse
    {
        try {
            $popularItems = MenuItem::where('is_available', true)
                ->take(5)
                ->get(['item_id', 'item_name', 'description', 'price', 'image_url']);

            return response()->json([
                'success' => true,
                'data' => $popularItems,
                'message' => 'Popular items retrieved successfully',
                'count' => $popularItems->count()
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to retrieve popular items',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}