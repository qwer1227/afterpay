package com.jhta.afterpay.delivery;

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
            Delivery dto = new Delivery();
            dto.setNo(rs.getInt("DELIVERY_NO"));
            dto.setPrice(rs.getInt("DELIVERY_PRODUCT_PRICE"));
            dto.setAmount(rs.getInt("DELIVERY_PRODUCT_AMOUNT"));
            dto.setStatus(rs.getString("DELIVERY_STATUS"));
            dto.getProduct().setNo(rs.getInt("PRODUCT_NO"));
            dto.getStock().setNo(rs.getInt("PRODUCT_STOCK_NO"));
            dto.getOrder().setNo(rs.getInt("ORDER_NO"));
            return dto;
        });
    }

    public List<Delivery> getAllDeliveryByOrderNo(int orderNo){
        String sql = """
                SELECT *
                FROM ORDER_DELIVERY_PRODUCTS
                WHERE USER_NO = ?
                """;
        return DaoHelper.selectList(sql, rs -> {
            Delivery dto = new Delivery();
            dto.setNo(rs.getInt("DELIVERY_NO"));
            dto.setPrice(rs.getInt("DELIVERY_PRODUCT_PRICE"));
            dto.setAmount(rs.getInt("DELIVERY_PRODUCT_AMOUNT"));
            dto.setStatus(rs.getString("DELIVERY_STATUS"));
            dto.getProduct().setNo(rs.getInt("PRODUCT_NO"));
            dto.getStock().setNo(rs.getInt("PRODUCT_STOCK_NO"));
            dto.getOrder().setNo(rs.getInt("ORDER_NO"));
            return dto;
        }, orderNo);
    }
}
