package com.jhta.afterpay.product;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class WishDao {

    public List<Wish> getAllWishesByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM WISHES
                WHERE USER_NO = ?
                """;
        return DaoHelper.selectList(sql, rs -> {
            Wish wish = new Wish();
            wish.setNo(rs.getInt("WISH_NO"));

            User user = new User();
            user.setNo(rs.getInt("USER_NO"));
            wish.setUser(user);

            Product product = new Product();
            product.setNo(rs.getInt("PRODUCT_NO"));
            wish.setProduct(product);

            return wish;
        }, userNo);
    }

    /**
     * 위시리스트에 상품을 저장한다.
     * @param wish 위시리스트에 추가된 상품의 정보
     */
    public void insertWish(Wish wish) {
        String sql = """
            insert into wishes
            (wish_no, product_no, user_no, product_stock_no)
            values
            (wish_no_seq.nextval, ?, ?, ?)    
        """;

        DaoHelper.insert(sql, wish.getProduct().getNo(), wish.getUser().getNo(), wish.getStock().getNo());
    }

    /**
     * 위시리스트 상품을 삭제한다.
     * @param wishNo 위시리스트 번호
     */
    public void deleteWishByNo(int wishNo, int userNo) {
        String sql = """
           delete from wishes
           where PRODUCT_STOCK_NO = ?
           and user_no = ?     
        """;

        DaoHelper.delete(sql, wishNo, userNo);
    }

    /**
     * 위시리스트 상품을 반환한다.
     * @param stockNo 재고 번호
     * @param userNo 유저 번호
     * @return 위시리스트 상품 1개
     */
    public Wish getWishByNo(int stockNo, int userNo) {
        String sql = """
            select wish_no
                    , product_no
                    , user_no    
            from wishes
            where product_stock_no = ? and user_no = ?
        """;

        return DaoHelper.selectOne(sql, rs -> {
            Wish wish = new Wish();
            wish.setNo(rs.getInt("wish_no"));
            wish.setProductNo(rs.getInt("product_no"));
            wish.setUserNo(rs.getInt("user_no"));

            return wish;
        }, stockNo, userNo);
    }

    /**
     * 사용자의 위시리스트 상품 목록을 반환한다.
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

    public List<Wish> getWishByUserNo(int userNo) {
        String sql = """
                SELECT P.PRODUCT_NO
                    , P.PRODUCT_NAME
                    , P.PRODUCT_PRICE
                    , S.PRODUCT_STOCK_NO
                    , S.PRODUCT_STOCK_SIZE
                    , S.PRODUCT_STOCK_AMOUNT
                    , W.WISH_NO
                    , W.USER_NO
                FROM WISHES W JOIN PRODUCTS P
                    ON W.PRODUCT_NO = P.PRODUCT_NO
                        JOIN PRODUCT_STOCKS S
                    ON P.PRODUCT_NO = S.PRODUCT_NO
                WHERE USER_NO = ?
                """;
        return DaoHelper.selectList(sql, rs -> {
            Wish wish = new Wish();
            wish.setNo(rs.getInt("wish_no"));

            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            product.setName(rs.getString("product_name"));
            product.setPrice(rs.getInt("product_price"));
            wish.setProduct(product);

            Stock stock = new Stock();
            stock.setNo(rs.getInt("product_stock_no"));
            stock.setSize(rs.getString("product_stock_size"));
            stock.setAmount(rs.getInt("product_stock_amount"));
            wish.setStock(stock);

            User user = new User();
            user.setNo(rs.getInt("user_no"));
            wish.setUser(user);

            return wish;
        }, userNo);
    }

    public int getAllTotalRowsByUserNo(int userNo){
        String sql = """
                SELECT COUNT(*)
                FROM WISHES
                WHERE USER_NO = ?
                """;

        return DaoHelper.selectOneInt(sql, userNo);
    }

    /**
     * 페이지처리가 되는 위시리스트 전체 조회 기능
     * @param begin
     * @param end
     * @return
     */
    public List<Wish> getAllWishListByUserNo(int userNo, int begin, int end){
        String sql = """
                SELECT *
                FROM(
                    SELECT ROW_NUMBER() OVER (ORDER BY WISH_NO DESC) ROWNUMBER
                        , W.WISH_NO
                        , W.USER_NO
                        , P.PRODUCT_NO
                        , P.PRODUCT_NAME
                        , P.PRODUCT_PRICE
                        , S.PRODUCT_STOCK_NO
                        , S.PRODUCT_STOCK_SIZE
                        , S.PRODUCT_STOCK_AMOUNT
                    FROM WISHES W JOIN PRODUCTS P
                        ON W.PRODUCT_NO = P.PRODUCT_NO
                            JOIN PRODUCT_STOCKS S
                        ON W.PRODUCT_STOCK_NO = S.PRODUCT_STOCK_NO
                    WHERE USER_NO = ?
                )
                WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Wish wish = new Wish();
            wish.setNo(rs.getInt("WISH_NO"));

            User user = new User();
            user.setNo(rs.getInt("USER_NO"));
            wish.setUser(user);

            Product product = new Product();
            product.setNo(rs.getInt("PRODUCT_NO"));
            product.setName(rs.getString("PRODUCT_NAME"));
            product.setPrice(rs.getInt("PRODUCT_PRICE"));
            wish.setProduct(product);

            Stock stock = new Stock();
            stock.setNo(rs.getInt("PRODUCT_STOCK_NO"));
            stock.setSize(rs.getString("PRODUCT_STOCK_SIZE"));
            stock.setAmount(rs.getInt("PRODUCT_STOCK_AMOUNT"));
            wish.setStock(stock);

            return wish;
        }, userNo, begin, end);
    }
}
