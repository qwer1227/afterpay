package com.jhta.afterpay.user;

import java.util.Date;

public class Order {
    private int no;             // 주문번호
    private Date orderedDate;   // 주문일자
    private String status;      // 주문상태
    private int price;          // 주문 가격
    private int amount;         // 주문 수량
    private int deliveryPrice;  // 운송비
    private PointHistory usedPoint;    // 사용자 사용 포인트
    private int totalDiscountPrice; // 총 할인 금액
    private int paymentPrice;   // 총 결제 금액
    private PointHistory depositPoint; // 적립 예정 금액
    private int userNo;        // 사용자 번호
    private String message;     // 배송 요청메세지

    public Order() {}

    @Override
    public String toString() {
        return "Order{" +
                "no=" + no +
                ", orderedDate=" + orderedDate +
                ", status='" + status + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                ", deliveryPrice=" + deliveryPrice +
                ", usedPoint=" + usedPoint +
                ", totalDiscountPrice=" + totalDiscountPrice +
                ", paymentPrice=" + paymentPrice +
                ", depositPoint=" + depositPoint +
                ", userNo=" + userNo +
                ", message='" + message + '\'' +
                '}';
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public Date getOrderedDate() {
        return orderedDate;
    }

    public void setOrderedDate(Date orderedDate) {
        this.orderedDate = orderedDate;
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

    public PointHistory getUsedPoint() {
        return usedPoint;
    }

    public void setUsedPoint(PointHistory usedPoint) {
        this.usedPoint = usedPoint;
    }

    public int getTotalDiscountPrice() {
        return totalDiscountPrice;
    }

    public void setTotalDiscountPrice(int totalDiscountPrice) {
        this.totalDiscountPrice = totalDiscountPrice;
    }

    public int getPaymentPrice() {
        return paymentPrice;
    }

    public void setPaymentPrice(int paymentPrice) {
        this.paymentPrice = paymentPrice;
    }

    public PointHistory getDepositPoint() {
        return depositPoint;
    }

    public void setDepositPoint(PointHistory depositPoint) {
        this.depositPoint = depositPoint;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }





}
