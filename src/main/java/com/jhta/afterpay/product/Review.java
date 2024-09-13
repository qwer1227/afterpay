package com.jhta.afterpay.product;

import java.util.Date;

public class Review {
    private int no;
    private String content;
    private int rating;
    private Date createdDate;
    private Date updatedDate;
    private String isDeleted;
    private User user;
    private Product product;

    public Review() {}

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(String isDeleted) {
        this.isDeleted = isDeleted;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Review{" +
                "no=" + no +
                ", content='" + content + '\'' +
                ", rating=" + rating +
                ", createdDate=" + createdDate +
                ", updatedDate=" + updatedDate +
                ", isDeleted='" + isDeleted + '\'' +
                ", user=" + user +
                ", product=" + product +
                '}';
    }
}
