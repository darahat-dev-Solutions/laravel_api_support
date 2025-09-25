<?php

namespace Modules\CoffeeShop\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\OrderItem;
use Modules\CoffeeShop\Models\MenuItem;
use Modules\CoffeeShop\Http\Requests\OrderRequest;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    /**
     * Display a listing of orders.
     */
    public function index(): JsonResponse
    {
        $orders = Order::with(['customer', 'orderItems.menuItem'])->get();
        return response()->json($orders);
    }

    /**
     * Store a newly created order.
     */
    public function store(OrderRequest $request): JsonResponse
    {
        try {
            DB::beginTransaction();

            $order = Order::create([
                'customer_id' => $request->customer_id,
                'order_time' => $request->order_time ?? now(),
                'status' => $request->status ?? 'pending',
                'total_price' => 0,
            ]);

            $totalPrice = 0;

            foreach ($request->items as $item) {
                $menuItem = MenuItem::findOrFail($item['item_id']);
                $quantity = $item['quantity'];
                $unitPrice = $menuItem->price;
                $itemTotal = $quantity * $unitPrice;

                OrderItem::create([
                    'order_id' => $order->order_id,
                    'item_id' => $item['item_id'],
                    'quantity' => $quantity,
                    'unit_price' => $unitPrice,
                    'total_price' => $itemTotal,
                ]);

                $totalPrice += $itemTotal;
            }

            $order->update(['total_price' => $totalPrice]);

            DB::commit();

            $order->load(['customer', 'orderItems.menuItem']);
            return response()->json($order, 201);

        } catch (\Exception $e) {
            DB::rollback();
            return response()->json(['error' => 'Failed to create order'], 500);
        }
    }

    /**
     * Display the specified order.
     */
    public function show(Order $order): JsonResponse
    {
        $order->load(['customer', 'orderItems.menuItem']);
        return response()->json($order);
    }

    /**
     * Update the specified order (mainly status).
     */
    public function update(OrderRequest $request, Order $order): JsonResponse
    {
        $order->update($request->only(['status']));
        $order->load(['customer', 'orderItems.menuItem']);
        return response()->json($order);
    }

    /**
     * Remove the specified order.
     */
    public function destroy(Order $order): JsonResponse
    {
        $order->delete();
        return response()->json(null, 204);
    }

    /**
     * Get orders by status.
     */
    public function byStatus(string $status): JsonResponse
    {
        $orders = Order::with(['customer', 'orderItems.menuItem'])
                      ->where('status', $status)
                      ->get();
        return response()->json($orders);
    }

    /**
     * Get orders for a specific customer.
     */
    public function byCustomer(int $customerId): JsonResponse
    {
        $orders = Order::with(['customer', 'orderItems.menuItem'])
                      ->where('customer_id', $customerId)
                      ->get();
        return response()->json($orders);
    }
}
