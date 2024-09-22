package com.jhta.afterpay.order;

import com.jhta.afterpay.delivery.Stock;
import com.jhta.afterpay.product.Image;
import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class CartDao {

    public void insertCart(Cart cart) {
        String sql = """
                INSERT INTO cart
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
        String sql= """
                Delete 
                from cart 
                where cart_no = ?
                """;
        DaoHelper.delete(sql, cart.getNo());
    }

    public Cart getCartByNo(int no) {
        String sql = """
                SELECT *
                FROM cart
                WHERE user_no = ?
                """;
        return DaoHelper.selectOne(sql, rs ->{
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
            cart.getStock().setNo(rs.getInt("stock_no"));
            return cart;
        }, no);
    }

    public List<Cart> getAllCartsByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM carts
                WHERE user_no = ?
                """;

        return DaoHelper.selectList(sql, rs ->{
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

    public List<Cart> getCartsInfoByUserNo(int userNo) {
        String sql = """
                SELECT C.CART_NO
                    , C.CART_AMOUNT
                    , C.USER_NO
                    , S.PRODUCT_NO
                    , C.PRODUCT_STOCK_NO
                    , S.PRODUCT_STOCK_SIZE
                    , P.PRODUCT_NAME
                    , P.PRODUCT_PRICE
                    , I.IMG_NAME
                FROM CARTS C JOIN PRODUCT_STOCKS S
                    ON C.PRODUCT_STOCK_NO = S.PRODUCT_STOCK_NO
                        JOIN PRODUCTS P
                    ON C.PRODUCT_NO = P.PRODUCT_NO
                        JOIN PRODUCT_IMGS I
                    ON I.PRODUCT_NO = P.PRODUCT_NO
                WHERE USER_NO = ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Cart cart = new Cart();
            cart.setNo(rs.getInt("cart_no"));
            cart.setAmount(rs.getInt("cart_amount"));

            User user = new User();
            user.setNo(rs.getInt("user_no"));
            cart.setUser(user);

            Stock stock = new Stock();
            stock.setProductNo(rs.getInt("product_no"));
            stock.setNo(rs.getInt("product_stock_no"));
            stock.setSize(rs.getString("product_stock_size"));
            cart.setStock(stock);

            Product product = new Product();
            product.setName(rs.getString("product_name"));
            product.setPrice(rs.getInt("product_price"));
            cart.setProduct(product);

            return cart;
        }, userNo);
    }
}
