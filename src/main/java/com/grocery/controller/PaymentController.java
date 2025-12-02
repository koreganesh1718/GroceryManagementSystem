package com.grocery.controller;

import com.grocery.model.Payment;
import com.grocery.service.CartService;
import com.grocery.service.PaymentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequestMapping("/checkout")
public class PaymentController {

    @Autowired
    private CartService cartService;

    @Autowired
    private PaymentService paymentService;

    // STEP 2: Payment Page
    @GetMapping("/payment")
    public String paymentPage(HttpSession session, Model model) {

        String username = (String) session.getAttribute("username");
        if (username == null)
            return "redirect:/login";

        double total = cartService.getCartTotal(username);
        model.addAttribute("amount", total);

        return "payment";
    }

    // STEP 3: Save Payment & Redirect to Order Success
    @PostMapping("/pay")
    public String makePayment(@RequestParam("cardHolder") String holder,
                              @RequestParam("cardNumber") String cardNumber,
                              @RequestParam("expiry") String expiry,
                              @RequestParam("cvv") String cvv,
                              HttpSession session) {

        String username = (String) session.getAttribute("username");
        int orderId = (int) session.getAttribute("orderId");
        double amount = cartService.getCartTotal(username);

        Payment p = new Payment();
        p.setUsername(username);
        p.setOrderId(orderId);
        p.setPaymentMode("CARD");
        p.setCardHolder(holder);
        p.setCardNumber(cardNumber);
        p.setExpiry(expiry);
        p.setCvv(cvv);

        String txnId = "TXN-" + UUID.randomUUID().toString().substring(0, 8);
        p.setTxnId(txnId);
        p.setAmount(amount);

        paymentService.savePayment(p);

        session.setAttribute("txnId", txnId);

        return "redirect:/orderSuccess?orderId=" + orderId;
    }
}
