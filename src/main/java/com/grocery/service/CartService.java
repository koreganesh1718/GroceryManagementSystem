package com.grocery.service;

import com.grocery.model.CartItem;
import java.util.List;

public interface CartService {
    void addToCart(String username, int productId, int quantity);
    List<CartItem> getCartItems(String username);
    double getCartTotal(String username);
    void updateQuantity(String username, int productId, int quantity);
    void removeItem(String username, int productId);
    void clearCart(String username);

}
