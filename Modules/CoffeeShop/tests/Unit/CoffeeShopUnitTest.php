<?php

namespace Modules\CoffeeShop\Tests\Unit;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Modules\CoffeeShop\Http\Controllers\CoffeeShopController;
use Modules\CoffeeShop\Http\Controllers\CustomerController;
use Modules\CoffeeShop\Http\Controllers\MenuItemController;
use Modules\CoffeeShop\Http\Controllers\OrderController;
use Modules\CoffeeShop\Models\Customer;
use Modules\CoffeeShop\Models\MenuItem;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Http\Requests\CustomerRequest;
use Modules\CoffeeShop\Http\Requests\MenuItemRequest;
use Modules\CoffeeShop\Http\Requests\OrderRequest;
use Illuminate\Http\JsonResponse;

class CoffeeShopUnitTest extends TestCase
{
    use RefreshDatabase;

    public function test_coffeeshop_controller_dashboard()
    {
        $controller = new CoffeeShopController();
        $response = $controller->dashboard();
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertTrue($response->getData()->success);
    }

    public function test_coffeeshop_controller_recent_orders()
    {
        Order::factory()->count(5)->create();
        $controller = new CoffeeShopController();
        $response = $controller->recentOrders();
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertTrue($response->getData()->success);
        $this->assertCount(5, $response->getData()->data);
    }

    public function test_coffeeshop_controller_popular_items()
    {
        MenuItem::factory()->count(5)->create();
        $controller = new CoffeeShopController();
        $response = $controller->popularItems();
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertTrue($response->getData()->success);
        $this->assertCount(5, $response->getData()->data);
    }

    public function test_customer_controller_index()
    {
        Customer::factory()->count(3)->create();
        $controller = new CustomerController();
        $response = $controller->index();
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertCount(3, $response->getData());
    }

    public function test_customer_controller_store()
    {
        $request = new CustomerRequest();
        $request->replace([
            'name' => 'Test Customer',
            'email' => 'test@example.com',
            'phone' => '1234567890'
        ]);

        $controller = new CustomerController();
        $response = $controller->store($request);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals('Test Customer', $response->getData()->name);
    }

    public function test_customer_controller_show()
    {
        $customer = Customer::factory()->create();
        $controller = new CustomerController();
        $response = $controller->show($customer);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals($customer->name, $response->getData()->name);
    }

    public function test_customer_controller_update()
    {
        $customer = Customer::factory()->create();
        $request = new CustomerRequest();
        $request->replace([
            'name' => 'Updated Customer',
            'email' => 'updated@example.com',
            'phone' => '0987654321'
        ]);

        $controller = new CustomerController();
        $response = $controller->update($request, $customer);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals('Updated Customer', $response->getData()->name);
    }

    public function test_customer_controller_destroy()
    {
        $customer = Customer::factory()->create();
        $controller = new CustomerController();
        $response = $controller->destroy($customer);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals(204, $response->getStatusCode());
    }

    public function test_menuitem_controller_index()
    {
        MenuItem::factory()->count(3)->create();
        $controller = new MenuItemController();
        $response = $controller->index();
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertCount(3, $response->getData());
    }

    public function test_menuitem_controller_available()
    {
        MenuItem::factory()->create(['is_available' => true]);
        MenuItem::factory()->create(['is_available' => false]);
        $controller = new MenuItemController();
        $response = $controller->available();
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertCount(1, $response->getData());
    }

    public function test_menuitem_controller_store()
    {
        $request = new MenuItemRequest();
        $request->replace([
            'item_name' => 'Test Item',
            'description' => 'Test Description',
            'price' => 9.99,
            'is_available' => true
        ]);

        $controller = new MenuItemController();
        $response = $controller->store($request);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals('Test Item', $response->getData()->item_name);
    }

    public function test_menuitem_controller_show()
    {
        $menuItem = MenuItem::factory()->create();
        $controller = new MenuItemController();
        $response = $controller->show($menuItem);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals($menuItem->item_name, $response->getData()->item_name);
    }

    public function test_menuitem_controller_update()
    {
        $menuItem = MenuItem::factory()->create();
        $request = new MenuItemRequest();
        $request->replace([
            'item_name' => 'Updated Item',
            'description' => 'Updated Description',
            'price' => 19.99,
            'is_available' => false
        ]);

        $controller = new MenuItemController();
        $response = $controller->update($request, $menuItem);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals('Updated Item', $response->getData()->item_name);
    }

    public function test_menuitem_controller_destroy()
    {
        $menuItem = MenuItem::factory()->create();
        $controller = new MenuItemController();
        $response = $controller->destroy($menuItem);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals(204, $response->getStatusCode());
    }

    public function test_order_controller_index()
    {
        Order::factory()->count(3)->create();
        $controller = new OrderController();
        $response = $controller->index();
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertCount(3, $response->getData());
    }

    public function test_order_controller_store()
    {
        $customer = Customer::factory()->create();
        $menuItem = MenuItem::factory()->create();

        $request = new OrderRequest();
        $request->replace([
            'customer_id' => $customer->customer_id,
            'items' => [
                ['item_id' => $menuItem->item_id, 'quantity' => 2]
            ]
        ]);

        $controller = new OrderController();
        $response = $controller->store($request);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals($customer->customer_id, $response->getData()->customer_id);
    }

    public function test_order_controller_show()
    {
        $order = Order::factory()->create();
        $controller = new OrderController();
        $response = $controller->show($order);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals($order->order_id, $response->getData()->order_id);
    }

    public function test_order_controller_update()
    {
        $order = Order::factory()->create();
        $request = new OrderRequest();
        $request->replace([
            'status' => 'completed'
        ]);

        $controller = new OrderController();
        $response = $controller->update($request, $order);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals('completed', $response->getData()->status);
    }

    public function test_order_controller_destroy()
    {
        $order = Order::factory()->create();
        $controller = new OrderController();
        $response = $controller->destroy($order);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertEquals(204, $response->getStatusCode());
    }

    public function test_order_controller_by_status()
    {
        Order::factory()->create(['status' => 'pending']);
        Order::factory()->create(['status' => 'completed']);
        $controller = new OrderController();
        $response = $controller->byStatus('pending');
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertCount(1, $response->getData());
    }

    public function test_order_controller_by_customer()
    {
        $customer = Customer::factory()->create();
        Order::factory()->create(['customer_id' => $customer->customer_id]);
        Order::factory()->create();
        $controller = new OrderController();
        $response = $controller->byCustomer($customer->customer_id);
        $this->assertInstanceOf(JsonResponse::class, $response);
        $this->assertCount(1, $response->getData());
    }
}
