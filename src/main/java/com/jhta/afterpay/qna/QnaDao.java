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
}
