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

            Category category = new Category();
            category.setNo(rs.getInt("CAT_NO"));
            category.setName(rs.getString("CAT_NAME"));
            product.setCategory(category);

            return product;
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

