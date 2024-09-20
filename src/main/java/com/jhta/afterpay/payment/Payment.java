package com.jhta.afterpay.payment;

import com.jhta.afterpay.order.Order;

import java.util.Date;

public class Payment {
    private int no;
    private int price;
    private Date createdDate;
    private Order order;

    public Payment() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
