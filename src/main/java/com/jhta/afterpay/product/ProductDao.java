package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.sql.SQLException;
import java.util.List;

public class ProductDao {

//    public int getAllTotalRows() {
//        String sql = """
//                SELECT COUNT(*)
//                FROM PRODUCTS
//                """;
//        int totalRows = 0;
//
//        return DaoHelper.selectList (sql, rs -> {
//
//            return totalRows;
//        });
//    }

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
//    public List<Product> getAllProducts (int Begin, int End) {
//        String sql = """
//                SELECT *
//                FROM PRODUCTS
//                """;
//
//
//        return DaoHelper.selectList(sql, rs -> {
//            Product product = new Product();
//            product.setName(rs.getString("P.PRODUCT_NAME"));
//            product.setPrice(rs.getInt("P.PRODUCT_PRICE"));
//            product.setStatus(rs.getString("P.PRODUCT_STATUS"));
//
//            Category category = new Category();
//            category.setNo(rs.getInt("CA.CAT_NO"));
//            product.setCategory(category);
//
//            return product;
//        }, catNo);
//    }

//        public List<Product> getAllProductsByParentCatNo (int catNo, int Begin, int End) {
//            String sql = """
//                    SELECT *
//                    FROM PRODUCT_NO
//                    WHERE PARENT_NO = ?
//                    """;
//
//
//            return DaoHelper.selectList(sql, rs -> {
//                Product product = new Product();
//                product.setName(rs.getString("P.PRODUCT_NAME"));
//                product.setPrice(rs.getInt("P.PRODUCT_PRICE"));
//                product.setStatus(rs.getString("P.PRODUCT_STATUS"));
//
//                Category category = new Category();
//                category.setNo(rs.getInt("CA.CAT_NO"));
//                product.setCategory(category);
//
//                return product;
//            }, catNo);
//        }
//        public List<Product> getAllProductsByCatNo(int catNo, int Begin, int End) {
//            String sql = """
//                    SELECT *
//                    FROM PRODUCT_NO
//                    WHERE CAT_NO = ?
//                    """;
//
//            return DaoHelper.selectList(sql, rs -> {
//                Product product = new Product();
//                product.setName(rs.getString("P.PRODUCT_NAME"));
//                product.setPrice(rs.getInt("P.PRODUCT_PRICE"));
//                product.setStatus(rs.getString("P.PRODUCT_STATUS"));
//
//                Category category = new Category();
//                category.setNo(rs.getInt("CA.CAT_NO"));
//                product.setCategory(category);
//
//                return product;
//            }, catNo);
//        }
//

}

