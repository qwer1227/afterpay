package com.jhta.afterpay.user.dao;

import com.jhta.afterpay.user.vo.Point;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.List;

public class PointDao {

    /**
     * 사용자번호를 전달받아 적립금 내역 조회
     * @param userNo
     * @return
     */
    public List<Point> getPointHistoriesByUserNo(int userNo) {
        String sql = """
                SELECT U.POINT
                    , U.TOTAL_POINT
                    , U.TOTAL_USED_POINT
                    , H.HISTORY_DATE
                    , H.HISTORY_CONTENT
                FROM USERS U JOIN POINT_HISTORIES H
                    ON U.USER_NO = H.USER_NO
                WHERE U.USER_NO = ?
                """;
        return DaoHelper.selectList(sql, rs -> {
            Point point = new Point();
            point.setPoint(rs.getInt("u.point"));
            point.setTotalPoint(rs.getInt("u.total_point"));
            point.setUsedPoint(rs.getInt("u.total_used_point"));
            point.setHistoryDate(rs.getDate("h.history_date"));
            point.setContent(rs.getString("h.history_content"));
            return point;
        }, userNo);
    }
}
