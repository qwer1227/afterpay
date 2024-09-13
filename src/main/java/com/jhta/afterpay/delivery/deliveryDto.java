package com.jhta.afterpay.delivery;

import com.jhta.afterpay.order.OrderDto;

public class deliveryDto {
    private int no;
    private int price;
    private int amount;
    private String status;
    private Product product;
    private Stock stock;
    private OrderDto order;

    public deliveryDto() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
    }

    public OrderDto getOrder() {
        return order;
    }

    public void setOrder(OrderDto order) {
        this.order = order;
    }
}
