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

    public void insertOrder(Order order) throws SQLException {
        String sql= """
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


    public void deleteOrder(String orderNo) {
        String sql = """
                DELETE FROM ORDERS WHERE ORDER_NO = ?
                """;
        DaoHelper.delete(sql, orderNo);
    }

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

    public List<Order> getAllOrderByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM ORDERS 
                WHERE USER_NO = ?
                ORDER BY ORDER_DATE DESC
                """;

        return DaoHelper.selectList(sql, rs-> {
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

    public List<Order> getAllOrderByUserNo(int userNo, int begin, int end) {
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

        return DaoHelper.selectList(sql, rs-> {
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

    public Order getMostLatelyOrderNoByUserNo (int userNo) throws SQLException {
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
        ResultSet rs =  pstmt.executeQuery();
        Order order = null;

        while(rs.next()){
            order = new Order();
            order.setNo(rs.getInt("ORDER_NO"));
        }

        rs.close();
        pstmt.close();
        con.close();

        return order;
    }

    public int getTotalRowsByUserNo(int userNo) {
        String sql = """
                    select count(*)
                    from ORDERS
                    where USER_NO = ?
                """;
        return DaoHelper.selectOneInt(sql, userNo);
    }
    /**
     * 전체 주문 수를 조회해서 반환한다.
     *
     * @return 주문 수
     */
    public int getTotalRows() {
        String sql = """
                select count(*)
                from orders
                """;

        return DaoHelper.selectOneInt(sql);
    }

    public List<Order> getAllOrders(int begin, int end) {
        String sql = """
                SELECT *
                FROM(
                     SELECT ROW_NUMBER() OVER (ORDER BY O.ORDER_NO DESC) ROWNUMBER
                     , O.ORDER_NO
                     , U.USER_NO
                     , U.USER_NAME
                     , O.ORDER_DATE
                     , O.ORDER_STATUS
                     FROM ORDERS O, USERS U
                     WHERE O.USER_NO = U.USER_NO
                     )
                WHERE ROWNUMBER BETWEEN ? AND ?
        """;

        return DaoHelper.selectList(sql, rs -> {
            User user = new User();
            user.setNo(rs.getInt("USER_NO"));
            user.setName(rs.getString("USER_NAME"));

            Order order = new Order();
            order.setUser(user);

            order.setNo(rs.getInt("order_no"));
            order.setOrderDate(rs.getDate("order_date"));
            order.setStatus(rs.getString("order_status"));

            return order;
        }, begin, end);

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
}
