package com.grocery.dao;

import com.grocery.model.CartItem;
import com.grocery.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int placeOrder(String username) {

        // 1️⃣ Fetch cart items
        String sql = """
            SELECT p.id, p.name, p.price, p.category, c.quantity
            FROM g_cart c
            JOIN g_products p ON c.product_id = p.id
            WHERE c.username = ?
        """;

        List<CartItem> cartItems = jdbcTemplate.query(sql, (rs, rowNum) -> {
            CartItem item = new CartItem();
            item.setProductId(rs.getInt("id"));
            item.setName(rs.getString("name"));
            item.setPrice(rs.getDouble("price"));
            item.setQuantity(rs.getInt("quantity"));
            item.setCategory(rs.getString("category"));
            return item;
        }, username);

        if (cartItems.isEmpty()) {
            return 0;
        }

        // 2️⃣ Total Amount
        double total = cartItems.stream()
                .mapToDouble(i -> i.getPrice() * i.getQuantity())
                .sum();

        // 3️⃣ Insert order into g_orders
        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(
                    "INSERT INTO g_orders(username, totalAmount) VALUES (?, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );
            ps.setString(1, username);
            ps.setDouble(2, total);
            return ps;
        }, keyHolder);

        int orderId = keyHolder.getKey().intValue();

        // 4️⃣ Insert order items + Reduce stock
        for (CartItem item : cartItems) {

            // Insert into g_order_items
            jdbcTemplate.update("""
                INSERT INTO g_order_items(order_id, product_name, price, quantity)
                VALUES (?, ?, ?, ?)
            """, orderId, item.getName(), item.getPrice(), item.getQuantity());

            // Reduce stock
            jdbcTemplate.update("""
                UPDATE g_products
                SET quantity = quantity - ?
                WHERE id = ?
            """, item.getQuantity(), item.getProductId());
        }

        // 5️⃣ Clear Cart
        jdbcTemplate.update("DELETE FROM g_cart WHERE username = ?", username);

        return orderId;
    }


    // 6️⃣ ORDER HISTORY (NO CHANGE NEEDED)
    @Override
    public List<Order> getOrderHistory(String username) {
        String sql = "SELECT id, username, totalAmount, orderDate FROM g_orders WHERE username=? ORDER BY id DESC";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setUsername(rs.getString("username"));
            order.setTotalAmount(rs.getDouble("totalAmount"));
            order.setCreatedAt(rs.getTimestamp("orderDate").toString());
            return order;
        }, username);
    }


    // ⭐ UPDATED — FETCH CATEGORY ALSO
    @Override
    public List<CartItem> getOrderItems(int orderId) {

        String sql = """
            SELECT oi.product_name, oi.price, oi.quantity, p.category
            FROM g_order_items oi
            JOIN g_products p 
                ON p.name = oi.product_name
            WHERE oi.order_id = ?
        """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            CartItem item = new CartItem();

            String fullName = rs.getString("product_name");
            String[] parts = fullName.split(" ", 2);

            item.setName(parts[0]);
            item.setUnit(parts.length > 1 ? parts[1] : "");
            item.setPrice(rs.getDouble("price"));
            item.setQuantity(rs.getInt("quantity"));
            item.setCategory(rs.getString("category"));

            return item;
        }, orderId);
    }


    @Override
    public List<Order> getAllOrders() {
        return jdbcTemplate.query("""
            SELECT id, username, totalAmount, orderDate 
            FROM g_orders ORDER BY id DESC
        """, (rs, rowNum) -> {
            Order o = new Order();
            o.setId(rs.getInt("id"));
            o.setUsername(rs.getString("username"));
            o.setTotalAmount(rs.getDouble("totalAmount"));
            o.setCreatedAt(rs.getTimestamp("orderDate").toString());
            return o;
        });
    }
}
