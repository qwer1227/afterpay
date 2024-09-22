package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class StockDao {


    /**
     * 상품번호로 재고 수량 전체 조회하기
     * @param productNo 상품번호
     * @return 재고수량
     */
    public List<Stock> getAllStocksByNo(int productNo) {
        String sql = """
                SELECT ,product_no
                      ,product_stock_size
                     , product_stock_amount
                FROM product_stocks
                WHERE product_no IN (SELECT product_no\s
                                     FROM product_stocks\s
                                     WHERE product_no = ?)
                ORDER BY product_stock_size DESC;
                """;

        return DaoHelper.selectList(sql, rs -> {
            Stock stock = new Stock();
            stock.setProductNo(rs.getInt("PRODUCT_NO"));
            stock.setSize(rs.getString("PRODUCT_STOCK_SIZE"));
            stock.setAmount(rs.getInt("PRODUCT_STOCK_AMOUNT"));
            return stock;
        }, productNo);
    }
}
