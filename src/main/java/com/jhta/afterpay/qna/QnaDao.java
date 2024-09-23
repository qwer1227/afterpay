package com.jhta.afterpay.qna;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;


public class QnaDao {

    /**
     * 전체 문의갯수를 조회해서 반환한다.
     * @return 문의 갯수
     */
    public int getAllTotalRows() {
        String sql = """
                SELECT COUNT(*)
                FROM QNAS
                """;

        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 사용자가 삭제하지 않은 전체 문의객수 조회해서 반환
     * @return
     */
    public int getNotDeleteTotalRows() {
        String sql = """
                SELECT COUNT(*)
                FROM QNAS
                WHERE ISQNADELETED = 'N'
                """;

        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 페이지처리가 되는 문의 전체 조회 기능
     * @param begin 첫번째 페이지
     * @param end   마지막 페이지
     * @return
     */
    public List<Qna> getAllQna(int begin, int end) {
        String sql = """
                    SELECT *
                    FROM(
                        SELECT ROW_NUMBER() OVER (ORDER BY QNA_NO DESC) ROWNUMBER
                        ,Q.QNA_NO
                        ,Q.QNA_TITLE
                        ,Q.QNA_CNT
                        ,Q.QNA_CREATED_DATE
                        ,Q.QNA_REPLIED_DATE
                        ,U.USER_NO
                        ,U.USER_NAME
                    FROM QNAS Q, USERS U
                    WHERE Q.USER_NO = U.USER_NO
                    )
                    WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Qna qna = new Qna();
            qna.setNo(rs.getInt("QNA_NO"));
            qna.setTitle(rs.getString("QNA_TITLE"));
            qna.setCnt(rs.getInt("QNA_CNT"));
            qna.setCreatedDate(rs.getDate("QNA_CREATED_DATE"));
            qna.setRepliedDate(rs.getDate("QNA_REPLIED_DATE"));

            User user = new User();
            user.setNo(rs.getInt("USER_NO"));
            user.setName(rs.getString("USER_NAME"));
            qna.setUser(user);

            return qna;
        }, begin, end);
    }

    /**
     * 사용자가 삭제하지 않은 문의 게시글 목록 조회
     * @param userNo
     * @return 사용자의 게시글 목록
     */
    public List<Qna> getQnaListByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM QNAS
                WHERE USER_NO = ?
                    AND ISQNADELETED = 'N'
                ORDER BY QNA_CREATED_DATE DESC
                """;

        return DaoHelper.selectList(sql, rs -> {
            Qna qna = new Qna();

            qna.setNo(rs.getInt("qna_no"));
            qna.setTitle(rs.getString("qna_title"));
            qna.setContent(rs.getString("qna_content"));
            qna.setCnt(rs.getInt("qna_cnt"));
            qna.setCreatedDate(rs.getDate("qna_created_date"));
            qna.setRepliedDate(rs.getDate("qna_replied_date"));
            qna.setRepliedContent(rs.getString("qna_replied_content"));
            qna.setIsQnaDeleted(rs.getString("isqnadeleted"));


            User user = new User();
            user.setNo(rs.getInt("user_no"));
            qna.setUser(user);

            return qna;
        }, userNo);
    }

    /**
     * 사용자번호와 동일한 문의내용 조회
     * @param userNo
     * @return
     */
    public Qna getQnaByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM QNAS
                WHERE USER_NO = ?
                    AND ISQNADELETED = 'N'
                ORDER BY QNA_CREATED_DATE DESC
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Qna qna = new Qna();

            qna.setNo(rs.getInt("qna_no"));
            qna.setTitle(rs.getString("qna_title"));
            qna.setContent(rs.getString("qna_content"));
            qna.setCnt(rs.getInt("qna_cnt"));
            qna.setCreatedDate(rs.getDate("qna_created_date"));
            qna.setRepliedDate(rs.getDate("qna_replied_date"));
            qna.setRepliedContent(rs.getString("qna_replied_content"));
            qna.setIsQnaDeleted(rs.getString("isqnadeleted"));


            User user = new User();
            user.setNo(rs.getInt("user_no"));
            qna.setUser(user);

            return qna;
        }, userNo);
    }

    /**
     * 문의 번호와 일치하는 문의내역 조회
     * @param qnaNo
     * @return
     */
    public Qna getQnaByQnaNo(int qnaNo) {
        String sql = """
                SELECT QNA_NO
                    , QNA_TITLE
                    , QNA_CONTENT
                    , QNA_CREATED_DATE
                    , QNA_REPLIED_CONTENT
                FROM QNAS
                WHERE QNA_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Qna qna = new Qna();

            qna.setNo(rs.getInt("qna_no"));
            qna.setTitle(rs.getString("qna_title"));
            qna.setContent(rs.getString("qna_content"));
            qna.setCreatedDate(rs.getDate("qna_created_date"));
            qna.setRepliedContent(rs.getString("qna_replied_content"));

            return qna;
        }, qnaNo);
    }

    /**
     * 문의내용 수정
     * @param qna
     */
    public void updateQna(Qna qna) {
        String sql = """
                UPDATE QNAS
                SET 
                    QNA_CONTENT = ?
                    , ISQNADELETED = ?
                WHERE QNA_NO = ?
                """;
        DaoHelper.update(sql
                        , qna.getContent()
                        , qna.getIsQnaDeleted()
                        , qna.getNo());
    }

    /**
     * 문의내용 추가
     * @param qna
     */
    public void insertQna(Qna qna) {
        String sql = """
                INSERT INTO QNAS
                    (QNA_NO, QNA_TITLE, QNA_CONTENT, QNA_CREATED_DATE, USER_NO)
                VALUES
                    (QNA_NO_SEQ.NEXTVAL, ?, ?, SYSDATE, ?)
                """;
        DaoHelper.insert(sql
                , qna.getTitle()
                , qna.getContent()
                , qna.getUser().getNo());
    }

    public void deleteQna(int qnaNo) {
        String sql = """
                UPDATE QNAS
                SET ISQNADELETED = 'Y'
                WHERE QNA_NO = ?
                """;
        DaoHelper.update(sql
                        , qnaNo);
    }

    public void deleteQnas(Qna qna) {
        String sql = """
                UPDATE QNAS
                SET ISQNADELETED = 'Y'
                WHERE QNA_NO = ?
                """;
        DaoHelper.update(sql,qna.getNo());
    }

    public int getAllTotalRowsByUserNo() {
        String sql = """
                SELECT COUNT(*)
                FROM QNAS
                WHERE ISQNADELETED = 'N'
                """;

        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 페이지처리가 되는 문의 전체 조회 기능
     * @param begin 첫번째 페이지
     * @param end   마지막 페이지
     * @return
     */
    public List<Qna> getAllQnaByUserNo(int begin, int end) {
        String sql = """
                    SELECT *
                    FROM(
                        SELECT ROW_NUMBER() OVER (ORDER BY QNA_NO DESC) ROWNUMBER
                        ,Q.QNA_NO
                        ,Q.QNA_TITLE
                        ,Q.QNA_CNT
                        ,Q.QNA_CREATED_DATE
                        ,Q.QNA_REPLIED_DATE
                        ,U.USER_NO
                        ,U.USER_NAME
                    FROM QNAS Q, USERS U
                    WHERE Q.USER_NO = U.USER_NO
                        AND ISQNADELETED = 'N'
                    )
                    WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Qna qna = new Qna();
            qna.setNo(rs.getInt("QNA_NO"));
            qna.setTitle(rs.getString("QNA_TITLE"));
            qna.setCnt(rs.getInt("QNA_CNT"));
            qna.setCreatedDate(rs.getDate("QNA_CREATED_DATE"));
            qna.setRepliedDate(rs.getDate("QNA_REPLIED_DATE"));

            User user = new User();
            user.setNo(rs.getInt("USER_NO"));
            user.setName(rs.getString("USER_NAME"));
            qna.setUser(user);

            return qna;
        }, begin, end);
    }
}