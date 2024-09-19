package com.jhta.afterpay.delivery;

import com.jhta.afterpay.order.Order;
import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class DeliveryDao {
    public void insertDelivery (Delivery delivery){
        String sql = """
                INSERT INTO ORDER_DELIVERY_PRODUCTS
                (DELIVERY_NO, DELIVERY_PRODUCT_PRICE, DELIVERY_PRODUCT_AMOUNT
                , PRODUCT_NO, PRODUCT_STOCK_NO, ORDER_NO
                , RECIPIENT)
                VALUES
                (DELIVERY_NO_SEQ.NEXTVAL
                , ?, ?, ?
                , ?, ?, ?)
                """;
        DaoHelper.insert(sql
                            , delivery.getPrice()
                            , delivery.getAmount()
                            , delivery.getProduct().getNo()
                            , delivery.getStock().getNo()
                            , delivery.getOrder().getNo()
                            , delivery.getRecipient()
        );
    }

    public void updateDelivery (Delivery delivery){
        String sql = """
                UPDATE ORDER_DELIVERY_PRODUCTS
                SET DELIVERY_NO = ?,
                DELIVERY_PRODUCT_PRICE = ?,
                DELIVERY_PRODUCT_AMOUNT = ?,
                DELIVERY_STATUS = ?,
                PRODUCT_NO = ?,
                PRODUCT_STOCK_NO = ?,
                ORDER_NO = ?
                """;

        DaoHelper.update(sql, delivery.getNo()
                            , delivery.getPrice()
                            , delivery.getAmount()
                            , delivery.getStatus()
                            , delivery.getProduct().getNo()
                            , delivery.getStock().getNo()
                            , delivery.getOrder().getNo()
        );
    }

    public void deleteDelivery (int deliveryNo){
        String sql = """
                DELETE FROM ORDER_DELIVERY_PRODUCTS
                WHERE DELIVERY_NO = ?
                """;
        DaoHelper.delete(sql, deliveryNo);
    }

    public Delivery getDeliveryByNo (int deliveryNo){
        String sql = """
                SELECT *
                FROM ORDER_DELIVERY_PRODUCTS
                WHERE DELIVERY_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Delivery delivery = new Delivery();
            delivery.setNo(rs.getInt("DELIVERY_NO"));
            delivery.setPrice(rs.getInt("DELIVERY_PRODUCT_PRICE"));
            delivery.setAmount(rs.getInt("DELIVERY_PRODUCT_AMOUNT"));
            delivery.setStatus(rs.getString("DELIVERY_STATUS"));
            delivery.getProduct().setNo(rs.getInt("PRODUCT_NO"));
            delivery.getStock().setNo(rs.getInt("PRODUCT_STOCK_NO"));
            delivery.getOrder().setNo(rs.getInt("ORDER_NO"));
            return delivery;
        });
    }

    public Delivery getDeliveryByOrderNo(int orderNo){
        String sql = """
                SELECT *
                FROM ORDER_DELIVERY_PRODUCTS
                WHERE ORDER_NO = ?
                """;
            Delivery delivery = new Delivery();
            Product product = new Product();
            delivery.setProduct(product);
            Stock stock = new Stock();
            delivery.setStock(stock);
            Order order = new Order();
            delivery.setOrder(order);
        
        return DaoHelper.selectOne(sql, rs -> {
            delivery.setNo(rs.getInt("DELIVERY_NO"));
            delivery.setPrice(rs.getInt("DELIVERY_PRODUCT_PRICE"));
            delivery.setAmount(rs.getInt("DELIVERY_PRODUCT_AMOUNT"));
            delivery.setStatus(rs.getString("DELIVERY_STATUS"));
            delivery.getProduct().setNo(rs.getInt("PRODUCT_NO"));
            delivery.getStock().setNo(rs.getInt("PRODUCT_STOCK_NO"));
            delivery.getOrder().setNo(rs.getInt("ORDER_NO"));
            return delivery;
        }, orderNo);
    }
}
