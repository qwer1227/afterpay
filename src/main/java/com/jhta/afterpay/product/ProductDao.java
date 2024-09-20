package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

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
        });
    }
}
