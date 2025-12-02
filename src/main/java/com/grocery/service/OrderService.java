package com.grocery.service;

import com.grocery.model.CartItem;
import com.grocery.model.Order;

import java.util.List;

public interface OrderService {
    int placeOrder(String username);
    List<Order> getOrderHistory(String username);
    List<CartItem> getOrderItems(int orderId);
    List<Order> getAllOrders();
    Order getOrderById(int orderId);

}

