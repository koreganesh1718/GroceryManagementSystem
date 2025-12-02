package com.grocery.controller;

import com.grocery.service.CartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    // ADD TO CART
    @PostMapping("/addToCart/{id}")
    public String addToCart(@PathVariable("id") int productId,
                            @RequestParam("quantity") int qty,
                            HttpSession session) {

        String username = (String) session.getAttribute("username");   // ✅ FIXED

        if (username == null) {
            return "redirect:/login";
        }

        cartService.addToCart(username, productId, qty);

        return "redirect:/cart";
    }

    // VIEW CART
    @GetMapping("/cart")
    public String viewCart(Model model, HttpSession session) {

        String username = (String) session.getAttribute("username");   // ✅ FIXED

        if (username == null) {
            return "redirect:/login";
        }

        model.addAttribute("cartItems", cartService.getCartItems(username));
        model.addAttribute("total", cartService.getCartTotal(username));

        return "cart";
    }

    // UPDATE CART QTY
    @PostMapping("/cart/update")
    public String updateQuantity(@RequestParam("productId") int productId,
                                 @RequestParam("quantity") int qty,
                                 HttpSession session) {

        String username = (String) session.getAttribute("username");   // ✅ FIXED

        cartService.updateQuantity(username, productId, qty);

        return "redirect:/cart";
    }

    // REMOVE ITEM
    @GetMapping("/cart/remove/{id}")
    public String removeItem(@PathVariable("id") int productId,
                             HttpSession session) {

        String username = (String) session.getAttribute("username");   // ✅ FIXED

        cartService.removeItem(username, productId);

        return "redirect:/cart";
    }
}
