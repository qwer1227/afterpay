package com.jhta.afterpay.user;

import com.jhta.afterpay.order.Order;
import com.jhta.afterpay.user.User;
import com.jhta.afterpay.user.PointHistory;
import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.List;

public class UserDao {

    /**
     * 회원 번호로 회원의 모든 정보를 반환한다.
     * @param userNo 회원번호
     * @return 해당 회원의 모든 정보
     */
    public User getAllUserByNo(int userNo) {
        String sql = """
                    select *
                    from users u
                    where u.user_no = ?
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

    /**
     * 회원 정보를 수정한다.
     * @param user 기존회원정보
     */
    public void updateAllUser(User user) {
        String sql = """
                UPDATE USERS
                SET USER_PASSWORD = ?
                    , USER_TEL = ?
                    , USER_EMAIL = ?
                    , GRADE_ID = ?
                    , ISBANNED = ?
                    , ISSIGNOUT = ?
                WHERE USER_NO = ?
                """;

        DaoHelper.update(sql, user.getPwd(), user.getTel(), user.getEmail(), user.getGradeId(), user.getIsBanned(), user.getIsSignOut(), user.getNo());
    }

    /**
     * 전체 회원 수를 조회해서 반환한다.
     *
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
        }, email, name);
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
        }, email, name, id);
    }

    public User getUserByPrevPw(String pw) throws SQLException {
        String sql = """
                select * 
                from users
                where user_password = ? 
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
        }, pw);
    }

    public void UpdatePwdToPrev(String pw, String id) {
        String sql = """
                update users
                set user_password = ?
                where user_id = ?
                """;
        DaoHelper.update(sql, pw, id);
    }

    public void UpdatePw(String pw, String id, String email, String name) {
        String sql = """
                update users
                set user_password = ?
                where user_id = ? and user_email = ? and user_name = ?
                """;
        DaoHelper.update(sql, pw, id, email, name);
    }

    public void DeletedByUserId(String type, String id) {
        String sql = """
                update users
                set issignout = ?
                where user_id = ?
                """;

        DaoHelper.update(sql, type, id);

    }

    public void InsertUser(User user) {
        String sql = """
                insert into users
                (user_no,user_name,user_id,user_password,user_tel,user_email,grade_id,isBanned,isSignOut)
                values
                (user_no_seq.nextval,?,?,?,?,?,?,?,?)
                """;

        DaoHelper.insert(sql,user.getName(),user.getId(),user.getPwd(),user.getTel(),user.getEmail(),user.getGradeId(),user.getIsBanned(),user.getIsSignOut());
    }

    public User getUserByEmail(String email) {
        String sql = """
                select *
                from users
                where user_email = ?
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
        }, email);
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

    public User getUserByNo(int userNo) {
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
                    , total_used_point = ?
                    , total_point = ?
                    , point = ?
                WHERE USER_NO = ?
                """;
        DaoHelper.update(sql, user.getEmail()
                , user.getTel()
                , user.getTotalUsedPoint()
                , user.getTotalPoint()
                , user.getPoint()
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
     *
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

    public List<User> getAllUserPoints(int begin, int end) {
        String sql = """
                SELECT *
                FROM(
                    SELECT ROW_NUMBER() OVER (ORDER BY USER_NO DESC) ROWNUMBER
                        , U.USER_NO
                        , U.USER_ID
                        , U.USER_NAME
                        , U.TOTAL_POINT
                        , U.TOTAL_USED_POINT
                        , U.POINT
                        FROM USERS U
                    )
                    WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            User user = new User();
            user.setNo(rs.getInt("user_no"));
            user.setId(rs.getString("user_id"));
            user.setName(rs.getString("user_name"));
            user.setTotalPoint(rs.getInt("total_point"));
            user.setTotalUsedPoint(rs.getInt("total_used_point"));
            user.setPoint(rs.getInt("point"));
            return user;

        }, begin, end);
    }
}

