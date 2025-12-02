package com.grocery.service;

import com.grocery.dao.AdminDashboardDAO;
import com.grocery.model.TopProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AdminDashboardServiceImpl implements AdminDashboardService {

    @Autowired
    private AdminDashboardDAO dashboardDAO;

    @Override
    public int getTotalOrders() {
        return dashboardDAO.getTotalOrders();
    }

    @Override
    public double getTotalRevenue() {
        return dashboardDAO.getTotalRevenue();
    }

    @Override
    public int getTodaysOrders() {
        return dashboardDAO.getTodaysOrders();
    }

    @Override
    public double getTodaysRevenue() {
        return dashboardDAO.getTodaysRevenue();
    }

    @Override
    public List<TopProduct> getTopProducts() {
        return dashboardDAO.getTopProducts();
    }
}
