package com.jhta.afterpay.payment;

import com.jhta.afterpay.order.OrderDto;

import java.util.Date;

public class PaymentDto {
    private int no;
    private int price;
    private Date createdDate;
    private OrderDto order;

    public PaymentDto() {
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

    public OrderDto getOrder() {
        return order;
    }

    public void setOrder(OrderDto order) {
        this.order = order;
    }
}
