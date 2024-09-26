package com.jhta.afterpay.order;

import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.product.Stock;

public class OrderProductDto {
    Product product;
    Stock stock;

    public OrderProductDto() {
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


}
