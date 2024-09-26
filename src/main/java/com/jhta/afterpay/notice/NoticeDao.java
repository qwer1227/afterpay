package com.jhta.afterpay.notice;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class NoticeDao {

    public void updateNotice(Notice notice) {
        String sql = """
                UPDATE NOTICES
                SET NOTICE_TITLE = ?
                , NOTICE_CONTENT = ?
                , ISNOTICEDELETED = ?
                WHERE NOTICE_NO = ?
                """;

        DaoHelper.update(sql
                , notice.getTitle()
                , notice.getContent()
                , notice.getIsDeleted()
                , notice.getNo());
    }

    public void insertNotice(Notice notice) {
        String sql = """
                    INSERT INTO NOTICES
                            (NOTICE_NO
                            , NOTICE_TITLE
                            , NOTICE_CONTENT
                            )
                    VALUES(NOTICE_NO_SEQ.NEXTVAL, ?, ?)
                """;

        DaoHelper.insert(sql, notice.getTitle()
                , notice.getContent());
    }

    /**
     * 공지사항의 총 갯수를 반환한다
     *
     * @return 총 갯수
     */
    public int getTotalRows() {
        String sql = """
                        SELECT COUNT(*)
                        FROM NOTICES
                        WHERE ISNOTICEDELETED = 'N'
                """;
        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 공지사항의 최소와 최대값 갯수를 넣으면 모든 공지사항 리스트를 반환한다.
     *
     * @param begin
     * @param end
     * @return
     */
    public List<Notice> getNotices(int begin, int end) {
        String sql = """
                SELECT * 
                FROM (SELECT ROW_NUMBER() OVER (ORDER BY NOTICE_NO) ROW_NUM
                           , NOTICE_NO
                           , NOTICE_TITLE
                           , NOTICE_CREATED_DATE
                           FROM NOTICES 
                           WHERE ISNOTICEDELETED = 'N')
                WHERE ROW_NUM BETWEEN ? AND ?
                
                """;

        return DaoHelper.selectList(sql, rs -> {
            Notice notice = new Notice();
            notice.setNo(rs.getInt("NOTICE_NO"));
            notice.setTitle(rs.getString("NOTICE_TITLE"));
            notice.setCreatedDate(rs.getDate("NOTICE_CREATED_DATE"));

            return notice;

        }, begin, end);
    }

    /**
     * 공지사항의 번호를 넣으면 그 번호에 해당하는 세부내용을 반환한다.
     *
     * @param No
     * @return
     */
    public Notice getNoticeDetailByNo(int No) {
        String sql = """
                SELECT NOTICE_NO
                    , NOTICE_TITLE
                    , NOTICE_CONTENT
                    , NOTICE_CREATED_DATE
                    , NOTICE_UPDATED_DATE
                    , NOTICE_REMARK
                    , ISNOTICEDELETED
                FROM NOTICES
                WHERE NOTICE_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Notice notice = new Notice();
            notice.setNo(rs.getInt("NOTICE_NO"));
            notice.setTitle(rs.getString("NOTICE_TITLE"));
            notice.setContent(rs.getString("NOTICE_CONTENT"));
            notice.setCreatedDate(rs.getDate("NOTICE_CREATED_DATE"));
            notice.setUpdatedDate(rs.getDate("NOTICE_UPDATED_DATE"));
            notice.setRemark(rs.getString("NOTICE_REMARK"));
            notice.setIsDeleted(rs.getString("ISNOTICEDELETED"));

            return notice;
        }, No);
    }

}
