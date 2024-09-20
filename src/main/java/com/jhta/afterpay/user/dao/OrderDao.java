package com.jhta.afterpay.user.dao;

import com.jhta.afterpay.user.vo.Order;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.List;

public class OrderDao {

    /**
     * 사용자번호를 전달받아 해당하는 사용자의 주문 내역 전체 조회
     * @param userNo
     * @return
     * @throws SQLException
     */
    public List<Order> getOrderByUserNo(int userNo) throws SQLException{
        String sql = """
                SELECT *
                FROM ORDERS
                WHERE USER_NO = ?
                """;
        return DaoHelper.selectList(sql, rs -> {
            Order order = new Order();
            order.setUserNo(rs.getInt("user_no"));
            return order;
        }, userNo);
    }
}
