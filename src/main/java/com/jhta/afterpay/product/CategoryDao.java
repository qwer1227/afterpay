package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class CategoryDao {

    public List<Category> getAllCategories() {
        String sql = """
                select cat_no
                    ,cat_name
                    ,parent_cat_no
                from product_categories
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
