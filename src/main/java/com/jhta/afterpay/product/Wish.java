package com.jhta.afterpay.product;

public class Wish {
    private int no;
    private Product product;
    private User user;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
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
               ", product=" + product +
               ", user=" + user +
               '}';
    }
}
