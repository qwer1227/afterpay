package com.jhta.afterpay.product;

public class Image {
    private int no;
    private String name;
    private String thumb;
    private int productNo;

    public Image() {}

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

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public int getProductNo() {
        return productNo;
    }

    public void setProductNo(int productNo) {
        this.productNo = productNo;
    }

    @Override
    public String toString() {
        return "Image{" +
                "no=" + no +
                ", name='" + name + '\'' +
                ", thumb='" + thumb + '\'' +
                ", productNo=" + productNo +
                '}';
    }
}
