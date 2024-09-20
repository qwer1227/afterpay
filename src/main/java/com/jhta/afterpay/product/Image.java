package com.jhta.afterpay.product;

public class Image {
    private int no;
    private String name;
    private String thumb;
    private Product product;

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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Image{" +
                "no=" + no +
                ", name='" + name + '\'' +
                ", thumb='" + thumb + '\'' +
                ", product=" + product +
                '}';
    }
}
