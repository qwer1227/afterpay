package com.jhta.afterpay.qna;

import com.jhta.afterpay.user.User;

import java.util.Date;

public class Qna {
    private int no;
    private String title;
    private String content;
    private int cnt;
    private Date createdDate;
    private Date repliedDate;
    private String repliedContent;
    private String isQnaDeleted;
    private User user;

    @Override
    public String toString() {
        return "Qna{" +
                "no=" + no +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", cnt=" + cnt +
                ", createdDate=" + createdDate +
                ", repliedDate=" + repliedDate +
                ", repliedContent='" + repliedContent + '\'' +
                ", isQnaDeleted='" + isQnaDeleted + '\'' +
                ", user=" + user +
                '}';
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getRepliedDate() {
        return repliedDate;
    }

    public void setRepliedDate(Date repliedDate) {
        this.repliedDate = repliedDate;
    }

    public String getRepliedContent() {
        return repliedContent;
    }

    public void setRepliedContent(String repliedContent) {
        this.repliedContent = repliedContent;
    }

    public String getIsQnaDeleted() {
        return isQnaDeleted;
    }

    public void setIsQnaDeleted(String isQnaDeleted) {
        this.isQnaDeleted = isQnaDeleted;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
