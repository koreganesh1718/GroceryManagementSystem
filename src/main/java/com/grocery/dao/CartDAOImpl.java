package com.grocery.dao;

import com.grocery.model.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDAOImpl implements CartDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void addToCart(String username, int productId, int quantity) {

        Integer count = jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM g_cart WHERE username=? AND product_id=?",
                Integer.class,
                username, productId
        );

        if (count != null && count > 0) {
            jdbcTemplate.update(
                    "UPDATE g_cart SET quantity = quantity + ? WHERE username=? AND product_id=?",
                    quantity, username, productId
            );
        } else {
            jdbcTemplate.update(
                    "INSERT INTO g_cart(username, product_id, quantity) VALUES (?, ?, ?)",
                    username, productId, quantity
            );
        }
    }

    @Override
    public List<CartItem> getCartItems(String username) {

        String sql = """
        SELECT c.id, c.product_id, p.name, p.price, c.quantity, p.category
        FROM g_cart c
        JOIN g_products p ON c.product_id = p.id
        WHERE c.username=?
    """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            CartItem item = new CartItem();
            item.setId(rs.getInt("id"));
            item.setProductId(rs.getInt("product_id"));
            item.setName(rs.getString("name"));   // e.g. "Rice 1 kg"
            item.setPrice(rs.getDouble("price"));
            item.setQuantity(rs.getInt("quantity"));
            item.setCategory(rs.getString("category")); // NEW
            return item;
        }, username);
    }




    @Override
    public double getCartTotal(String username) {

        String sql = """
            SELECT SUM(p.price * c.quantity)
            FROM g_cart c
            JOIN g_products p ON c.product_id = p.id
            WHERE c.username=?
        """;

        Double total = jdbcTemplate.queryForObject(sql, Double.class, username);
        return (total == null ? 0.0 : total);
    }

    @Override
    public void clearCart(String username) {
        jdbcTemplate.update("DELETE FROM g_cart WHERE username=?", username);
    }

    @Override
    public void updateQuantity(String username, int productId, int quantity) {
        jdbcTemplate.update(
                "UPDATE g_cart SET quantity = ? WHERE username = ? AND product_id = ?",
                quantity, username, productId
        );
    }

    @Override
    public void removeItem(String username, int productId) {
        jdbcTemplate.update(
                "DELETE FROM g_cart WHERE username = ? AND product_id = ?",
                username, productId
        );
    }
}
