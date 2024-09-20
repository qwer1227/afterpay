package com.jhta.afterpay.user;

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

    /**
     * 회원 번호 조회
     * @return 회원 번호
     */
    public int getSequence() {
        String sql = """
                SELECT USER_NO_SEQ.nextval FROM dual
                """;

        return DaoHelper.selectOneInt(sql);
    }

    public void InsertUser(User user) throws SQLException{
        String sql = """
                insert into users
                (user_no,user_name,user_id,user_password,user_tel,user_email)
                values
                (user_no_seq.nextval,?,?,?,?,?)
                """;

        DaoHelper.insert(sql,user.getName(),user.getId(),user.getPwd(),user.getTel(),user.getEmail());
    }

    public User getUserByNo(int userNo) throws  SQLException{
        String sql = """
                select *
                from users
                where user_no = ?
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

        }, userNo);
    }

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

