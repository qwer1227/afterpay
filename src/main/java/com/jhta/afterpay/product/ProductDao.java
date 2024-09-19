package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {


    public int getTotalRows(int catNo) {
        String sql = """
                SELECT COUNT(*)
                FROM PRODUCTS
                where cat_no in (select cat_no
                                 from product_categories
                                 where parent_cat_no = ?)
                """;
        return DaoHelper.selectOneInt(sql, catNo);
    }

    public List<Product> getProducts(int catNo, int begin, int end) {
        String sql = """
            SELECT *
            FROM (
                  SELECT ROW_NUMBER() OVER (ORDER BY PRODUCT_NO asc) rn
                    , CA.CAT_NO
                    , CA.CAT_NAME
                    , P.PRODUCT_NO
                    , P.PRODUCT_NAME
                    , P.PRODUCT_PRICE
                    , P.PRODUCT_STATUS
                  FROM PRODUCTS P, PRODUCT_CATEGORIES CA
                  where P.CAT_NO = CA.CAT_NO
                  and P.CAT_no  in (select cat_no
                                    from product_categories
                                    where parent_cat_no = ?)
            )
            WHERE rn BETWEEN ? AND ?
            """;

        return DaoHelper.selectList(sql, rs -> {
            Product product = new Product();
            product.setNo(rs.getInt("PRODUCT_NO"));
            product.setName(rs.getString("PRODUCT_NAME"));
            product.setPrice(rs.getInt("PRODUCT_PRICE"));
            product.setStatus(rs.getString("PRODUCT_STATUS"));

            Category category = new Category();
            category.setNo(rs.getInt("CAT_NO"));
            category.setName(rs.getString("CAT_NAME"));
            product.setCategory(category);

            return product;
        }, catNo, begin, end);
    }

    public int getTotalRowsByCatNo(int catNo) {
        String sql = """
                select count(*)
                from products
                where cat_no = ?
                """;
        return DaoHelper.selectOneInt(sql, catNo);
    }

    public List<Product> getProductsByCatNo(int catNo, int begin, int end) {
        String sql = """
            SELECT *
            FROM (
                  SELECT ROW_NUMBER() OVER (ORDER BY PRODUCT_NO DESC) rn
                    , CA.CAT_NO
                    , CA.CAT_NAME
                    , P.PRODUCT_NO
                    , P.PRODUCT_NAME
                    , P.PRODUCT_PRICE
                    , P.PRODUCT_STATUS
                  FROM PRODUCTS P, PRODUCT_CATEGORIES CA
                  where P.CAT_NO = CA.CAT_NO
                  and P.CAT_NO = ?
            )
            WHERE rn BETWEEN ? AND ?
            """;

        return DaoHelper.selectList(sql, rs -> {
            Product product = new Product();
            product.setNo(rs.getInt("PRODUCT_NO"));
            product.setName(rs.getString("PRODUCT_NAME"));
            product.setPrice(rs.getInt("PRODUCT_PRICE"));
            product.setStatus(rs.getString("PRODUCT_STATUS"));

            Category category = new Category();
            category.setNo(rs.getInt("CAT_NO"));
            category.setName(rs.getString("CAT_NAME"));
            product.setCategory(category);

            return product;
        }, catNo, begin, end);
    }


}

