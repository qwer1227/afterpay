package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {


    /**
     * 카테고리 번호를 조회해서 카테고리 번호에 맞는 전체상품을 조회한다.
     * @param catNo
     * @return
     * @throws SQLException
     */
    public List<Product> getAllProducts (int catNo) {
        String sql = """
                SELECT CA.CAT_NO
                    , P.PRODUCT_NAME
                    , P.PRODUCT_PRICE
                    , P.PRODUCT_STATUS
                FROM PRODUCTS P, PRODUCT_CATEGORIES CA
                where P.CAT_NO = CA.CAT_NO
                AND P.CAT_NO = ?
                """;


        return DaoHelper.selectList(sql, rs -> {
            Product product = new Product();
            product.setName(rs.getString("PRODUCT_NAME"));
            product.setPrice(rs.getInt("PRODUCT_PRICE"));
            product.setStatus(rs.getString("PRODUCT_STATUS"));

            Category category = new Category();
            category.setNo(rs.getInt("CAT_NO"));
            product.setCategory(category);

            return product;
        }, catNo);
    }
    public List<Product> getTotalRows(int catNo, int Begin, int End) {
        String sql = """
                SELECT COUNT(*)
                FROM (
                      SELECT ROW_NUMBER() OVER (ORDER BY PRODUCT_NO DESC) ROWNUMBER
                          CA.CAT_NO
                        , P.PRODUCT_NAME
                        , P.PRODUCT_PRICE
                        , P.PRODUCT_STATUS
                      FROM PRODUCTS P, PRODUCT_CATEGORIES CA
                      where P.CAT_NO = CA.CAT_NO
                      AND P.CAT_NO = ?
                )
                WHERE ROWNUMBER BETWEEN ? AND ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Product product = new Product();
            product.setName(rs.getString("PRODUCT_NAME"));
            product.setPrice(rs.getInt("PRODUCT_PRICE"));
            product.setStatus(rs.getString("PRODUCT_STATUS"));

            Category category = new Category();
            category.setNo(rs.getInt("CAT_NO"));
            product.setCategory(category);

            return product;
        }, catNo, Begin, End);

    }

}

