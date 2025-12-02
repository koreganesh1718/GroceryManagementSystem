package com.grocery.dao;

import java.util.List;

import com.grocery.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper for Product (reusable)
    private Product mapRow(java.sql.ResultSet rs) throws java.sql.SQLException {
        Product p = new Product();
        p.setId(rs.getInt("id"));
        p.setName(rs.getString("name"));
        p.setPrice(rs.getDouble("price"));
        p.setQuantity(rs.getInt("quantity"));
        p.setDescription(rs.getString("description"));
        p.setCategory(rs.getString("category"));   // ⭐ NEW FIELD
        return p;
    }

    @Override
    public List<Product> getAllProducts() {
        return jdbcTemplate.query(
                "SELECT * FROM g_products",
                (rs, row) -> mapRow(rs)
        );
    }

    @Override
    public Product getProductById(int id) {
        return jdbcTemplate.queryForObject(
                "SELECT * FROM g_products WHERE id=?",
                new Object[]{id},
                (rs, rowNum) -> mapRow(rs)
        );
    }

    @Override
    public void saveProduct(Product product) {
        jdbcTemplate.update(
                "INSERT INTO g_products(name, price, quantity, description, category) VALUES(?, ?, ?, ?, ?)",
                product.getName(), product.getPrice(), product.getQuantity(),
                product.getDescription(), product.getCategory()            // ⭐ NEW
        );
    }

    @Override
    public void addProduct(Product product) {
        jdbcTemplate.update(
                "INSERT INTO g_products(name, price, quantity, description, category) VALUES(?, ?, ?, ?, ?)",
                product.getName(), product.getPrice(), product.getQuantity(),
                product.getDescription(), product.getCategory()            // ⭐ NEW
        );
    }

    @Override
    public void updateProduct(Product product) {
        jdbcTemplate.update(
                "UPDATE g_products SET name=?, price=?, quantity=?, description=?, category=? WHERE id=?",
                product.getName(), product.getPrice(), product.getQuantity(),
                product.getDescription(), product.getCategory(),           // ⭐ NEW
                product.getId()
        );
    }

    @Override
    public void deleteProduct(int id) {
        jdbcTemplate.update("DELETE FROM g_products WHERE id=?", id);
    }
    @Override
    public List<Product> searchProducts(String keyword, String category) {

        String sql = "SELECT * FROM g_products WHERE 1=1 ";

        if (keyword != null && !keyword.isBlank()) {
            sql += " AND name LIKE '%" + keyword + "%' ";
        }

        if (category != null && !category.isBlank()) {
            sql += " AND category = '" + category + "' ";
        }

        return jdbcTemplate.query(sql, (rs, row) -> mapRow(rs));
    }

}
