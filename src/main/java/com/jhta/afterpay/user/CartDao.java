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

    public void deleteCartByNo(int cartNo) {
        String sql = """
                Delete 
                from carts
                where cart_no = ?
                """;
        DaoHelper.delete(sql, cartNo);
    }

    public void updateCartAmount(Cart cart) {
        String sql = """
               Update carts
                SET CART_AMOUNT = ?
                where cart_no = ?
                """;

        DaoHelper.update(sql
                , cart.getAmount()
                , cart.getNo());
    }

    public Cart getCartByNo(int no) {
        String sql = """
                SELECT c.cart_no
                    , c.cart_amount
                    , c.product_no
                    , c.user_no
                    , s.product_stock_no
                    , s.product_stock_size
                    , s.product_stock_amount
                    , s.product_no
                    , p.product_price
                FROM carts c, products p, product_stocks s
                WHERE c.cart_no = ?
                AND c.product_stock_no = s.product_stock_no
                AND c.product_no = p.product_no
                """;
        return DaoHelper.selectOne(sql, rs -> {
            Cart cart = new Cart();

            // 상품 가격정보
            Product product = new Product();
            product.setPrice(rs.getInt("product_price"));
            cart.setProduct(product);

            User user = new User();
            user.setNo(rs.getInt("user_no"));
            cart.setUser(user);

            // 재고정보 가져오기
            Stock stock = new Stock();
            stock.setNo(rs.getInt("product_stock_no"));
            stock.setAmount(rs.getInt("product_stock_amount"));
            stock.setSize(rs.getString("product_stock_size"));
            stock.setProductNo(rs.getInt("product_no"));
            cart.setStock(stock);

            // 장바구니 정보 설정
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
