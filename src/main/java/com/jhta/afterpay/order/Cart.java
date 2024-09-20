package com.jhta.afterpay.order;

import com.jhta.afterpay.delivery.Stock;
import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.user.User;

public class Cart {
    private int no;
    private int amount;
    private Stock stock;
    private Product product;
    private User user;

    public Cart() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
