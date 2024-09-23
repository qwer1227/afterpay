package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class StockDao {

    /**
     * 상품 재고 수량을 수정한다.
     * @param stock 해당 상품 재고
     */
    public void updateStockAmount(Stock stock) {
        String sql = """
                UPDATE PRODUCT_STOCKS
                SET
                	PRODUCT_STOCK_AMOUNT = ?
                WHERE
                	PRODUCT_STOCK_NO = ?
                """;
        
        DaoHelper.update(sql, stock.getAmount(), stock.getNo());
    }

    /**
     * 재고번호를 통해 재고수량을 반환한다.
     * @param stockNo 재고번호
     * @return 해당 재고수량
     */
    public Stock getStockAmountByStockNo(int stockNo) {
        String sql = """
                SELECT PRODUCT_STOCK_AMOUNT
                    , PRODUCT_STOCK_NO
                FROM PRODUCT_STOCKS
                WHERE PRODUCT_STOCK_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Stock stock = new Stock();
            stock.setAmount(rs.getInt("PRODUCT_STOCK_AMOUNT"));
            stock.setNo(rs.getInt("PRODUCT_STOCK_NO"));

            return stock;
        }, stockNo);
    }

    public Stock searchAllStockByNo(int productNo) {
        String sql = """
            select s.product_stock_no
                    , s.product_stock_size
                    , s.product_stock_amount
                    , p.product_no
                    , p.product_name
            from products p, product_stocks s
            where p.product_no = ?
            and p.product_no = s.product_no
            order by s.product_stock_size desc
            """;

        return DaoHelper.selectOne(sql, rs -> {
           Stock stock = new Stock();
           stock.setNo(rs.getInt("PRODUCT_STOCK_NO"));
           stock.setSize(rs.getString("PRODUCT_STOCK_SIZE"));
           stock.setAmount(rs.getInt("PRODUCT_STOCK_AMOUNT"));

           Product product = new Product();
           product.setNo(rs.getInt("PRODUCT_NO"));
           product.setName(rs.getString("PRODUCT_NAME"));
           stock.setProduct(product);

           return stock;
        }, productNo);
    }

    /**
     * 전체 상품갯수를 조회해서 반환한다.
     * @return 상품 갯수
     */
    public int getAllTotalRows() {
        String sql = """
                select count(*)
                from product_stocks
                """;

        return DaoHelper.selectOneInt(sql);
    }


    public Stock getAllStockByNoAndSize(int productNo, int size) {
            String sql = """
                    select product_stock_amount
                    from (select product_stock_amount, product_stock_size
                          from product_stocks
                          where product_no = ?)
                    where product_stock_size = '?'
                    """;

            return DaoHelper.selectOne(sql, rs ->{
                Stock stock = new Stock();
                stock.setAmount(rs.getInt("product_stock_amount"));
                return stock;
            }, productNo, size);
    }

    /**
     * 상품번호로 재고 수량 전체 조회하기
     * @param productNo 상품번호
     * @return 재고수량
     */
    public List<Stock> getStocksByNo(int productNo) {
        String sql = """
                SELECT ,product_no
                      ,product_stock_size
                     , product_stock_amount
                FROM product_stocks
                WHERE product_no IN (SELECT product_no\s
                                     FROM product_stocks\s
                                     WHERE product_no = ?)
                ORDER BY product_stock_size DESC
                """;

        return DaoHelper.selectList(sql, rs -> {
            Stock stock = new Stock();
            stock.setProductNo(rs.getInt("PRODUCT_NO"));
            stock.setSize(rs.getString("PRODUCT_STOCK_SIZE"));
            stock.setAmount(rs.getInt("PRODUCT_STOCK_AMOUNT"));
            return stock;
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
                    , p.product_no
                    , p.product_name
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

            Product product = new Product();
            product.setNo(rs.getInt("product_no"));
            product.setName(rs.getString("product_name"));
            stock.setProduct(product);

            return stock;
        }, productNo);
    }

    public List<Stock> getAllStocks() {
        String sql = """
                SELECT
                    p.product_no
                    ,p.product_name
                    ,ps.product_stock_no
                    ,ps.product_stock_size
                    ,ps.product_stock_amount
                FROM products p
                JOIN product_stocks ps ON p.product_no = ps.product_no
                ORDER BY p.product_no, ps.product_stock_size DESC
            """;

        return DaoHelper.selectList(sql, rs -> {
           Stock stock = new Stock();
           stock.setNo(rs.getInt("PRODUCT_STOCK_NO"));
           stock.setSize(rs.getString("PRODUCT_STOCK_SIZE"));
           stock.setAmount(rs.getInt("PRODUCT_STOCK_AMOUNT"));

           Product product = new Product();
           product.setNo(rs.getInt("PRODUCT_NO"));
           product.setName(rs.getString("PRODUCT_NAME"));
           stock.setProduct(product);

           return stock;
        });
    }
}
