package com.jhta.afterpay.user;

import com.jhta.afterpay.user.PointHistory;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class PointHistoryDao {

    /**
     * 사용자번호를 전달받아 적립금 내역 전체 조회
     * @param userNo
     * @return
     */
    public List<PointHistory> getPointHistoriesByUserNo(int userNo) {
        String sql = """
                SELECT HISTORY_POINT
                    , HISTORY_DATE
                    , HISTORY_CONTENT
                    , HISTORY_CURRENT_POINT
                FROM POINT_HISTORIES
                WHERE USER_NO = ?
                ORDER BY HISTORY_DATE DESC
                """;
        return DaoHelper.selectList(sql, rs -> {
            PointHistory point = new PointHistory();

            point.setPoint(rs.getInt("history_point"));
            point.setHistoryDate(rs.getDate("history_date"));
            point.setContent(rs.getString("history_content"));
            point.setCurrentPoint(rs.getInt("history_current_point"));

            return point;
        }, userNo);
    }

    public void insertHistory(PointHistory pointHistory) {
        String sql = """
                INSERT INTO POINT_HISTORIES
                    (HISTORY_NO, USER_NO, HISTORY_DATE, HISTORY_CONTENT, HISTORY_POINT, HISTORY_CURRENT_POINT)
                VALUES
                    (HISTORY_NO_SEQ.NEXTVAL, ?, SYSDATE, ?, ?, ?)
                """;
        DaoHelper.insert(sql, pointHistory.getUserNo()
                            , pointHistory.getContent()
                            , pointHistory.getPoint()
                            , pointHistory.getCurrentPoint());
    }
}
