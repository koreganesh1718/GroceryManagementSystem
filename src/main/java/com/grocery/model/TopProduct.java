package com.grocery.model;

public class TopProduct {

    private String productName;
    private int qty;

    public TopProduct() {}

    public TopProduct(String productName, int qty) {
        this.productName = productName;
        this.qty = qty;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
}
