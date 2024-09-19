package com.jhta.afterpay.order;

import com.jhta.afterpay.addr.Addr;
import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.user.User;

import java.util.Date;
import java.util.List;

public class Order {
    private int no;
    private Date orderDate;
    private String status;
    private int price;
    private int amount;
    private int deliveryPrice;
    private int usePoint;
    private int discountPrice;
    private int paymentPrice;
    private int deliveryStatus;
    private int depositPoint;
    private Addr addr;
    private User user;
    private List<Product> Products;

    public Order() {
    }



    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getDeliveryPrice() {
        return deliveryPrice;
    }

    public void setDeliveryPrice(int deliveryPrice) {
        this.deliveryPrice = deliveryPrice;
    }

    public int getUsePoint() {
        return usePoint;
    }

    public void setUsePoint(int usePoint) {
        this.usePoint = usePoint;
    }

    public int getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(int discountPrice) {
        this.discountPrice = discountPrice;
    }

    public int getPaymentPrice() {
        return paymentPrice;
    }

    public void setPaymentPrice(int paymentPrice) {
        this.paymentPrice = paymentPrice;
    }

    public int getDeliveryStatus() {
        return deliveryStatus;
    }

    public void setDeliveryStatus(int deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public Addr getAddr() {
        return addr;
    }

    public void setAddr(Addr addr) {
        this.addr = addr;
    }

    public int getDepositPoint() {
        return depositPoint;
    }

    public void setDepositPoint(int depositPoint) {
        this.depositPoint = depositPoint;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Product> getProducts() {
        return Products;
    }

    public void setProducts(List<Product> products) {
        Products = products;
    }
}
