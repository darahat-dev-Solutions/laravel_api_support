<?php

namespace Modules\CoffeeShop\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\MenuItem;
use Modules\CoffeeShop\Models\Customer;
use Illuminate\Http\JsonResponse;

class CoffeeShopController extends Controller
{
    /**
     * Display dashboard statistics.
     */
    public function dashboard(): JsonResponse
    {
        $stats = [
            'total_customers' => Customer::count(),
            'total_menu_items' => MenuItem::count(),
            'available_menu_items' => MenuItem::where('is_available', true)->count(),
            'total_orders' => Order::count(),
            'pending_orders' => Order::where('status', 'pending')->count(),
            'preparing_orders' => Order::where('status', 'preparing')->count(),
            'ready_orders' => Order::where('status', 'ready')->count(),
            'completed_orders' => Order::where('status', 'completed')->count(),
            'cancelled_orders' => Order::where('status', 'cancelled')->count(),
            'total_revenue' => Order::whereIn('status', ['completed'])->sum('total_price'),
        ];

        return response()->json($stats);
    }

    /**
     * Get recent orders.
     */
    public function recentOrders(): JsonResponse
    {
        $orders = Order::with(['customer', 'orderItems.menuItem'])
                      ->orderBy('order_time', 'desc')
                      ->limit(10)
                      ->get();

        return response()->json($orders);
    }

    /**
     * Get popular menu items.
     */
    public function popularItems(): JsonResponse
    {
        $popularItems = MenuItem::withCount('orderItems')
                                ->orderBy('order_items_count', 'desc')
                                ->limit(10)
                                ->get();

        return response()->json($popularItems);
    }
}
