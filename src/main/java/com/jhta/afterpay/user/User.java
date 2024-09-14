package com.jhta.afterpay.user;

import java.util.Date;

public class User {
    private int no;
    private String email;
    private String id;
    private String pwd;
    private String name;
    private String tel;
    private String isBanned;
    private String isSignOut;
    private int point;
    private Date createdDate;
    private String gradeId;

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "no=" + no +
                ", email='" + email + '\'' +
                ", id='" + id + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", isBanned='" + isBanned + '\'' +
                ", isSignOut='" + isSignOut + '\'' +
                ", point=" + point +
                ", createdDate=" + createdDate +
                ", gradeId='" + gradeId + '\'' +
                '}';
    }

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

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
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

    public String getIsSignOut() {
        return isSignOut;
    }

    public void setIsSignOut(String isSignOut) {
        this.isSignOut = isSignOut;
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

}
