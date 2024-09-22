package com.jhta.afterpay.order;

import com.jhta.afterpay.addr.Addr;
import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    public void insertOrder(Order order) throws SQLException {
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
            Order order = new Order();
            User user = new User();
            order.setUser(user);
            Addr addr = new Addr();
            order.setAddr(addr);

        return DaoHelper.selectOne(sql, rs -> {
            order.setNo(rs.getInt("ORDER_NO"));
            order.setOrderDate(rs.getDate("ORDER_DATE"));
            order.setStatus(rs.getString("ORDER_STATUS"));
            order.setPrice(rs.getInt("ORDER_PRICE"));
            order.setAmount(rs.getInt("ORDER_AMOUNT"));
            order.setDeliveryPrice(rs.getInt("DELIVERY_PRICE"));
            order.setUsePoint(rs.getInt("USE_POINT"));
            order.setDiscountPrice(rs.getInt("ORDER_DISCOUNT_PRICE"));
            order.setPaymentPrice(rs.getInt("PAYMENT_PRICE"));
            order.setDepositPoint(rs.getInt("DEPOSIT_POINT"));
            order.getUser().setNo(rs.getInt("USER_NO"));
            order.getAddr().setNo(rs.getInt("ADDR_NO"));
            return order;
        }, orderNo);
    }

    public List<Order> getAllOrderByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM ORDERS 
                WHERE USER_NO = ?
                """;
        Order order = new Order();
        User user = new User();
        user.setNo(userNo);
        order.setUser(user);
        Addr addr = new Addr();
        order.setAddr(addr);

        return DaoHelper.selectList(sql, rs-> {
            order.setNo(rs.getInt("ORDER_NO"));
            order.setOrderDate(rs.getDate("ORDER_DATE"));
            order.setStatus(rs.getString("ORDER_STATUS"));
            order.setPrice(rs.getInt("ORDER_PRICE"));
            order.setAmount(rs.getInt("ORDER_AMOUNT"));
            order.setDeliveryPrice(rs.getInt("DELIVERY_PRICE"));
            order.setUsePoint(rs.getInt("USE_POINT"));
            order.setDiscountPrice(rs.getInt("ORDER_DISCOUNT_PRICE"));
            order.setPaymentPrice(rs.getInt("PAYMENT_PRICE"));
            order.setDepositPoint(rs.getInt("DEPOSIT_POINT"));
            order.getUser().setNo(rs.getInt("USER_NO"));
            order.getAddr().setNo(rs.getInt("ADDR_NO"));
            return order;
        }, userNo);
    }

    public List<Order> getAllOrderByUserNo(int userNo, int begin, int end) {
        String sql = """
                SELECT *
                FROM (
                       SELECT row_number() over (order by order_no desc) AS rownumber
                            , order_no
                            , payment_price
                            , order_date
                            , order_amount
                            , order_status
                       From ORDERS
                       where user_no = ?
                       order by order_no desc
                       )  
                WHERE rownumber BETWEEN ? AND ?
                """;
        Order order = new Order();
        User user = new User();
        user.setNo(userNo);
        order.setUser(user);
        Addr addr = new Addr();
        order.setAddr(addr);

        return DaoHelper.selectList(sql, rs-> {
            order.setNo(rs.getInt("ORDER_NO"));
            order.setOrderDate(rs.getDate("ORDER_DATE"));
            order.setStatus(rs.getString("ORDER_STATUS"));
            order.setAmount(rs.getInt("ORDER_AMOUNT"));
            order.setPaymentPrice(rs.getInt("PAYMENT_PRICE"));
            return order;
        }, userNo, begin, end);
    }

//    public Order getMostLatelyOrderNoByUserNo (int userNo) throws SQLException {
//     String sql = """
//             SELECT ORDER_NO
//              FROM (
//                      SELECT ORDER_NO
//                      FROM ORDERS
//                      WHERE USER_NO = ?
//                      ORDER BY ORDER_DATE DESC
//              )
//              WHERE ROWNUM = 1
//             """;
//        Connection con = DaoHelper.getConnection();
//        PreparedStatement pstmt = con.prepareStatement(sql);
//        pstmt.setInt(1, userNo);
//        ResultSet rs =  pstmt.executeQuery();
//        Order order = null;
//
//        while(rs.next()){
//            order = new Order();
//            order.setNo(rs.getInt("ORDER_NO"));
//        }
//
//        rs.close();
//        pstmt.close();
//        con.close();
//
//        return order;
//    }

