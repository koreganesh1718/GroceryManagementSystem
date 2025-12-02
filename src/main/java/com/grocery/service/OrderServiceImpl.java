package com.grocery.service;

import com.grocery.dao.OrderDAO;
import com.grocery.model.CartItem;
import com.grocery.model.Order;
import com.grocery.dao.CartDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private CartDAO cartDAO;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int placeOrder(String username) {
        return orderDAO.placeOrder(username);
    }

    @Override
    public List<Order> getOrderHistory(String username) {
        return orderDAO.getOrderHistory(username);
    }

    @Override
    public List<CartItem> getOrderItems(int orderId) {
        return orderDAO.getOrderItems(orderId);
    }

    @Override
    public List<Order> getAllOrders() {
        return orderDAO.getAllOrders();
    }
    @Override
    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM g_orders WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
            Order o = new Order();
            o.setId(rs.getInt("id"));
            o.setUsername(rs.getString("username"));
            o.setTotalAmount(rs.getDouble("totalAmount"));
            o.setCreatedAt(rs.getString("orderDate"));
            return o;
        }, orderId);
    }

}
