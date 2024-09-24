package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class WishDao {
    /**
     * 위시리스트에 상품을 저장한다.
     * @param wish 위시리스트에 추가될 상품의 정보
     */
    public void insertWish(Wish wish) {
        String sql = """
            insert into wishes
            (wish_no, product_no, user_no)
            values
            (wish_no_seq.nextval, ?, ?)    
        """;

        DaoHelper.insert(sql, wish.getProduct().getNo(), wish.getUser().getNo());
    }

    /**
     * 위시리스트 상품을 삭제한다.
     * @param wishNo 위시리스트 번호
     */
    public void deleteWishByNo(int wishNo) {
        String sql = """
           delete from wishes
           where wish_no = ?     
        """;

        DaoHelper.delete(sql, wishNo);
    }

    /**
     * 위시리스트 상품을 반환한다.
     * @param productNo 상품 번호
     * @param userNo 유저 번호
     * @return 위시리스트 상품 1개
     */
    public Wish getWishByNo(int productNo, int userNo) {
        String sql = """
            select wish_no
                    , product_no
                    , user_no    
            from wishes
            where product_no = ? and user_no = ?
        """;

        return DaoHelper.selectOne(sql, rs -> {
            Wish wish = new Wish();
            wish.setNo(rs.getInt("wish_no"));
            wish.setProductNo(rs.getInt("product_no"));
            wish.setUserNo(rs.getInt("user_no"));

            return wish;
        }, productNo, userNo);
    }

    /**
     * 사용자 번호로 위시리스트 상품 목록을 반환한다.
     * @param userNo 사용자 번호
     * @return 사용자의 위시리스트 상품 목록
     */
    public List<Wish> getWishesByUserNo(int userNo) {
        String sql = """
            select w.wish_no
                    , p.product_no
                    , p.product_name
                    , p.product_price
            from wishes w, products p
            where user_no = ?
            and w.product_no = p.product_no    
        """;

        return DaoHelper.selectList(sql, rs -> {
            Wish wish = new Wish();
            wish.setNo(rs.getInt("wish_no"));

            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            product.setName(rs.getString("product_name"));
            product.setPrice(rs.getInt("product_price"));
            wish.setProduct(product);

            return wish;
        }, userNo);
    }
}
