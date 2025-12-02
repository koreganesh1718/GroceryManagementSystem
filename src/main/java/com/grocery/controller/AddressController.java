package com.grocery.controller;

import com.grocery.model.Address;
import com.grocery.service.AddressService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/checkout")
public class AddressController {

    @Autowired
    private AddressService addressService;

    // Step 1: Show Address Page
    @GetMapping("/address")
    public String showAddressPage(HttpSession session, Model model) {

        String username = (String) session.getAttribute("username");
        if (username == null)
            return "redirect:/login";

        Address saved = addressService.getAddress(username);
        model.addAttribute("savedAddress", saved);

        model.addAttribute("address", new Address());
        return "address";
    }

    // Step 2: Save / Update Address
    @PostMapping("/address/save")
    public String saveAddress(@ModelAttribute Address address, HttpSession session) {

        String username = (String) session.getAttribute("username");
        address.setUsername(username);

        addressService.saveOrUpdate(address);

        return "redirect:/checkout/payment";
    }
}
