package com.jhta.afterpay.order;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.List;

public class OrderDao {

    /**
     * 전체 주문 수를 조회해서 반환한다.
     * @return 총 주문 수
     */
    public int getTotalRows() {
        String sql = """
                select count(*)
                from orders
                """;

        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 주문 번호 조회
     * @return 주문 번호
     */
    public int getSequence() {
        String sql = """
                SELECT ORDER_NO_SEQ.nextval FROM dual
                """;

        return DaoHelper.selectOneInt(sql);
    }

    public void InsertOrder(Order order) throws SQLException {
        String sql = """
                insert into orders
                (order_no,order_status,order_status,order_deliveryMessage)
                values
                (order_no_seq.nextval,?,?)
                """;

        DaoHelper.insert(sql,order.getStatus(),order.getDeliveryMessage());
    }

    /**
     * 전체 주문 조회
     * @param begin 첫 페이지
     * @param end   끝 페이지
     * @return
     */
    public List<Order> getAllOrders(int begin, int end) {
        String sql = """
                SELECT *
                FROM(
                    SELECT ROW_NUMBER() OVER (ORDER BY USER_NO DESC) ROWNUMBER
                       ,O.ORDER_NO
                        , U.USER_NO
                        , U.USER_NAME
                        , O.ORDER_STATUS
                        , OD.DELIVERY_STATUS
                        FROM ORDERS O, order_delivery_products OD, USERS U
                        WHERE O.ORDER_NO = OD.ORDER_NO
                        AND O.USER_NO = U.USER_NO;
                    )
                    WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Order order = new Order();
            order.setNo(rs.getInt("order_no"));
            order.setOrderDate(rs.getDate("order_date"));
            order.setStatus(rs.getString("order_status"));

            User user = new User();
            user.setNo(rs.getInt("user_no"));
            user.setName(rs.getString("user_name"));
            order.setUser(user);

            OrderDelivery orderDelivery = new OrderDelivery();


            return order;

        }, begin, end);
    }

    public Order getOrderByNo(int orderNo) {
    }
}

