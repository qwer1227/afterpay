package com.jhta.afterpay.user.dao;

import com.jhta.afterpay.user.vo.Address;
import com.jhta.afterpay.user.vo.User;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
            user.setPoint(rs.getInt("point"));
            user.setCreatedDate(rs.getDate("created_date"));
            user.setGradeId(rs.getString("grade_id"));
            return user;
        }, id);
    }

    public User getUserByNo(int no) throws SQLException {
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
            user.setPoint(rs.getInt("point"));
            user.setCreatedDate(rs.getDate("created_date"));
            user.setGradeId(rs.getString("grade_id"));
            return user;
        }, no);
    }

    public void updateUserInfoByUserNo(User user) throws SQLException {
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
}
