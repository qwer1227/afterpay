package com.jhta.afterpay.user;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;


public class QnaDao {

    public List<Qna> getAllQna() {
        String sql = """
                select qna_no
                    ,qna_title
                    ,qna_content
                    ,qna_cnt
                    ,qna_created_date = sysdate
                    ,qna_replied_date = sysdate
                    ,qna_replied_content
                from qnas
                """;

        return DaoHelper.selectList(sql, rs -> {
            Qna qna = new Qna();
            qna.setNo(rs.getInt("QNA_NO"));
            qna.setTitle(rs.getString("QNA_TITLE"));
            qna.setContent(rs.getString("QNA_CONTENT"));
            qna.setCnt(rs.getInt("QNA_CNT"));
            qna.setCreatedDate(rs.getDate("QNA_CREATED_DATE"));
            qna.setRepliedDate(rs.getDate("QNA_REPLY_DATE"));
            qna.setRepliedContent(rs.getString("QNA_REPLY_CONTENT"));


            return qna;
        });
    }

    /**
     * 사용자가 삭제하지 않은 문의 게시글 목록 조회
     * @param userNo
     * @return
     */
    public List<Qna> getQnaByUserNo(int userNo) {
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
            qna.setUserNo(user);

            return qna;
        }, userNo);
    }
}
