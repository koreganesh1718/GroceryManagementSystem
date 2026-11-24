package com.grocery.controller;

import com.grocery.model.User;
import com.grocery.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

String name="gk";

    @Autowired
    private UserService userService;

    // Show Register Page
//    @GetMapping("/register")
//    public String showRegisterForm(Model model) {
//        model.addAttribute("user", new User());
//        return "register";
//    }
//
//    // Save User
//    @PostMapping("/register")
//    public String registerUser(@ModelAttribute User user, Model model) {
//
//        userService.registerUser(user);
//        model.addAttribute("msg", "Registration successful! Please login.");
//
//        return "login";
//    }

    // Show Login Page
//    @GetMapping("/login")
//    public String showLogin() {
//        return "login";
//    }
}
