package com.grocery.controller;

import com.grocery.service.CartService;
import com.grocery.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;

@Controller
public class CheckoutController {

    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    // Checkout Page
    @GetMapping("/checkout")
    public String checkoutPage(Model model, HttpSession session) {

        String username = (String) session.getAttribute("username");

        if (username == null) {
            return "redirect:/login"; // must login first
        }

        model.addAttribute("cartItems", cartService.getCartItems(username));
        model.addAttribute("total", cartService.getCartTotal(username));

        return "checkout";
    }

    // Place Order
    @GetMapping("/placeOrder")
    public String placeOrder(HttpSession session) {

        String username = (String) session.getAttribute("username");

        if (username == null) {
            return "redirect:/login";
        }

        int orderId = orderService.placeOrder(username);

        // ⭐ REQUIRED FOR PAYMENT / SUCCESS PAGE
        session.setAttribute("orderId", orderId);

        // Redirect to ADDRESS FIRST (Step A)
        return "redirect:/checkout/address";
    }


    // Order Success
    @GetMapping("/orderSuccess")
    public String orderSuccess(HttpSession session, Model model) {

        Integer orderId = (Integer) session.getAttribute("orderId");
        String username = (String) session.getAttribute("username");

        if (orderId == null || username == null) {
            return "redirect:/products";
        }

        // 1️⃣ Fetch order info
        var order = orderService.getOrderById(orderId);

        // 2️⃣ Generate Transaction ID
        String txnId = "TXN" + System.currentTimeMillis();

        // 3️⃣ Expected Delivery Date
        LocalDate deliveryDate = LocalDate.now().plusDays(3);

        // 4️⃣ Clear user's cart
        cartService.clearCart(username);

        // 5️⃣ Add model attributes for JSP
        model.addAttribute("orderId", orderId);
        model.addAttribute("txnId", txnId);
        model.addAttribute("amount", order.getTotalAmount());
        model.addAttribute("paymentMode", session.getAttribute("paymentMode"));
        model.addAttribute("deliveryDate", deliveryDate.toString());

        // 6️⃣ Clean temporary session data
        session.removeAttribute("orderId");
        session.removeAttribute("paymentMode");

        return "orderSuccess";
    }



    // Order History
    @GetMapping("/orders")
    public String orderHistory(HttpSession session, Model model) {

        String username = (String) session.getAttribute("username");

        if (username == null) {
            return "redirect:/login";
        }

        model.addAttribute("orders", orderService.getOrderHistory(username));
        return "orders";
    }

    // Order Details
    @GetMapping("/orderDetails")
    public String orderDetails(@RequestParam("orderId") int orderId, Model model) {

        model.addAttribute("orderId", orderId);
        model.addAttribute("items", orderService.getOrderItems(orderId));

        return "orderDetails";
    }
    // PAYMENT PAGE
    @GetMapping("/payment")
    public String paymentPage(HttpSession session, Model model) {

        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/login";
        }

        Integer orderId = (Integer) session.getAttribute("orderId");
        if (orderId == null) {
            return "redirect:/products";
        }

        model.addAttribute("amount", session.getAttribute("totalAmount")); // optional
        return "payment";
    }
    @PostMapping("/payment")
    public String processPayment(@RequestParam("cardName") String cardName,
                                 @RequestParam("cardNumber") String cardNumber,
                                 @RequestParam("expiry") String expiry,
                                 @RequestParam("cvv") String cvv,
                                 @RequestParam("paymentMode") String mode,
                                 HttpSession session) {

        // store payment mode for success page
        session.setAttribute("paymentMode", mode);

        return "redirect:/orderSuccess";
    }

}
