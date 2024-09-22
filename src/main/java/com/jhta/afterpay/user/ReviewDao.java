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
                    , REVIEW_RATING
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
            review.setRating(rs.getInt("REVIEW_RATING"));

            return review;
        }, userNo);
    }

    public int getAllTotalRowsByUserNo(int userNo) {
        String sql = """
                SELECT COUNT(*)
                FROM REVIEWS
                WHERE USER_NO = ?
                """;

        return DaoHelper.selectOneInt(sql, userNo);
    }

    public List<Review> getAllReviewByUserNo(int begin, int end) {
        String sql = """
                SELECT ROW_NUMBER() OVER (ORDER BY REVIEW_NO DESC) ROWNUMBER
                        , REVIEW_NO
                        , REVIEW_CONTENT
                        , REVIEW_CREATED_DATE
                        , REVIEW_TITLE
                        , ISDELETED
                        , REVIEW_RATING
                        , PRODUCT_NO
                FROM REVIEWS
                WHERE ROWNUMBER BETWEEN ? AND ?
                    AND USER_NO = ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Review review = new Review();
            review.setNo(rs.getInt("review_no"));
            review.setTitle(rs.getString("review_title"));
            review.setContent(rs.getString("review_content"));
            review.setCreatedDate(rs.getDate("review_created_date"));
            review.setProductNo(rs.getInt("product_no"));
            review.setIsDeleted(rs.getString("isdeleted"));
            review.setRating(rs.getInt("review_rating"));
            return review;
        }, begin, end);
    }

    public void deleteReviewByReviewNo(int reviewNo) {
        String sql = """
                UPDATE REVIEWS
                SET ISDELETED = 'Y'
                WHERE REVIEW_NO = ?
                """;
        DaoHelper.update(sql, reviewNo);
    }
}