//    public List<Order> getOrdersInfoByUserNo(int userNo) {
//        String sql = """
//                SELECT O.USER_NO
//                    , O.ORDER_NO
//                    , O.ORDER_DATE
//                    , O.ORDER_STATUS
//                    , D.DELIVERY_PRODUCT_PRICE
//                    , D.DELIVERY_PRODUCT_AMOUNT
//                    , D.DELIVERY_STATUS
//                    , P.PRODUCT_NO
//                    , P.PRODUCT_NAME
//                    , I.IMG_NAME
//                FROM ORDERS O JOIN ORDER_DELIVERY_PRODUCTS D
//                        ON O.ORDER_NO = D.ORDER_NO
//                    JOIN PRODUCTS P
//                        ON D.PRODUCT_NO = P.PRODUCT_NO
//                    JOIN PRODUCT_IMGS I
//                        ON P.PRODUCT_NO = I.PRODUCT_NO
//                    JOIN PRODUCT_STOCKS S
//                        ON P.PRODUCT_NO = S.PRODUCT_NO
//                WHERE O.USER_NO = ?
//                """;
//        return DaoHelper.selectList(sql, rs -> {
//            Order order = new Order();
//
//            order.setNo(rs.getInt("ORDER_NO"));
//            order.setOrderDate(rs.getDate("ORDER_DATE"));
//            order.setStatus(rs.getString("ORDER_STATUS"));
//            order.setPaymentPrice(rs.getInt("DELIVERY_PRODUCT_PRICE"));
//            order.setAmount(rs.getInt("DELIVERY_PRODUCT_AMOUNT"));
//            order.setDeliveryStatus(rs.getString("DELIVERY_STATUS"));
//
//            User user = new User();
//            user.setNo(rs.getInt("USER_NO"));
//            order.setUser(user);
//
//            Product product = new Product();
//            product.setNo(rs.getInt("PRODUCT_NO"));
//            product.setName(rs.getString("PRODUCT_NAME"));
//            product.setDefaultImage(rs.getString("IMG_NAME"));
//            order.setProducts(product);
//
//            return order;
//        }, userNo);
//    }

    public int getAllTotalRowsByUserNo(int userNo) {
        String sql = """
                SELECT COUNT(*)
                FROM ORDERS
                WHERE USER_NO = ?
                """;

        return DaoHelper.selectOneInt(sql, userNo);
    }

    public List<Order> getAllOrderByUserNo(int begin, int end) {
        String sql = """
                SELECT ROW_NUMBER() OVER (ORDER BY ORDER_NO DESC) ROWNUMBER
                        , ORDER_NO
                        , ORDER_DATE
                        , ORDER_STATUS
                        , ORDER_PRICE
                        , ORDER_AMOUNT
                        , DELIVERY_PRICE
                        , USE_POINT
                        , ORDER_DISCOUNT_PRICE
                        , PAYMENT_PRICE
                        , USER_NO
                FROM ORDERS
                WHERE ROWNUMBER BETWEEN ? AND ?
                    AND USER_NO = ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Order order = new Order();
            order.setNo(rs.getInt("ORDER_NO"));
            order.setOrderDate(rs.getDate("ORDER_DATE"));
            order.setStatus(rs.getString("ORDER_STATUS"));
            order.setPrice(rs.getInt("ORDER_PRICE"));
            order.setAmount(rs.getInt("ORDER_AMOUNT"));
            order.setDeliveryPrice(rs.getInt("DELIVERY_PRICE"));
            order.setUsePoint(rs.getInt("USE_POINT"));
            order.setDiscountPrice(rs.getInt("ORDER_DISCOUNT_PRICE"));
            order.setPaymentPrice(rs.getInt("PAYMENT_PRICE"));

            User user = new User();
            user.setNo(rs.getInt("USER_NO"));
            order.setUser(user);

            return order;
        }, begin, end);
    }
}
