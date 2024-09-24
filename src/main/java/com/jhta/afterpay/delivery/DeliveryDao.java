package com.jhta.afterpay.delivery;

import com.jhta.afterpay.order.Order;
import com.jhta.afterpay.product.Product;
import com.jhta.afterpay.delivery.Stock;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class DeliveryDao {

    /**
     * 배송 관리 상품 추가
     * @param delivery
     */
    public void insertDelivery(Delivery delivery) {
        String sql = """
                INSERT INTO ORDER_DELIVERY_PRODUCTS
                (DELIVERY_NO
                , DELIVERY_PRODUCT_PRICE, DELIVERY_PRODUCT_AMOUNT
                , PRODUCT_NO, PRODUCT_STOCK_NO
                , ORDER_NO, RECIPIENT)
                VALUES
                (DELIVERY_NO_SEQ.NEXTVAL
                , ?, ?, ?
                , ?, ?, ?)
                """;
        DaoHelper.insert(sql
                , delivery.getPrice(), delivery.getAmount()
                , delivery.getProduct().getNo(), delivery.getStock().getNo()
                , delivery.getOrder().getNo(), delivery.getRecipient()
        );
    }

    /**
     * 배송상품 수정
     * @param delivery
     */
    public void updateDelivery(Delivery delivery) {
        String sql = """
                UPDATE ORDER_DELIVERY_PRODUCTS
                SET DELIVERY_NO = ?,
                DELIVERY_PRODUCT_PRICE = ?,
                DELIVERY_PRODUCT_AMOUNT = ?,
                DELIVERY_STATUS = ?,
                PRODUCT_NO = ?,
                PRODUCT_STOCK_NO = ?,
                ORDER_NO = ?
                """;

        DaoHelper.update(sql, delivery.getNo()
                , delivery.getPrice()
                , delivery.getAmount()
                , delivery.getStatus()
                , delivery.getProduct().getNo()
                , delivery.getStock().getNo()
                , delivery.getOrder().getNo()
        );
    }

    /**
     * 배송상품 삭제
     * @param deliveryNo
     */
    public void deleteDelivery(int deliveryNo) {
        String sql = """
                DELETE FROM ORDER_DELIVERY_PRODUCTS
                WHERE DELIVERY_NO = ?
                """;
        DaoHelper.delete(sql, deliveryNo);
    }


    /**
     * 배송상품 번호로 배송상품 조회
     * @param deliveryNo
     * @return
     */
    public Delivery getDeliveryByNo(int deliveryNo) {
        String sql = """
                SELECT *
                FROM ORDER_DELIVERY_PRODUCTS
                WHERE DELIVERY_NO = ?
                """;



        return DaoHelper.selectOne(sql, rs -> {
            Delivery delivery = new Delivery();
            delivery.setNo(rs.getInt("DELIVERY_NO"));
            delivery.setPrice(rs.getInt("DELIVERY_PRODUCT_PRICE"));
            delivery.setAmount(rs.getInt("DELIVERY_PRODUCT_AMOUNT"));
            delivery.setStatus(rs.getString("DELIVERY_STATUS"));

            Product product = new Product();
            delivery.setProduct(product);
            delivery.getProduct().setNo(rs.getInt("PRODUCT_NO"));

            Stock stock = new Stock();
            delivery.setStock(stock);
            delivery.getStock().setNo(rs.getInt("PRODUCT_STOCK_NO"));

            Order order = new Order();
            delivery.setOrder(order);
            delivery.getOrder().setNo(rs.getInt("ORDER_NO"));

            return delivery;
        }, deliveryNo);
    }

    /**
     * 주문번호로 모든 배송상품 조회
     * @param orderNo
     * @return
     */
    public List<Delivery> getAllDeliveryByOrderNo(int orderNo) {
        String sql = """
                SELECT *
                FROM ORDER_DELIVERY_PRODUCTS
                WHERE ORDER_NO = ?
                """;


        return DaoHelper.selectList(sql, rs -> {
            Delivery delivery = new Delivery();
            Product product = new Product();
            delivery.setProduct(product);
            Stock stock = new Stock();
            delivery.setStock(stock);
            Order order = new Order();
            delivery.setOrder(order);
            delivery.setNo(rs.getInt("DELIVERY_NO"));
            delivery.setPrice(rs.getInt("DELIVERY_PRODUCT_PRICE"));
            delivery.setAmount(rs.getInt("DELIVERY_PRODUCT_AMOUNT"));
            delivery.setStatus(rs.getString("DELIVERY_STATUS"));
            delivery.setRecipient(rs.getString("RECIPIENT"));
            delivery.getProduct().setNo(rs.getInt("PRODUCT_NO"));
            delivery.getStock().setNo(rs.getInt("PRODUCT_STOCK_NO"));
            delivery.getOrder().setNo(rs.getInt("ORDER_NO"));
            return delivery;
        }, orderNo);
    }

    /**
     * 사용자의 주문내역들 조회
     * @param userNo
     * @return
     */
    public List<Delivery> getDeliveriesByUserNo(int userNo) {
        String sql = """
                SELECT D.DELIVERY_PRODUCT_PRICE
                    , D.DELIVERY_NO
                    , D.DELIVERY_PRODUCT_AMOUNT
                    , D.DELIVERY_STATUS
                    , D.PRODUCT_NO
                    , D.PRODUCT_STOCK_NO
                    , D.ORDER_NO
                    , S.PRODUCT_STOCK_SIZE
                    , O.USER_NO
                    , O.ORDER_DATE
                    , P.PRODUCT_NAME
                FROM ORDER_DELIVERY_PRODUCTS D JOIN PRODUCT_STOCKS S
                    ON D.PRODUCT_STOCK_NO = S.PRODUCT_STOCK_NO
                        JOIN ORDERS O
                    ON O.ORDER_NO = D.ORDER_NO
                        JOIN PRODUCTS P
                    ON P.PRODUCT_NO = D.PRODUCT_NO
                WHERE O.USER_NO = ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Delivery delivery = new Delivery();

            delivery.setNo(rs.getInt("DELIVERY_NO"));
            delivery.setPrice(rs.getInt("DELIVERY_PRODUCT_PRICE"));
            delivery.setAmount(rs.getInt("DELIVERY_PRODUCT_AMOUNT"));
            delivery.setStatus(rs.getString("DELIVERY_STATUS"));

            Product product = new Product();
            product.setNo(rs.getInt("PRODUCT_NO"));
            product.setName(rs.getString("PRODUCT_NAME"));
            delivery.setProduct(product);

            Stock stock = new Stock();
            stock.setNo(rs.getInt("PRODUCT_STOCK_NO"));
           // stock.setSize(rs.getString("PRODUCT_STOCK_SIZE"));
            delivery.setStock(stock);

            Order order = new Order();
            order.setNo(rs.getInt("ORDER_NO"));
            order.setOrderDate(rs.getDate("ORDER_DATE"));
            delivery.setOrder(order);

            return delivery;
        }, userNo);
    }

    /**
     * 사용자의 주문내역 총 갯수 조회
     * @param userNo
     * @return
     */
    public int getAllTotalRowsByUserNo(int userNo) {
        String sql = """
                SELECT COUNT(*)
                FROM ORDER_DELIVERY_PRODUCTS D JOIN ORDERS O
                    ON D.ORDER_NO = O.ORDER_NO
                WHERE O.USER_NO = ?
                """;

        return DaoHelper.selectOneInt(sql, userNo);
    }

}