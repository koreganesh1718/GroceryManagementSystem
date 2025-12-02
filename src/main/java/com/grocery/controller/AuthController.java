package com.grocery.controller;

import com.grocery.model.User;
import com.grocery.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    // SHOW REGISTER PAGE
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    // REGISTER USER
    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {

        // Default role = USER
        if (user.getRole() == null || user.getRole().isEmpty()) {
            user.setRole("USER");
        }

        userService.registerUser(user);
        model.addAttribute("msg", "Registration Successful! Please Login.");
        return "login";
    }

    // SHOW LOGIN PAGE
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    // LOGIN USER
    @PostMapping("/login")
    public String loginUser(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            HttpSession session,
                            Model model) {

        if (userService.validateUser(username, password)) {

            // Get complete user details
            User u = userService.getUserByUsername(username);

            // Save session attributes
            session.setAttribute("username", username);
            session.setAttribute("role", u.getRole());

            // ADMIN → redirect to admin dashboard
            if ("ADMIN".equalsIgnoreCase(u.getRole())) {
                return "redirect:/admin/dashboard";
            }

            // USER → redirect to products
            return "redirect:/products";
        }

        model.addAttribute("error", "Invalid username or password");
        return "login";
    }

    // LOGOUT
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout=true";
    }
}
