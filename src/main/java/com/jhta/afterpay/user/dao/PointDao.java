package com.jhta.afterpay.user.dao;

import com.jhta.afterpay.user.vo.Point;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;

public class PointDao {

    public Point getPointByUserNo(int userNo) throws SQLException{
        String sql = """
                SELECT HISTORY_NO
                    , HISTORY_DATE
                    , HISTORY_CONTENT
                    , HISTORY_POINT
                FROM POINT_HISTORIES
                WHERE USER_NO = ?
                """;

            return DaoHelper.selectOne()
    }
}
