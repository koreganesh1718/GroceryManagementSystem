package com.grocery.service;

import com.grocery.dao.PaymentDAO;
import com.grocery.model.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentDAO paymentDAO;

    @Override
    public void savePayment(Payment payment) {
        paymentDAO.savePayment(payment);
    }
}
