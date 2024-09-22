package com.jhta.afterpay.user;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.user.PointHistory;
import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.List;

public class UserDao {

    /**
     * 전체 회원 수를 조회해서 반환한다.
     * @return 회원 수
     */
    public int getTotalRows() {
        String sql = """
                select count(*)
                from users
                """;

        return DaoHelper.selectOneInt(sql);
    }

    public User getUserIdByEmailAndName(String email, String name) throws SQLException {
        String sql = """
                select *
                from users
                where user_email = ? and user_name = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            User user = new User();
            user.setId(rs.getString("user_id"));
            return user;
        }, email,name);
    }

    public User getUserByEmailAndNameAndId(String email, String name, String id) throws SQLException {
        String sql = """
                select *
                from users
                where user_email = ? and user_name = ? and user_id = ?
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
        }, email,name,id);
    }


    public void InsertUser(User user) {
        String sql = """
                insert into users
                (user_no,user_name,user_id,user_password,user_tel,user_email)
                values
                (user_no_seq.nextval,?,?,?,?,?)
                """;

        DaoHelper.insert(sql,user.getName(),user.getId(),user.getPwd(),user.getTel(),user.getEmail());
    }

    public User getUserById(String id) {
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

    /**
     * 전체 회원 조회
     * @param begin 첫 페이지
     * @param end   끝 페이지
     * @return
     */
    public List<User> getAllUsers(int begin, int end) {
        String sql = """
                SELECT *
                FROM(
                    SELECT ROW_NUMBER() OVER (ORDER BY USER_NO DESC) ROWNUMBER
                        , U.USER_NO
                        , U.USER_ID
                        , U.USER_NAME
                        , U.CREATED_DATE
                        , U.GRADE_ID
                        , U.ISBANNED
                        FROM USERS U
                    )
                    WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            User user = new User();
            user.setNo(rs.getInt("user_no"));
            user.setId(rs.getString("user_id"));
            user.setName(rs.getString("user_name"));
            user.setCreatedDate(rs.getDate("created_date"));
            user.setGradeId(rs.getString("grade_id"));
            user.setIsBanned(rs.getString("ISBANNED"));
            return user;

        }, begin, end);
    }
}

