package com.jhta.afterpay.product;

import java.util.Date;

public class Product {
    private int no;
    private String name;
    private int price;
    private String content;
    private int viewCount;
    private Date createdDate;
    private String status;
    private int totalRating;
    private Category category;
    private String defaultImage;
    private Image image;
    private String deleted;

    public Product() {}

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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 텍스트의 줄바꿈문자를 br 태그로 변환해서 반환하는 메소드다.
     * @return br태그가 포함된 문자열
     */
    public String getHtmlContent() {
        return content.replace(System.lineSeparator(), "<br>");
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotalRating() {
        return totalRating;
    }

    public void setTotalRating(int totalRating) {
        this.totalRating = totalRating;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    // 카테고리 번호 유무 체크
    public boolean hasCategory(int catNo) {
        return catNo == category.getNo();
    }

    // 상품상태 유무 체크
    public boolean hasStatus(String status) {
        return status != null && status.equals(this.status);
    }

    public String getDefaultImage() {
        return defaultImage;
    }

    public void setDefaultImage(String defaultImage) {
        this.defaultImage = defaultImage;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return "Product{" +
                "no=" + no +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", content='" + content + '\'' +
                ", viewCount=" + viewCount +
                ", createdDate=" + createdDate +
                ", status='" + status + '\'' +
                ", totalRating=" + totalRating +
                ", category=" + category +
                ", defaultImage='" + defaultImage + '\'' +
                ", image=" + image +
                ", deleted='" + deleted + '\'' +
                '}';
    }
}
