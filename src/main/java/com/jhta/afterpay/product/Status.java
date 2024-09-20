package com.jhta.afterpay.product;

public class Status {

    private int no;
    private String name;

    public Status() {}

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

    @Override
    public String toString() {
        return "Status{" +
                "no=" + no +
                ", name='" + name + '\'' +
                '}';
    }
}
