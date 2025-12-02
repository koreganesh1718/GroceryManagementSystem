package com.grocery.dao;

import com.grocery.model.TopProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class AdminDashboardDAOImpl implements AdminDashboardDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int getTotalOrders() {
        return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM g_orders", Integer.class);
    }

    @Override
    public double getTotalRevenue() {
        return jdbcTemplate.queryForObject("SELECT IFNULL(SUM(totalAmount),0) FROM g_orders", Double.class);
    }

    @Override
    public int getTodaysOrders() {
        return jdbcTemplate.queryForObject(
                "SELECT COUNT(*) FROM g_orders WHERE DATE(orderDate) = CURDATE()",
                Integer.class
        );
    }

    @Override
    public double getTodaysRevenue() {
        return jdbcTemplate.queryForObject(
                "SELECT IFNULL(SUM(totalAmount),0) FROM g_orders WHERE DATE(orderDate) = CURDATE()",
                Double.class
        );
    }

    @Override
    public List<TopProduct> getTopProducts() {
        String sql = """
            SELECT product_name, SUM(quantity) AS qty
            FROM g_order_items
            GROUP BY product_name
            ORDER BY qty DESC
            LIMIT 5
        """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            TopProduct tp = new TopProduct();
            tp.setProductName(rs.getString("product_name"));
            tp.setQty(rs.getInt("qty"));
            return tp;
        });
    }
}
