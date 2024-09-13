package product;

import com.jhta.afterpay.util.DaoHelper;

public class ProductDao {
    /**
     * 상품 번호로 해당 상품의 모든 정보를 반환한다.
     * @param productNo 상품 번호
     * @return 해당 상품의 모든 정보
     */
    public Product getProductByNo(int productNo) {
        String sql = """
            select *
            from products
            where product_no = ?    
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
            product.setCategory(category);

            return product;
        }, productNo);
    }
}
