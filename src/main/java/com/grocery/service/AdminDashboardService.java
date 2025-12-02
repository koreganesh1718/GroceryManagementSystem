package com.grocery.service;

import com.grocery.model.TopProduct;
import java.util.List;

public interface AdminDashboardService {

    int getTotalOrders();

    double getTotalRevenue();

    int getTodaysOrders();

    double getTodaysRevenue();

    List<TopProduct> getTopProducts();
}
