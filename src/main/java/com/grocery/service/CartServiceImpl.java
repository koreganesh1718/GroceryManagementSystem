package com.grocery.service;

import com.grocery.dao.CartDAO;
import com.grocery.model.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDAO cartDAO;

    @Override
    public void addToCart(String username, int productId, int quantity) {
        cartDAO.addToCart(username, productId, quantity);
    }

    @Override
    public List<CartItem> getCartItems(String username) {
        return cartDAO.getCartItems(username);
    }

    @Override
    public double getCartTotal(String username) {
        return cartDAO.getCartTotal(username);
    }
    @Override
    public void updateQuantity(String username, int productId, int quantity) {
        cartDAO.updateQuantity(username, productId, quantity);
    }

    @Override
    public void removeItem(String username, int productId) {
        cartDAO.removeItem(username, productId);
    }
    @Override
    public void clearCart(String username) {
        cartDAO.clearCart(username);
    }

}
