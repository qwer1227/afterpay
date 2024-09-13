package com.jhta.afterpay.order;

import com.jhta.afterpay.addr.AddrDto;
import java.util.Date;

public class OrderDto {
    private int no;
    private Date orderDate;
    private int status;
    private int price;
    private int amount;
    private int deliveryPrice;
    private int usePoint;
    private int discountPrice;
    private int paymentPrice;
    private int deliveryStatus;
    private int depositPoint;
    private AddrDto addr;
    private UserDto user;


    public OrderDto() {
    }

    public OrderDto(int no, Date orderDate, int status, int price
                    , int amount, int deliveryPrice, int usePoint
                    , int discountPrice, int paymentPrice, int deliveryStatus
                    , AddrDto addr) {
        this.no = no;
        this.orderDate = orderDate;
        this.status = status;
        this.price = price;
        this.amount = amount;
        this.deliveryPrice = deliveryPrice;
        this.usePoint = usePoint;
        this.discountPrice = discountPrice;
        this.paymentPrice = paymentPrice;
        this.deliveryStatus = deliveryStatus;
        this.addr = addr;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
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

    public AddrDto getAddr() {
        return addr;
    }

    public void setAddr(AddrDto addr) {
        this.addr = addr;
    }

    public int getDepositPoint() {
        return depositPoint;
    }

    public void setDepositPoint(int depositPoint) {
        this.depositPoint = depositPoint;
    }

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }
}
