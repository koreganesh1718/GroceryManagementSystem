package com.grocery.dao;

import com.grocery.model.CartItem;
import java.util.List;

public interface CartDAO {
    void addToCart(String username, int productId, int quantity);
    List<CartItem> getCartItems(String username);
    double getCartTotal(String username);
    void clearCart(String username);
    void updateQuantity(String username, int productId, int quantity);
    void removeItem(String username, int productId);


}
