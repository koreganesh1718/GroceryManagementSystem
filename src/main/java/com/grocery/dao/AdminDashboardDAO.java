package com.grocery.dao;

import com.grocery.model.TopProduct;
import java.util.List;

public interface AdminDashboardDAO {

    int getTotalOrders();

    double getTotalRevenue();

    int getTodaysOrders();

    double getTodaysRevenue();

    List<TopProduct> getTopProducts();
}
