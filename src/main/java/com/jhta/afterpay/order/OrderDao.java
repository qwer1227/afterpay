package com.jhta.afterpay.order;

import com.jhta.afterpay.addr.Addr;
import com.jhta.afterpay.delivery.Delivery;
import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.product.Stock;
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

    public List<Delivery> getDeliveriesByOrderNo(int orderNo) {

        String sql = """
                select
                    o.delivery_no,
                    o.delivery_product_price,
                    o.delivery_product_amount,
                    o.delivery_status,
                    p.product_no,
                    p.product_name,
                    p.product_price,
                    (select img_name
                     from product_imgs
                     where product_no = p.product_no
                     and isthumb = 'Y') default_Image,
                    s.product_stock_no,
                    s.product_stock_size

                from order_delivery_products o, products p, product_stocks s
                where o.order_no = ?
                and o.product_no = p.product_no
                and o.product_stock_no = s.product_stock_no
	""";

        return DaoHelper.selectList(sql, rs -> {

            Delivery delivery = new Delivery();
            delivery.setNo(rs.getInt("delivery_no"));
            delivery.setPrice(rs.getInt("delivery_product_price"));
            delivery.setAmount(rs.getInt("delivery_product_amount"));
            delivery.setStatus(rs.getString("delivery_status"));

            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            product.setName(rs.getString("product_name"));
            product.setPrice(rs.getInt("product_price"));
            product.setDefaultImage(rs.getString("default_image"));
            delivery.setProduct(product);

            Stock stock = new Stock();
		    stock.setProductNo(rs.getInt("product_stock_no"));
            stock.setSize(rs.getString("product_stock_size"));
            delivery.setStock(stock);

            return delivery;

        }, orderNo);
    }


    /**
     * 주문번호로 주문 조회
     *
     * @param orderNo
     * @return
     */
    public Order getAllOrderByNo(int orderNo) {
        String sql = """
                SELECT O.ORDER_NO
                , O.ORDER_PRICE
                , O.ORDER_DATE
                , O.ORDER_STATUS
                , O.ORDER_AMOUNT
                , O.DELIVERY_PRICE
                , O.USE_POINT
                , O.ORDER_DISCOUNT_PRICE
                , O.PAYMENT_PRICE
                , O.DEPOSIT_POINT
                , O.DELIVERY_MESSAGE
                , U.USER_NO
                , U.USER_NAME
                , U.USER_ID
                , A.ADDR_NO
                , A.ADDR_NAME
                , A.ZIP_CODE
                , A.ADDR_TEL
                , A.ADDR_1
                , A.ADDR_2
                FROM ORDERS O, USERS U, ADDRESSES A
                WHERE O.USER_NO = U.USER_NO
                AND O.ADDR_NO= A.ADDR_NO
                and O.ORDER_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
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
            order.setDepositPoint(rs.getInt("DEPOSIT_POINT"));
            order.setDeliveryMessage(rs.getString("DELIVERY_MESSAGE"));

            User user = new User();
            user.setNo(rs.getInt("USER_NO"));
            user.setName(rs.getString("USER_NAME"));
            user.setId(rs.getString("USER_ID"));
            order.setUser(user);

            Addr addr = new Addr();
            addr.setNo(rs.getInt("ADDR_NO"));
            addr.setName(rs.getString("ADDR_NAME"));
            addr.setZipCode(rs.getString("ZIP_CODE"));
            addr.setTel(rs.getString("ADDR_TEL"));
            addr.setAddr1(rs.getString("ADDR_1"));
            addr.setAddr2(rs.getString("ADDR_2"));
            order.setAddr(addr);


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

    /**
     * 전체 회원 수를 조회해서 반환한다.
     *
     * @return 회원 수
     */
    public int getTotalRows() {
        String sql = """
                select count(*)
                from orders
                """;

        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 회원번호로 모든 주문조회
     *
     * @param begin
     * @param end
     * @return
     */
    public List<Order> getAllOrders(int begin, int end) {
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
                       order by order_no desc
                       )  
                WHERE rn BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Order order = new Order();
            order.setNo(rs.getInt("ORDER_NO"));
            order.setOrderDate(rs.getDate("ORDER_DATE"));
            order.setStatus(rs.getString("ORDER_STATUS"));
            order.setAmount(rs.getInt("ORDER_AMOUNT"));
            order.setPaymentPrice(rs.getInt("PAYMENT_PRICE"));
            return order;
        }, begin, end);
    }

    public void updateOrderStatus(Order order) {
        String sql = """
                UPDATE ORDERS 
                SET order_status = ?
                WHERE ORDER_NO = ?
                """;

        DaoHelper.update(sql,
                order.getStatus()
                , order.getNo());
    }

}
