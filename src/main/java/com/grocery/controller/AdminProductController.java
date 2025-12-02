package com.grocery.controller;

import com.grocery.model.Product;
import com.grocery.service.AdminDashboardService;
import com.grocery.service.OrderService;
import com.grocery.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AdminDashboardService dashboardService;

    // ⭐ CATEGORY LIST
    private String[] getCategories() {
        return new String[]{
                "Rice & Grains",
                "Atta & Flour",
                "Pulses",
                "Spices",
                "Vegetables",
                "Fruits",
                "Oil & Ghee",
                "Dairy",
                "Snacks",
                "General"
        };
    }

    // 🔐 ADMIN CHECK
    private boolean isAdmin(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return role != null && role.equals("ADMIN");
    }

    // 🔐 View all products
    @GetMapping("/products")
    public String viewAllProducts(Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }
        model.addAttribute("products", productService.getAllProducts());
        return "adminProducts";
    }

    // 🔐 Add Product Form
    @GetMapping("/addProduct")
    public String showAddProductForm(Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }

        model.addAttribute("product", new Product());
        model.addAttribute("units", new String[]{"kg", "g", "L", "ml", "pack", "piece"});
        model.addAttribute("categories", getCategories());    // ⭐ ADDING CATEGORY LIST
        return "addProduct";
    }

    // 🔐 Save New Product
    @PostMapping("/addProduct")
    public String addProduct(@RequestParam("name") String name,
                             @RequestParam("price") String price,
                             @RequestParam("quantity") String quantity,
                             @RequestParam("description") String description,
                             @RequestParam("unitValue") String unitValue,
                             @RequestParam("unitType") String unitType,
                             @RequestParam("category") String category,     // ⭐ NEW
                             HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }

        Product product = new Product();

        product.setName(name + " " + unitValue + " " + unitType);
        product.setPrice(Double.parseDouble(price));
        product.setQuantity(Integer.parseInt(quantity));
        product.setDescription(description);
        product.setCategory(category);   // ⭐ NEW

        productService.addProduct(product);
        return "redirect:/admin/products";
    }

    // 🔐 Show Edit Product Form
    @GetMapping("/editProduct/{id}")
    public String editProduct(@PathVariable("id") int id,
                              Model model,
                              HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }

        model.addAttribute("product", productService.getProductById(id));
        model.addAttribute("units", new String[]{"kg", "g", "L", "ml", "pack", "piece"});
        model.addAttribute("categories", getCategories());   // ⭐ ADD CATEGORY LIST
        return "editProduct";
    }

    // 🔐 Update Product
    @PostMapping("/updateProduct")
    public String updateProduct(@RequestParam("id") int id,
                                @RequestParam("name") String baseName,
                                @RequestParam("price") String price,
                                @RequestParam("quantity") String quantity,
                                @RequestParam("description") String description,
                                @RequestParam("unitValue") String unitValue,
                                @RequestParam("unitType") String unitType,
                                @RequestParam("category") String category,   // ⭐ NEW
                                HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }

        Product product = new Product();
        product.setId(id);
        product.setName(baseName + " " + unitValue + " " + unitType);
        product.setPrice(Double.parseDouble(price));
        product.setQuantity(Integer.parseInt(quantity));
        product.setDescription(description);
        product.setCategory(category);   // ⭐ NEW

        productService.updateProduct(product);
        return "redirect:/admin/products";
    }

    // 🔐 Delete Product
    @GetMapping("/deleteProduct/{id}")
    public String deleteProduct(@PathVariable("id") int id, HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }

        productService.deleteProduct(id);
        return "redirect:/admin/products";
    }

    // 🔐 View All Orders
    @GetMapping("/orders")
    public String viewAllOrders(Model model, HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }

        model.addAttribute("orders", orderService.getAllOrders());
        return "adminOrders";
    }

    // 🔐 Order Details
    @GetMapping("/orderDetails")
    public String adminOrderDetails(@RequestParam("orderId") int orderId,
                                    Model model,
                                    HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }

        model.addAttribute("orderId", orderId);
        model.addAttribute("items", orderService.getOrderItems(orderId));
        return "orderDetails";
    }

    // 🔐 Dashboard
    @GetMapping("/dashboard")
    public String adminDashboard(Model model, HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login?error=AccessDenied";
        }

        model.addAttribute("totalOrders", dashboardService.getTotalOrders());
        model.addAttribute("totalRevenue", dashboardService.getTotalRevenue());
        model.addAttribute("todayOrders", dashboardService.getTodaysOrders());
        model.addAttribute("todayRevenue", dashboardService.getTodaysRevenue());
        model.addAttribute("topProducts", dashboardService.getTopProducts());

        return "adminDashboard";
    }
}
