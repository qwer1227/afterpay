package com.jhta.afterpay.product;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class StockDao {

    public List<Stock> getStocksByNo(int productNo) {
        String sql = """
                SELECT ,product_no
                      ,product_stock_size
                     , product_stock_amount
                FROM product_stocks
                WHERE product_no IN (SELECT product_no
                                     FROM product_stocks
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

    public Stock getStockByNo(int no) {
        String sql = """
                SELECT *
                FROM product_stocks
                where product_stock_no = ?
                """;

        return DaoHelper.selectOne(sql, rs-> {
                    Stock stock = new Stock();
                    stock.setNo(no);
                    stock.setAmount(rs.getInt("product_stock_amount"));
                    stock.setSize(rs.getString("product_stock_size"));
                    stock.setProductNo(rs.getInt("product_no"));
                    return stock;
                }, no);
    }




}
