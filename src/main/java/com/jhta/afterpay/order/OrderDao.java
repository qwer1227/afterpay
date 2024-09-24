package com.jhta.afterpay.order;

import com.jhta.afterpay.addr.Addr;
import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OrderDao {

    /**
     * 주문 추가
     *
     * @param order
     * @throws SQLException
     */
    public void insertOrder(Order order) throws SQLException {
        String sql = """
                    insert into ORDERS
                    (ORDER_NO
                    , ORDER_PRICE, ORDER_AMOUNT , DELIVERY_PRICE 
                    , USE_POINT , ORDER_DISCOUNT_PRICE, PAYMENT_PRICE          
                    , DEPOSIT_POINT, USER_NO, ADDR_NO
                    , DELIVERY_MESSAGE, TEL, EMAIL)
                    VALUES
                    (ORDER_NO_SEQ.NEXTVAL
                    , ?, ?, ?
                    , ?, ?, ? 
                    , ?, ?, ?
                    , ?, ?, ?)
                """;
        DaoHelper.insert(sql
                , order.getPrice(), order.getAmount(), order.getDeliveryPrice()
                , order.getUsePoint(), order.getDiscountPrice(), order.getPaymentPrice()
                , order.getDepositPoint(), order.getUser().getNo(), order.getAddr().getNo()
                , order.getDeliveryMessage(), order.getTel(), order.getEmail()
        );
    }


    /**
     * 주문 삭제
     *
     * @param orderNo
     */
    public void deleteOrder(String orderNo) {
        String sql = """
                DELETE FROM ORDERS WHERE ORDER_NO = ?
                """;
        DaoHelper.delete(sql, orderNo);
    }

    /**
     * 주문번호로 주문 조회
     *
     * @param orderNo
     * @return
     */
    public Order getOrderByNo(int orderNo) {
        String sql = """
                SELECT *
                FROM ORDERS 
                WHERE ORDER_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Order order = new Order();
            User user = new User();
            order.setUser(user);
            Addr addr = new Addr();
            order.setAddr(addr);
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
            order.setDeliveryMessage(rs.getString("DELIVERY_MESSAGE"));
            order.getUser().setNo(rs.getInt("USER_NO"));
            order.getAddr().setNo(rs.getInt("ADDR_NO"));
            return order;
        }, orderNo);
    }

    /**
     * 회원번호로 주문한 모든 주문조회
     *
     * @param userNo
     * @return
     */
    public List<Order> getAllOrdersByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM ORDERS 
                WHERE USER_NO = ?
                ORDER BY ORDER_DATE DESC
                """;

        return DaoHelper.selectList(sql, rs -> {
            Order order = new Order();
            User user = new User();
            user.setNo(userNo);
            order.setUser(user);
            Addr addr = new Addr();
            order.setAddr(addr);
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
            order.setDeliveryMessage(rs.getString("DELIVERY_MESSAGE"));
            order.getUser().setNo(rs.getInt("USER_NO"));
            order.getAddr().setNo(rs.getInt("ADDR_NO"));
            return order;
        }, userNo);
    }

    /**
     * 회원번호로 모든 주문조회
     *
     * @param userNo
     * @param begin
     * @param end
     * @return
     */
    public List<Order> getAllOrdersByUserNo(int userNo, int begin, int end) {
        String sql = """
                SELECT *
                FROM (
                       SELECT row_number() over (order by order_no desc) AS rn
                            , order_no
                            , payment_price
                            , order_date
                            , order_amount
                            , order_status
                       From ORDERS
                       where user_no = ?
                       order by order_no desc
                       )  
                WHERE rn BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Order order = new Order();

            User user = new User();
            user.setNo(userNo);
            order.setUser(user);

            order.setNo(rs.getInt("ORDER_NO"));
            order.setOrderDate(rs.getDate("ORDER_DATE"));
            order.setStatus(rs.getString("ORDER_STATUS"));
            order.setAmount(rs.getInt("ORDER_AMOUNT"));
            order.setPaymentPrice(rs.getInt("PAYMENT_PRICE"));
            return order;
        }, userNo, begin, end);
    }

    /**
     * 회원번호로 가장 최근 주문조회
     *
     * @param userNo
     * @return
     * @throws SQLException
     */
    public Order getMostLatelyOrderNoByUserNo(int userNo) throws SQLException {
        String sql = """
                SELECT ORDER_NO
                 FROM (
                         SELECT ORDER_NO
                         FROM ORDERS
                         WHERE USER_NO = ?
                         ORDER BY ORDER_DATE DESC
                 )
                 WHERE ROWNUM = 1
                """;
        Connection con = DaoHelper.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, userNo);
        ResultSet rs = pstmt.executeQuery();
        Order order = null;

        while (rs.next()) {
            order = new Order();
            order.setNo(rs.getInt("ORDER_NO"));
        }

        rs.close();
        pstmt.close();
        con.close();

        return order;
    }

    /**
     * 회원번호로 조회되는 모든 주문 개수
     *
     * @param userNo
     * @return
     */
    public int getTotalRowsByUserNo(int userNo) {
        String sql = """
                    select count(*)
                    from ORDERS
                    where USER_NO = ?
                """;
        return DaoHelper.selectOneInt(sql, userNo);
    }
}
