<?php

namespace Modules\CoffeeShop\Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Modules\CoffeeShop\Models\Customer;
use Modules\CoffeeShop\Models\MenuItem;
use Modules\CoffeeShop\Models\Order;
use Modules\CoffeeShop\Models\OrderItem;
use Tests\TestCase;

class CoffeeShopApiTest extends TestCase
{
    use RefreshDatabase;

    /**
     * A basic feature test example.
     */
    public function test_example(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }

    public function test_get_test_route()
    {
        $response = $this->get('/api/coffee-shop/test');

        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
                'message' => 'CoffeeShop module API is working!',
            ]);
    }

    public function test_get_dashboard()
    {
        Customer::factory()->count(5)->create();
        MenuItem::factory()->count(10)->create();
        Order::factory()->count(3)->create(['status' => 'pending']);
        Order::factory()->count(2)->create(['status' => 'completed']);

        $response = $this->get('/api/coffee-shop/dashboard');

        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
                'message' => 'Dashboard data retrieved successfully',
            ])
            ->assertJsonStructure([
                'success',
                'data' => [
                    'total_customers',
                    'total_menu_items',
                    'total_orders',
                    'pending_orders',
                    'completed_orders',
                ],
                'message',
            ]);
    }

    public function test_get_recent_orders()
    {
        Order::factory()->count(15)->create();

        $response = $this->get('/api/coffee-shop/recent-orders');

        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
                'message' => 'Recent orders retrieved successfully',
            ])
            ->assertJsonCount(10, 'data');
    }

    public function test_get_popular_items()
    {
        MenuItem::factory()->count(10)->create(['is_available' => true]);

        $response = $this->get('/api/coffee-shop/popular-items');

        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
                'message' => 'Popular items retrieved successfully',
            ])
            ->assertJsonCount(5, 'data');
    }

    public function test_get_customers()
    {
        Customer::factory()->count(3)->create();

        $response = $this->get('/api/coffee-shop/customers');

        $response->assertStatus(200)
            ->assertJsonCount(3);
    }

    public function test_create_customer()
    {
        $customerData = [
            'name' => 'John Doe',
            'email' => 'john.doe@example.com',
            'phone' => '1234567890',
        ];

        $response = $this->postJson('/api/coffee-shop/customers', $customerData);

        $response->assertStatus(201)
            ->assertJsonFragment($customerData);

        $this->assertDatabaseHas('customers', $customerData);
    }

    public function test_get_customer()
    {
        $customer = Customer::factory()->create();

        $response = $this->get('/api/coffee-shop/customers/' . $customer->customer_id);

        $response->assertStatus(200)
            ->assertJsonFragment(['name' => $customer->name]);
    }

    public function test_update_customer()
    {
        $customer = Customer::factory()->create();

        $updatedData = [
            'name' => 'Jane Doe',
            'email' => 'jane.doe@example.com',
        ];

        $response = $this->putJson('/api/coffee-shop/customers/' . $customer->customer_id, $updatedData);

        $response->assertStatus(200)
            ->assertJsonFragment($updatedData);

        $this->assertDatabaseHas('customers', $updatedData);
    }

    public function test_delete_customer()
    {
        $customer = Customer::factory()->create();

        $response = $this->delete('/api/coffee-shop/customers/' . $customer->customer_id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('customers', ['customer_id' => $customer->customer_id]);
    }

    public function test_get_menu_items()
    {
        MenuItem::factory()->count(5)->create();

        $response = $this->get('/api/coffee-shop/menu-items');

        $response->assertStatus(200)
            ->assertJsonCount(5);
    }

    public function test_get_available_menu_items()
    {
        MenuItem::factory()->count(3)->create(['is_available' => true]);
        MenuItem::factory()->count(2)->create(['is_available' => false]);

        $response = $this->get('/api/coffee-shop/menu-items-available');

        $response->assertStatus(200)
            ->assertJsonCount(3);
    }

    public function test_create_menu_item()
    {
        $menuItemData = [
            'item_name' => 'Test Coffee',
            'description' => 'A delicious test coffee.',
            'price' => 4.99,
            'is_available' => true,
        ];

        $response = $this->postJson('/api/coffee-shop/menu-items', $menuItemData);

        $response->assertStatus(201)
            ->assertJsonFragment($menuItemData);

        $this->assertDatabaseHas('menu_items', $menuItemData);
    }

    public function test_get_menu_item()
    {
        $menuItem = MenuItem::factory()->create();

        $response = $this->get('/api/coffee-shop/menu-items/' . $menuItem->item_id);

        $response->assertStatus(200)
            ->assertJsonFragment(['item_name' => $menuItem->item_name]);
    }

    public function test_update_menu_item()
    {
        $menuItem = MenuItem::factory()->create();

        $updatedData = [
            'item_name' => 'Updated Coffee',
            'price' => 5.99,
        ];

        $response = $this->putJson('/api/coffee-shop/menu-items/' . $menuItem->item_id, $updatedData);

        $response->assertStatus(200)
            ->assertJsonFragment($updatedData);

        $this->assertDatabaseHas('menu_items', $updatedData);
    }

    public function test_delete_menu_item()
    {
        $menuItem = MenuItem::factory()->create();

        $response = $this->delete('/api/coffee-shop/menu-items/' . $menuItem->item_id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('menu_items', ['item_id' => $menuItem->item_id]);
    }

    public function test_get_orders()
    {
        Order::factory()->count(3)->create();

        $response = $this->get('/api/coffee-shop/orders');

        $response->assertStatus(200)
            ->assertJsonCount(3);
    }

    public function test_create_order()
    {
        $customer = Customer::factory()->create();
        $menuItem1 = MenuItem::factory()->create(['price' => 5.00]);
        $menuItem2 = MenuItem::factory()->create(['price' => 3.50]);

        $orderData = [
            'customer_id' => $customer->customer_id,
            'items' => [
                ['item_id' => $menuItem1->item_id, 'quantity' => 2],
                ['item_id' => $menuItem2->item_id, 'quantity' => 1],
            ],
        ];

        $response = $this->postJson('/api/coffee-shop/orders', $orderData);

        $response->assertStatus(201)
            ->assertJsonFragment(['customer_id' => $customer->customer_id]);

        $this->assertDatabaseHas('orders', ['customer_id' => $customer->customer_id]);
        $this->assertDatabaseHas('order_items', ['item_id' => $menuItem1->item_id, 'quantity' => 2]);
        $this->assertDatabaseHas('order_items', ['item_id' => $menuItem2->item_id, 'quantity' => 1]);
    }

    public function test_get_order()
    {
        $order = Order::factory()->create();

        $response = $this->get('/api/coffee-shop/orders/' . $order->order_.id);

        $response->assertStatus(200)
            ->assertJsonFragment(['order_id' => $order->order_id]);
    }

    public function test_update_order_status()
    {
        $order = Order::factory()->create(['status' => 'pending']);

        $updatedData = ['status' => 'completed'];

        $response = $this->putJson('/api/coffee-shop/orders/' . $order->order_id, $updatedData);

        $response->assertStatus(200)
            ->assertJsonFragment($updatedData);

        $this->assertDatabaseHas('orders', ['order_id' => $order->order_id, 'status' => 'completed']);
    }

    public function test_delete_order()
    {
        $order = Order::factory()->create();

        $response = $this->delete('/api/coffee-shop/orders/' . $order->order_id);

        $response->assertStatus(204);

        $this->assertDatabaseMissing('orders', ['order_id' => $order->order_id]);
    }

    public function test_get_orders_by_status()
    {
        Order::factory()->count(3)->create(['status' => 'pending']);
        Order::factory()->count(2)->create(['status' => 'completed']);

        $response = $this->get('/api/coffee-shop/orders/status/pending');

        $response->assertStatus(200)
            ->assertJsonCount(3);
    }

    public function test_get_orders_by_customer()
    {
        $customer = Customer::factory()->create();
        Order::factory()->count(3)->create(['customer_id' => $customer->customer_id]);
        Order::factory()->count(2)->create();

        $response = $this->get('/api/coffee-shop/orders/customer/' . $customer->customer_id);

        $response->assertStatus(200)
            ->assertJsonCount(3);
    }
}
