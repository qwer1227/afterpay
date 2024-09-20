package com.jhta.afterpay.user;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class ReviewDao {

    /**
     * 사용자번호로 작성한 리뷰 중 삭제하지 않은 리뷰의 총 갯수 조회
     * @param userNo 사용자번호
     * @return 리뷰 갯수
     */
    public int getReviewCntByUserNo(int userNo) {
        String sql = """
                SELECT COUNT(USER_NO) cnt
                FROM REVIEWS
                WHERE USER_NO = ?
                    AND ISDELETED = 'N'
                """;

        return DaoHelper.selectOneInt(sql, userNo);
    }

    /**
     * 사용자가 삭제하지 않은 리뷰들 목록 조회
     * @param userNo
     * @return
     */
    public List<Review> getReviewsByUserNo(int userNo) {
        String sql = """
                SELECT REVIEW_TITLE
                    , REVIEW_CONTENT
                    , REVIEW_CREATED_DATE
                FROM REVIEWS
                WHERE USER_NO = ?
                    AND ISDELETED = 'N'
                ORDER BY REVIEW_CREATED_DATE DESC
                """;

        return DaoHelper.selectList(sql, rs -> {
            Review review = new Review();

            review.setTitle(rs.getString("REVIEW_TITLE"));
            review.setContent(rs.getString("REVIEW_CONTENT"));
            review.setCreatedDate(rs.getDate("REVIEW_CREATED_DATE"));

            return review;
        }, userNo);
    }
}
