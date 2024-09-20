package com.jhta.afterpay.product;

public class Wish {
    private int no;
    private int productNo;
    private int userNo;

    public Wish() {}

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getProductNo() {
        return productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }

    @Override
    public String toString() {
        return "Wish{" +
                "no=" + no +
                ", productNo=" + productNo +
                ", userNo=" + userNo +
                '}';
    }
}
