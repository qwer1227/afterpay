package com.jhta.afterpay.user;

import java.util.Date;

public class Review {
    private int no; // 작성한 리뷰 순번
    private String title; // 작성한 리뷰 제목
    private String content; // 작성한 리뷰 내용
    private int rating; // 리뷰 평점
    private Date createdDate; // 리뷰 작성일
    private Date updatedDate; // 리뷰 수정일
    private String isDeleted; // 리뷰 삭제여부
    private User userNo; // 작성한 유저 번호
//    private Product productNo; // 작성한 상품 번호

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

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

    public User getUserNo() {
        return userNo;
    }

    public void setUserNo(User userNo) {
        this.userNo = userNo;
    }

//    public Product getProductNo() {
//        return productNo;
//    }
//
//    public void setProductNo(Product productNo) {
//        this.productNo = productNo;
//    }

    @Override
    public String toString() {
        return "Review{" +
                "no=" + no +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", rating=" + rating +
                ", createdDate=" + createdDate +
                ", updatedDate=" + updatedDate +
                ", isDeleted='" + isDeleted + '\'' +
                ", userNo=" + userNo +
//                ", productNo=" + productNo +
                '}';
    }
}
