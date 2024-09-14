package com.jhta.afterpay.order;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class OrderDao {

    public void insertOrder(Order order) {
        String sql= """
                    insert into ORDERS
                    (ORDER_NO
                    , ORDER_PRICE, ORDER_AMOUNT , DELIVERY_PRICE 
                    , USE_POINT , ORDER_DISCOUNT_PRICE, PAYMENT_PRICE
                    , DEPOSIT_POINT, USER_NO, ADDR_NO)
                    VALUES
                    (ORDER_NO_SEQ.NEXTVAL
                    , ?, ?, ?
                    , ?, ?, ? 
                    , ?, ?, ?)
                """;

        DaoHelper.insert(sql
        , order.getPrice(), order.getAmount(), order.getDeliveryPrice()
        , order.getUsePoint(), order.getDiscountPrice(), order.getPaymentPrice()
         , order.getDepositPoint(), order.getUser().getNo(), order.getAddr().getNo()
        );
    }


    public void deleteOrder(String orderNo) {
        String sql = """
                DELETE FROM ORDERS WHERE ORDER_NO = ?
                """;
        DaoHelper.delete(sql, orderNo);
    }

    // USER 필요
    public Order getOrderByNo(int orderNo) {
        String sql = """
                SELECT *
                FROM ORDERS 
                WHERE ORDER_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs-> {
            Order orderDto = new Order();
            orderDto.setNo(rs.getInt("ORDER_NO"));
            orderDto.setOrderDate(rs.getDate("ORDER_DATE"));
            orderDto.setStatus(rs.getInt("ORDER_STATUS"));
            orderDto.setPrice(rs.getInt("ORDER_PRICE"));
            orderDto.setAmount(rs.getInt("ORDER_AMOUNT"));
            orderDto.setDeliveryPrice(rs.getInt("DELIVERY_PRICE"));
            orderDto.setUsePoint(rs.getInt("USE_POINT"));
            orderDto.setDiscountPrice(rs.getInt("DISCOUNT_PRICE"));
            orderDto.setPaymentPrice(rs.getInt("PAYMENT_PRICE"));
            orderDto.setDepositPoint(rs.getInt("DEPOSIT_POINT"));
            orderDto.getUser().setNo(rs.getInt("USER_NO"));
            orderDto.getAddr().setNo(rs.getInt("ADDR_NO"));
            return orderDto;
        }, orderNo);

    }

    public List<Order> getAllOrderByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM ORDERS 
                WHERE USER_NO = ?
                """;

        return DaoHelper.selectList(sql, rs-> {
            Order orderDto = new Order();
            orderDto.setNo(rs.getInt("ORDER_NO"));
            orderDto.setOrderDate(rs.getDate("ORDER_DATE"));
            orderDto.setStatus(rs.getInt("ORDER_STATUS"));
            orderDto.setPrice(rs.getInt("ORDER_PRICE"));
            orderDto.setAmount(rs.getInt("ORDER_AMOUNT"));
            orderDto.setDeliveryPrice(rs.getInt("DELIVERY_PRICE"));
            orderDto.setUsePoint(rs.getInt("USE_POINT"));
            orderDto.setDiscountPrice(rs.getInt("DISCOUNT_PRICE"));
            orderDto.setPaymentPrice(rs.getInt("PAYMENT_PRICE"));
            orderDto.setDepositPoint(rs.getInt("DEPOSIT_POINT"));
            orderDto.getUser().setNo(rs.getInt("USER_NO"));
            orderDto.getAddr().setNo(rs.getInt("ADDR_NO"));
            return orderDto;
        }, userNo);
    }
}
