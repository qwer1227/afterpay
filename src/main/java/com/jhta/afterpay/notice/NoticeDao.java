package com.jhta.afterpay.notice;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class NoticeDao {

    public void deleteNotice(Notice notice) {
        String sql = """
                delete from notices
                where notice_id=?""";
    }

    public void updateNotice(Notice notice) {
        String sql = """
                UPDATE NOTICES
                SET NOTICE_TITLE = ?
                , NOTICE_CONTENT = ?
                WHERE NOTICE_NO = ?
                """;

        DaoHelper.update(sql
                             , notice.getTitle()
                             , notice.getContent());
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
     * @return 총 갯수
     */
    public int getTotalRows() {
        String sql = """
                select count(*)
                from notices
                where isnoticedeleted = 'N'
        """;
        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 공지사항의 최소와 최대값 갯수를 넣으면 모든 공지사항 리스트를 반환한다.
     * @param begin
     * @param end
     * @return
     */
    public List<Notice> getNotices(int begin, int end) {
        String sql = """
                select * 
                from (select row_number() over (order by NOTICE_NO) row_num
                           , notice_no
                           , notice_title
                           , notice_created_date
                           from notices n)
                where row_num between ? and ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Notice notice = new Notice();
            notice.setNo(rs.getInt("notice_no"));
            notice.setTitle(rs.getString("notice_title"));
            notice.setCreatedDate(rs.getDate("notice_created_date"));

            return notice;

        }, begin, end);
    }

    /**
     * 공지사항의 번호를 넣으면 그 번호에 해당하는 세부내용을 반환한다.
     * @param No
     * @return
     */
    public Notice getNoticeDetailByNo(int No) {
        String sql = """
                select notice_no
                    , notice_title
                    , notice_content
                    , notice_created_date
                    , notice_updated_date
                    , notice_remark
                    , isnoticedeleted
                from notices
                where notice_no = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Notice notice = new Notice();
            notice.setNo(rs.getInt("notice_no"));
            notice.setTitle(rs.getString("notice_title"));
            notice.setContent(rs.getString("notice_content"));
            notice.setCreatedDate(rs.getDate("notice_created_date"));
            notice.setUpdatedDate(rs.getDate("notice_updated_date"));

            return notice;
        }, No);
    }

}
