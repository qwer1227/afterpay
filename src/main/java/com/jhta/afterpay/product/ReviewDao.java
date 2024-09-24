package com.jhta.afterpay.product;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class ReviewDao {
    /**
     * 상품 번호로 상품의 모든 리뷰를 반환한다.
     * @param productNo 상품 번호
     * @return 해당 상품의 모든 리뷰 정보
     */
    public List<Review> getAllReviewsByNo(int productNo) {
        String sql = """
             select r.review_no
                     , r.review_title
                     , r.review_content
                     , r.review_rating
                     , r.review_created_date
                     , u.user_no
                     , u.user_name
             from products p, reviews r, users u
             where p.product_no = ?
             and p.product_no = r.product_no
             and r.user_no = u.user_no
        """;

        return DaoHelper.selectList(sql, rs -> {
            Review review = new Review();
            review.setNo(rs.getInt("review_no"));
            review.setTitle(rs.getString("review_title"));
            review.setContent(rs.getString("review_content"));
            review.setRating(rs.getInt("review_rating"));
            review.setCreatedDate(rs.getDate("review_created_date"));

            User user = new User();
            user.setNo(rs.getInt("user_no"));
            user.setName(rs.getString("user_name"));
            review.setUser(user);

            return review;
        }, productNo);
    }

    /**
     * 리뷰 테이블에 상품에 대한 리뷰를 저장한다.
     * @param review 상품에 대한 리뷰 정보
     */
    public void insertReview(Review review) {
        String sql = """
             insert into reviews
             (review_no, review_content, review_rating, user_no, product_no, review_title)
             values
             (review_no_seq.nextval, ?, ?, ?, ?, ?)
        """;

        DaoHelper.insert(sql, review.getContent(), review.getRating(), review.getUser().getNo(), review.getProduct().getNo(), review.getTitle());
    }
}
