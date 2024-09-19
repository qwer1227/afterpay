package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class StockDao {

    public List<Stock> getAllStocks() {
        String sql = """
                select *
                from product_stocks
                """;

        return DaoHelper.selectList(sql, rs -> {
            Stock stock = new Stock();
            stock.setNo(rs.getInt("PRODUCT_STOCK_NO"));
            stock.setSize(rs.getString("PRODUCT_STOCK_SIZE"));
            stock.setAmount(rs.getInt("PRODUCT_STOCK_AMOUNT"));
            stock.setProductNo(rs.getInt("PRODUCT_NO"));

            return stock;
        });
    }

}
