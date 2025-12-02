package com.grocery.dao;

import com.grocery.model.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void savePayment(Payment p) {

        String sql = """
            INSERT INTO g_payment(orderId, username, paymentMode, cardHolder, cardNumber,
            expiry, cvv, txnId, amount)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        """;

        jdbcTemplate.update(sql, p.getOrderId(), p.getUsername(), p.getPaymentMode(),
                p.getCardHolder(), p.getCardNumber(), p.getExpiry(), p.getCvv(),
                p.getTxnId(), p.getAmount());
    }
}
