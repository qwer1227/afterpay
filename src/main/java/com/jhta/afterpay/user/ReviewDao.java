package com.jhta.afterpay.user;

import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class ReviewDao {

    /**
     * 사용자번호로 작성한 리뷰 중 삭제하지 않은 리뷰의 총 갯수 조회
     *
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
     *
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

    public int getNotDeletedTotalRows() {
        String sql = """
                SELECT COUNT(*)
                FROM REVIEWS
                WHERE ISDELETED = 'N'
                """;

        Review review = new Review();
        return DaoHelper.selectOneInt(sql);
    }

    public List<Review> getNotDeletedReview(int userNo, int begin, int end) {
        String sql = """
                SELECT *
                FROM(
                    SELECT ROW_NUMBER() OVER (ORDER BY REVIEW_NO DESC) ROWNUMBER
                        , REVIEW_NO
                        , REVIEW_CONTENT
                        , REVIEW_CREATED_DATE
                        , REVIEW_TITLE
                        , ISDELETED
                        , USER_NO
                        , REVIEW_RATING
                        , PRODUCT_NO
                    FROM REVIEWS
                    WHERE ISDELETED = 'N'
                        AND USER_NO = ?
                )
                WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Review review = new Review();
            review.setNo(rs.getInt("review_no"));
            review.setTitle(rs.getString("review_title"));
            review.setContent(rs.getString("review_content"));
            review.setCreatedDate(rs.getDate("review_created_date"));
            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            review.setProduct(product);
            review.setIsDeleted(rs.getString("isdeleted"));
            review.setRating(rs.getInt("review_rating"));
            User user = new User();
            user.setNo(rs.getInt("user_no"));
            review.setUser(user);
            return review;
        }, userNo, begin, end);
    }

    public void updateReview(Review review) {
        String sql = """
                UPDATE REVIEWS
                SET ISDELETED = ?
                WHERE REVIEW_NO = ?
                """;
        DaoHelper.update(sql
                , review.getIsDeleted()
                , review.getNo());
    }

    /**
     * 리뷰번호로 해당 리뷰 조회
     *
     * @param reviewNo
     * @return
     */
    public Review getReviewByReviewNo(int reviewNo) {
        String sql = """
                SELECT REVIEW_NO
                    , REVIEW_TITLE
                    , REVIEW_CONTENT
                    , REVIEW_CREATED_DATE
                    , ISDELETED
                    , USER_NO
                    , PRODUCT_NO
                    , REVIEW_RATING
                    , PRODUCT_NO
                FROM REVIEWS
                WHERE REVIEW_NO = ?
                    AND PRODUCT_NO = ?
                """;
        return DaoHelper.selectOne(sql, rs -> {
            Review review = new Review();
            review.setNo(rs.getInt("review_no"));
            review.setTitle(rs.getString("review_title"));
            review.setContent(rs.getString("review_content"));
            review.setCreatedDate(rs.getDate("review_created_date"));
            review.setIsDeleted(rs.getString("isdeleted"));
            review.setRating(rs.getInt("review_rating"));

            User user = new User();
            user.setNo(rs.getInt("user_no"));
            review.setUser(user);

            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            review.setProduct(product);

            return review;
        }, reviewNo);
    }

    public Review getReviewByProductNo(int productNo) {
        String sql = """
                SELECT REVIEW_NO
                    , REVIEW_TITLE
                    , REVIEW_CONTENT
                    , REVIEW_CREATED_DATE
                    , ISDELETED
                    , USER_NO
                    , PRODUCT_NO
                    , REVIEW_RATING
                    , PRODUCT_NO
                FROM REVIEWS
                WHERE PRODUCT_NO = ?
                """;
        return DaoHelper.selectOne(sql, rs -> {
            Review review = new Review();
            review.setNo(rs.getInt("review_no"));
            review.setTitle(rs.getString("review_title"));
            review.setContent(rs.getString("review_content"));
            review.setCreatedDate(rs.getDate("review_created_date"));
            review.setIsDeleted(rs.getString("isdeleted"));
            review.setRating(rs.getInt("review_rating"));

            User user = new User();
            user.setNo(rs.getInt("user_no"));
            review.setUser(user);

            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            review.setProduct(product);

            return review;
        }, productNo);
    }

    public void deleteReview(int reviewNo) {
        String sql = """
                UPDATE REVIEWS
                SET ISDELETED = 'Y'
                WHERE REVIEW_NO = ?
                """;
        DaoHelper.update(sql, reviewNo);
    }
}
