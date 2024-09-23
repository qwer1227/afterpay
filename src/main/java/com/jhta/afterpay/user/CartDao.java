package com.jhta.afterpay.user;

import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.product.Stock;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class CartDao {

    public void insertCart(Cart cart) {
        String sql = """
                INSERT INTO carts
                (cart_no
                , cart_amount, product_stock_no
                , product_no, user_no)   
                VALUES
                (cart_no_seq.nextval
                , ?, ?
                
                , ? , ?)
                """;
        DaoHelper.insert(sql
                , cart.getAmount(), cart.getStock().getNo()
                , cart.getProduct().getNo(), cart.getUser().getNo());
    }

    public void deleteCart(Cart cart) {
        String sql = """
                Delete 
                from carts
                where cart_no = ?
                """;
        DaoHelper.delete(sql, cart.getNo());
    }

    public Cart getCartByNo(int no) {
        String sql = """
                SELECT *
                FROM carts
                WHERE user_no = ?
                """;
        return DaoHelper.selectOne(sql, rs -> {
            Cart cart = new Cart();
            Product product = new Product();
            cart.setProduct(product);
            User user = new User();
            cart.setUser(user);
            Stock stock = new Stock();
            cart.setStock(stock);
            cart.setNo(rs.getInt("cart_no"));
            cart.setAmount(rs.getInt("cart_amount"));
            cart.getProduct().setNo(rs.getInt("product_no"));
            cart.getUser().setNo(rs.getInt("user_no"));
            cart.getStock().setNo(rs.getInt("product_stock_no"));
            return cart;
        }, no);
    }

    public List<Cart> getAllCartsByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM carts
                WHERE user_no = ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            // Product, User, Stock 객체 생성
            Cart cart = new Cart();
            Product product = new Product();
            cart.setProduct(product);
            User user = new User();
            cart.setUser(user);
            Stock stock = new Stock();
            cart.setStock(stock);

            cart.setNo(rs.getInt("cart_no"));
            cart.setAmount(rs.getInt("cart_amount"));
            cart.getProduct().setNo(rs.getInt("product_no"));
            cart.getUser().setNo(rs.getInt("user_no"));
            cart.getStock().setNo(rs.getInt("product_stock_no"));
            return cart;
        }, userNo);
    }


}
