package com.jhta.afterpay.product;

import java.util.Date;

public class User {
    private int no;
    private String email;
    private String id;
    private String password;
    private String name;
    private String tel;
    private String isBanned;
    private String isSignout;
    private int point;
    private Date createdDate;
    private String gradeId;

    public User() {}

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getIsBanned() {
        return isBanned;
    }

    public void setIsBanned(String isBanned) {
        this.isBanned = isBanned;
    }

    public String getIsSignout() {
        return isSignout;
    }

    public void setIsSignout(String isSignout) {
        this.isSignout = isSignout;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getGradeId() {
        return gradeId;
    }

    public void setGradeId(String gradeId) {
        this.gradeId = gradeId;
    }

    @Override
    public String toString() {
        return "User{" +
                "no=" + no +
                ", email='" + email + '\'' +
                ", id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", isBanned='" + isBanned + '\'' +
                ", isSignout='" + isSignout + '\'' +
                ", point=" + point +
                ", createdDate=" + createdDate +
                ", gradeId='" + gradeId + '\'' +
                '}';
    }
}
