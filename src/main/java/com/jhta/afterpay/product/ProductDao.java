package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    public Product getProductByNo(int productNo) {
        String sql = """
                select p.product_no
                    ,p.product_name
                    ,p.product_price
                    ,p.product_status
                    ,p.product_created_date
                    ,p.product_content
                    ,p.product_total_rating
                    ,p.product_view_cnt
                    ,pc.cat_no
                    ,pc.cat_name
                from products p
                join product_categories pc
                on p.cat_no = pc.cat_no
                where p.product_no = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {

        })
    }
    /**
     * 상품 번호로 상품의 모든 정보를 반환한다.
     * @param productNo 상품 번호
     * @return 해당 상품의 모든 정보
     */
    public Product getProductByNo(int productNo) {
        String sql = """
            select *
            from products p, product_categories c
            where p.product_no = ?
            and p.cat_no = c.cat_no
        """;

        return DaoHelper.selectOne(sql, rs -> {
            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            product.setName(rs.getString("product_name"));
            product.setPrice(rs.getInt("product_price"));
            product.setContent(rs.getString("product_content"));
            product.setViewCount(rs.getInt("product_view_cnt"));
            product.setCreatedDate(rs.getDate("product_created_date"));
            product.setStatus(rs.getString("product_status"));
            product.setTotalRating(rs.getInt("product_total_rating"));

            Category category = new Category();
            category.setNo(rs.getInt("cat_no"));
            category.setName(rs.getString("cat_name"));
            category.setParentNo(rs.getInt("parent_cat_no"));
            product.setCategory(category);

            return product;
        }, productNo);
    }

    /**
     * 상품 번호로 상품의 재고 상황을 반환한다.
     * @param productNo 상품 번호
     * @return 해당 상품의 재고번호, 재고사이즈, 재고량
     */
    public List<Stock> getAllStocksByNo(int productNo) {
        String sql = """
            select s.product_stock_no
                    , s.product_stock_size
                    , s.product_stock_amount
                    , s.product_no
            from products p, product_stocks s
            where p.product_no = ?
            and p.product_no = s.product_no
            order by s.product_stock_size desc
        """;

        return DaoHelper.selectList(sql, rs -> {
            Stock stock = new Stock();
            stock.setNo(rs.getInt("product_stock_no"));
            stock.setSize(rs.getString("product_stock_size"));
            stock.setAmount(rs.getInt("product_stock_amount"));
            stock.setProductNo(rs.getInt("product_no"));
            return stock;
        }, productNo);
    }

    /**
     * 상품 번호로 상품의 모든 리뷰를 반환한다.
     * @param productNo 상품 번호
     * @return 해당 상품의 모든 리뷰 정보
     */
    public List<Review> getAllReviewsByNo(int productNo) {
        String sql = """
             select r.review_title
                     , r.review_content
                     , r.review_rating
                     , r.review_created_date
                     , u.user_name
             from products p, reviews r, users u
             where p.product_no = ?
             and p.product_no = r.product_no
             and r.user_no = u.user_no
        """;

        return DaoHelper.selectList(sql, rs -> {
            Review review = new Review();
            review.setTitle(rs.getString("review_title"));
            review.setContent(rs.getString("review_content"));
            review.setRating(rs.getInt("review_rating"));
            review.setCreatedDate(rs.getDate("review_created_date"));

            User user = new User();
            user.setName(rs.getString("user_name"));
            review.setUser(user);

            return review;
        }, productNo);
    }

    /**
     * 상품 번호로 상품의 모든 이미지를 반환한다.
     * @param productNo 상품 번호
     * @return 해당 상품의 모든 이미지
     */
    public List<Image> getAllImagesByNo(int productNo) {
        String sql = """
            select *
            from product_imgs
            where product_no = ?    
        """;

        return DaoHelper.selectList(sql, rs -> {
            Image image = new Image();
            image.setNo(rs.getInt("img_no"));
            image.setName(rs.getString("img_name"));
            image.setThumb(rs.getString("isthumb"));

            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            image.setProduct(product);

            return image;
        }, productNo);
    }

    public int getTotalRows(int catNo) {
        String sql = """
                SELECT COUNT(*)
                FROM PRODUCTS
                WHERE CAT_NO IN (SELECT CAT_NO
                                 FROM PRODUCT_CATEGORIES
                                 WHERE PARENT_CAT_NO = ?)
                """;
        return DaoHelper.selectOneInt(sql, catNo);
    }

    public List<Product> getProducts(int catNo, int begin, int end) {
        String sql = """
            SELECT *
            FROM (
                  SELECT ROW_NUMBER() OVER (ORDER BY PRODUCT_NO asc) RN
                    , CA.CAT_NO
                    , CA.CAT_NAME
                    , P.PRODUCT_NO
                    , P.PRODUCT_NAME
                    , P.PRODUCT_PRICE
                    , P.PRODUCT_STATUS
                  FROM PRODUCTS P, PRODUCT_CATEGORIES CA
                  where P.CAT_NO = CA.CAT_NO
                  and P.CAT_NO IN (SELECT CAT_NO
                                   FROM PRODUCT_CATEGORIES
                                   WHERE PARENT_CAT_NO = ?)
            )
            WHERE RN BETWEEN ? AND ?
            """;

        return DaoHelper.selectList(sql, rs -> {
            Product product = new Product();
            product.setNo(rs.getInt("PRODUCT_NO"));
            product.setName(rs.getString("PRODUCT_NAME"));
            product.setPrice(rs.getInt("PRODUCT_PRICE"));
            product.setStatus(rs.getString("PRODUCT_STATUS"));
            product.setCreatedDate(rs.getDate("PRODUCT_CREATED_DATE"));
            product.setContent(rs.getString("PRODUCT_CONTENT"));
            product.setTotalRating(rs.getInt("PRODUCT_TOTAL_RATING"));
            product.setViewCount(rs.getInt("PRODUCT_VIEW_CNT"));


            Category category = new Category();
            category.setNo(rs.getInt("CAT_NO"));
            category.setName(rs.getString("CAT_NAME"));
            product.setCategory(category);

            return product;
        }, productNo);
    }

    /**
     * 상품 번호 조회
     * @return 상품 번호
     */
    public int getSequence() {
        String sql = """
                SELECT PRODUCT_NO_SEQ.nextval FROM dual
                """;

        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 재고 등록
     * @param stock
     */
    public void insertProductStock(Stock stock) {
        String sql = """
                INSERT INTO PRODUCT_STOCKS
                (
                    PRODUCT_STOCK_NO
                    ,PRODUCT_STOCK_SIZE
                    ,PRODUCT_STOCK_AMOUNT
                    ,PRODUCT_NO
                )
                values
                (PRODUCT_STOCK_NO_seq.nextval,?,?,?)
                """;
        DaoHelper.insert(sql,stock.getSize(), stock.getAmount(), stock.getProductNo());
    }


    /**
     * 상품등록
     * @param product
     */
    public void insertProduct(Product product) {
        String sql = """
                INSERT INTO PRODUCTS
                (
                PRODUCT_NO
                ,PRODUCT_NAME
                ,PRODUCT_PRICE
                ,PRODUCT_CONTENT
                ,PRODUCT_STATUS
                ,CAT_NO
                )
                values
                (?,?,?,?,?,?)
                """;

        DaoHelper.insert(sql, product.getNo(), product.getName(), product.getPrice(), product.getContent(), product.getStatus(), product.getCategory().getNo());
    }

    /**
     * 전체 상품 조회
     * @param begin 첫번재 페이지
     * @param end   마지막 페이지
     * @return
     */
    public List<Product> getAllProducts(int begin, int end) {
        String sql = """
                SELECT *
                FROM(
                    SELECT ROW_NUMBER() OVER (ORDER BY PRODUCT_NO DESC) ROWNUMBER
                        , P.PRODUCT_NO
                        , P.PRODUCT_NAME
                        , P.PRODUCT_CREATED_DATE
                        , P.PRODUCT_STATUS
                        , PC.CAT_NAME
                        FROM PRODUCTS P, PRODUCT_CATEGORIES PC
                        WHERE P.CAT_NO = PC.CAT_NO
                    )
                    WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
           Product product = new Product();
            product.setNo(rs.getInt("PRODUCT_NO"));
            product.setName(rs.getString("PRODUCT_NAME"));
            product.setCreatedDate(rs.getDate("PRODUCT_CREATED_DATE"));
            product.setStatus(rs.getString("PRODUCT_STATUS"));

            Category category = new Category();
            category.setName(rs.getString("CAT_NAME"));
            product.setCategory(category);
           return product;
        }, begin, end);
    }

    /**
     * 전체 상품갯수를 조회해서 반환한다.
     * @return 상품 갯수
     */
    public int getTotalRows() {
        String sql = """
                select count(*)
                from products
                """;

        return DaoHelper.selectOneInt(sql);
    }

    /**
     * 상품 전체를 조회를 한다.
     * @return 상품전체
     */
    public List<Product> searchAllProducts() {
        String sql = """
            select p.product_no
                , pc.cat_name
                , p.product_name
                , p.product_created_date
                , p.product_status
            from products p, product_categories pc
            where p.cat_no = pc.cat_no
            """;


        }, catNo, begin, end);
    }

    public int getTotalRowsByCatNo(int catNo) {
        String sql = """
                SELECT COUNT(*)
                FROM PRODUCTS
                WHERE CAT_NO = ?
                """;
        return DaoHelper.selectOneInt(sql, catNo);
    }

    public List<Product> getProductsByCatNo(int catNo, int begin, int end) {
        String sql = """
            SELECT *
            FROM (
                  SELECT ROW_NUMBER() OVER (ORDER BY PRODUCT_NO DESC) RN
                    , CA.CAT_NO
                    , CA.CAT_NAME
                    , P.PRODUCT_NO
                    , P.PRODUCT_NAME
                    , P.PRODUCT_PRICE
                    , P.PRODUCT_STATUS
                  FROM PRODUCTS P, PRODUCT_CATEGORIES CA
                  where P.CAT_NO = CA.CAT_NO
                  AND P.CAT_NO = ?
            )
            WHERE RN BETWEEN ? AND ?
            """;

        return DaoHelper.selectList(sql, rs -> {
            Product product = new Product();
            product.setNo(rs.getInt("PRODUCT_NO"));
            product.setName(rs.getString("PRODUCT_NAME"));
            product.setCreatedDate(rs.getDate("PRODUCT_CREATED_DATE"));
            product.setStatus(rs.getString("PRODUCT_STATUS"));
            product.setPrice(rs.getInt("PRODUCT_PRICE"));
            product.setStatus(rs.getString("PRODUCT_STATUS"));

            Category category = new Category();
            category.setNo(rs.getInt("CAT_NO"));
            category.setName(rs.getString("CAT_NAME"));
            product.setCategory(category);

            return product;
        }, catNo, begin, end);
    }


//    public Product getProductImage(int productNo) {
//        String sql = """
//                SELECT P.PRODUCT_NO
//                    , IMG.IMG_NO
//                    , IMG.IMG_NAME
//                    , IMG.ISTHUMB
//                FROM PRODUCTS P, PRODUCT_IMGS IMG
//                WHERE P.PRODUCT_NO = IMG.PRODUCT_NO
//                AND IMG.ISTHUMB = 'Y'
//                AND P.PRODUCT_NO = ?
//                """;
//
//        return DaoHelper.selectOne(sql, rs -> {
//            Product product = new Product();
//            product.setNo(rs.getInt("PRODUCT_NO"));
//
//            Image image = new Image();
//            image.setNo(rs.getInt("IMG_NO"));
//            image.setName(rs.getString("IMG_NAME"));
//            image.setThumb(rs.getString("ISTHUMB"));
//
//            product.setImage(image);
//            return product;
//
//        }, productNo);
//    }

}
