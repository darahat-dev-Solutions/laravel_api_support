<?php

namespace Modules\CoffeeShop\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\CoffeeShop\Models\MenuItem;
use Modules\CoffeeShop\Http\Requests\MenuItemRequest;
use Illuminate\Http\JsonResponse;

class MenuItemController extends Controller
{
    /**
     * Display a listing of menu items.
     */
    public function index(): JsonResponse
    {
        $menuItems = MenuItem::all();
        return response()->json($menuItems);
    }

    /**
     * Display only available menu items.
     */
    public function available(): JsonResponse
    {
        $menuItems = MenuItem::where('is_available', true)->get();
        return response()->json($menuItems);
    }

    /**
     * Store a newly created menu item.
     */
    public function store(MenuItemRequest $request): JsonResponse
    {
        $menuItem = MenuItem::create($request->validated());
        return response()->json($menuItem, 201);
    }

    /**
     * Display the specified menu item.
     */
    public function show(MenuItem $menuItem): JsonResponse
    {
        return response()->json($menuItem);
    }

    /**
     * Update the specified menu item.
     */
    public function update(MenuItemRequest $request, MenuItem $menuItem): JsonResponse
    {
        $menuItem->update($request->validated());
        return response()->json($menuItem);
    }

    /**
     * Remove the specified menu item.
     */
    public function destroy(MenuItem $menuItem): JsonResponse
    {
        $menuItem->delete();
        return response()->json(null, 204);
    }
}
