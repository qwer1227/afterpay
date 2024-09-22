package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class CategoryDao {

    public List<Category> getAllCategories() {
        String sql = """
                SELECT CAT_NO
                    ,CAT_NAME
                    ,PARENT_CAT_NO
                FROM PRODUCT_CATEGORIES
                """;

        return DaoHelper.selectList(sql, rs ->{
                Category category = new Category();
                category.setNo(rs.getInt("CAT_NO"));
                category.setName(rs.getString("CAT_NAME"));
                category.setParentNo(rs.getInt("PARENT_CAT_NO"));

                return category;
        });
    }
}
