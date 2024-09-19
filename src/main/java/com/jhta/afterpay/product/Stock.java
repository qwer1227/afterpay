package com.jhta.afterpay.product;

public class Stock {

    private int no;
    private String size;
    private int amount;
    private int productNo;

    public Stock() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getProductNo() {
        return productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
    }

    @Override
    public String toString() {
        return "Stock{" +
                "no=" + no +
                ", size='" + size + '\'' +
                ", amount=" + amount +
                ", productNo=" + productNo +
                '}';
    }
}
