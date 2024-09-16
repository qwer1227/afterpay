package com.jhta.afterpay.user.vo;

import java.util.Date;

public class Point {
    private int no; // 개인 포인트 누적 순번
    private Date historyDate; // 포인트 적립일
    private String content; // 포인트 내용
    private int point; // 포인트 누적/차감 금액
    private User userNo; // 사용자 번호

    public Point() {}

    @Override
    public String toString() {
        return "Point{" +
                "no=" + no +
                ", historyDate=" + historyDate +
                ", content='" + content + '\'' +
                ", point=" + point +
                ", userNo=" + userNo +
                '}';
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public Date getHistoryDate() {
        return historyDate;
    }

    public void setHistoryDate(Date historyDate) {
        this.historyDate = historyDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public User getUserNo() {
        return userNo;
    }

    public void setUserNo(User userNo) {
        this.userNo = userNo;
    }
}
