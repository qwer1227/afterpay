package com.jhta.afterpay.product;

public class Wish {
    private int no;
    private int productNo;
    private int userNo;
    private Product product;
    private User user;

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

    @Override
    public String toString() {
        return "Wish{" +
                "no=" + no +
                ", productNo=" + productNo +
                ", userNo=" + userNo +
                ", product=" + product +
                ", user=" + user +
                '}';

               "no=" + no +
               ", product=" + product +
               ", user=" + user +
               '}';
    }
}
