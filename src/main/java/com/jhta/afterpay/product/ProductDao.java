package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

public class ProductDao {

    public List<Product> getProducts(int begin, int end) {
        String sql = """
                SELECT *
                FROM(
                    SELECT ROW_NUMBER() OVER (ORDER BY PRODUCT_NO DESC) ROWNUMBER
                        , P.PRODUCT_NO
                        , P.PRODUCT_NAME
                        , P.PRODUCT_CREATED_DATE
                        , P.PRODUCT_STATUS
                        , PC.CAT_NAME
                        FROM PRODUCT P, PRODUCT_CATEGORIES PC
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

        return DaoHelper.selectOneInt(sql, 1);



    }

    /**
     * 상품 전체를 조회를 한다.
     * @return 상품전체
     */
    public List<Product> getAllProducts() {
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
