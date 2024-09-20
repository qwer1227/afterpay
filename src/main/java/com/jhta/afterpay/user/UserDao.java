package com.jhta.afterpay.user;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.user.PointHistory;
import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;

public class UserDao {

    public void InsertUser(User user) throws SQLException {
        String sql = """
                insert into users
                (user_no,user_email,user_id,user_password,user_name,user_tel)
                values
                (user_no_seq.nextval,?,?,?,?,?)
                """;

        DaoHelper.insert(sql, user.getEmail(), user.getId(), user.getPwd(), user.getName(), user.getTel());
    }

    public User getUserById(String id) throws SQLException {
        String sql = """
                select *
                from users
                where user_id = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            User user = new User();
            user.setNo(rs.getInt("user_no"));
            user.setEmail(rs.getString("user_email"));
            user.setId(rs.getString("user_id"));
            user.setPwd(rs.getString("user_password"));
            user.setName(rs.getString("user_name"));
            user.setTel(rs.getString("user_tel"));
            user.setIsBanned(rs.getString("isbanned"));
            user.setIsSignOut(rs.getString("issignout"));
            user.setCreatedDate(rs.getDate("created_date"));
            user.setGradeId(rs.getString("grade_id"));
            user.setPoint(rs.getInt("point"));

            return user;
        }, id);
    }

    public User getUserByNo(int userNo){
        String sql = """
                SELECT *
                FROM USERS
                WHERE USER_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            User user = new User();

            user.setNo(rs.getInt("user_no"));
            user.setEmail(rs.getString("user_email"));
            user.setId(rs.getString("user_id"));
            user.setPwd(rs.getString("user_password"));
            user.setName(rs.getString("user_name"));
            user.setTel(rs.getString("user_tel"));
            user.setIsBanned(rs.getString("isbanned"));
            user.setIsSignOut(rs.getString("issignout"));
            user.setCreatedDate(rs.getDate("created_date"));
            user.setGradeId(rs.getString("grade_id"));
            user.setTotalUsedPoint(rs.getInt("total_used_point"));
            user.setTotalPoint(rs.getInt("total_point"));
            user.setPoint(rs.getInt("point"));

            return user;
        }, userNo);
    }

    public void updateUser(User user) {
        String sql = """
                UPDATE USERS
                SET USER_EMAIL = ?
                    , USER_TEL = ?
                WHERE USER_NO = ?
                """;
        DaoHelper.update(sql, user.getEmail()
                            , user.getTel()
                            , user.getNo());
    }

    public int getPointStatusByUserNo(int userNo) {
        String sql = """
                SELECT POINT
                FROM USERS
                WHERE USER_NO = ?
                """;
        return DaoHelper.selectOneInt(sql, userNo);
    }
}
