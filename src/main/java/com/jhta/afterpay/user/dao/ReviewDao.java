package com.jhta.afterpay.user.dao;

import com.jhta.afterpay.user.vo.Product;
import com.jhta.afterpay.user.vo.Review;
import com.jhta.afterpay.user.vo.User;
import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.List;

public class ReviewDao {

    /**
     * 사용자번호로 작성한 리뷰 중 삭제하지 않은 리뷰의 총 갯수 조회
     * @param userNo
     * @return
     * @throws SQLException
     */
    public Review getReviewCntByNo(int userNo) throws SQLException {
        String sql = """
                select count(user_no)
                from reviews
                where user_no = ?
                    and isdeleted = 'N'
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Review review = new Review();
            User user = new User();
            user.setNo(rs.getInt("user_no"));
            review.setUserNo(user);
            return review;
        }, userNo);
    }
}
