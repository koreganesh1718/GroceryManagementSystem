package com.grocery.dao;

import com.grocery.model.CartItem;
import com.grocery.model.Order;

import java.util.List;

public interface OrderDAO {
    int placeOrder(String username);
    List<Order> getOrderHistory(String username);
    List<CartItem> getOrderItems(int orderId);
    List<Order> getAllOrders();


}
