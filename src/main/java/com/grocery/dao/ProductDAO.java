package com.grocery.dao;

import java.util.List;
import com.grocery.model.Product;

public interface ProductDAO {
    List<Product> getAllProducts();
    Product getProductById(int id);
    void saveProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int id);
    void addProduct(Product product);
    List<Product> searchProducts(String keyword, String category);


}
