package com.jhta.afterpay.user;

import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;

public class UserDao {

    public void InsertUser(User user) throws SQLException{
        String sql = """
                insert into users
                (user_no,user_email,user_id,user_password,user_name,user_tel)
                values
                (user_no_seq.nextval,?,?,?,?,?)
                """;

        DaoHelper.insert(sql,user.getEmail(),user.getId(),user.getPwd(),user.getName(),user.getTel());
    }

    /**
     * id로 해당하는 유저 정보 조회
     * @param id 조회할 id
     * @return id와 동일한 유저의 정보
     * @throws SQLException
     */
    public User getUserById(String id) throws  SQLException{
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

    /**
     * 사용자가 새로 입력한 정보를 db에 수정 반영
     * @param user
     * @return
     * @throws SQLException
     */
    public void updateUserInfoById(User user) throws SQLException{
        String sql = """
                select u.user_id
                     , u.user_email
                     , u.user_tel
                     , a.addr_1
                     , a.addr_2
                from users u join addresses a
                    on u.user_no = a.user_no
                where u.user_id = ?
                    and a.isAddr_home = 'Y';
                """;

        DaoHelper.update(sql
                    , user.getEmail()
                    , user.getTel()
                    , user.getAddr1()
                    , user.getAddr2());
    }
}
