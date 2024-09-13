package com.jhta.afterpay.addr;

import com.jhta.afterpay.user.User;

public class Addr {
    private int no;
    private String name;
    private String tel;
    private String zipCode;
    private String addr1;
    private String addr2;
    private String isAddrHome;
    private User user;


    public Addr() {
    }


    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
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

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public void setAddrHome(String addrHome) {
        isAddrHome = addrHome;
    }

    public String getIsAddrHome() {
        return isAddrHome;
    }

    public void setIsAddrHome(String isAddrHome) {
        this.isAddrHome = isAddrHome;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
