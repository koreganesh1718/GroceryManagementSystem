package com.grocery.service;
import com.grocery.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> getAllProducts();
    Product getProductById(int id);
    void saveProduct(Product product);
    public void addProduct(Product product);
    public void updateProduct(Product product);
    public void deleteProduct(int id);
    List<Product> searchProducts(String keyword, String category);


}
