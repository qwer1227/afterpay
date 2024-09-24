package com.jhta.afterpay.payment;

import com.jhta.afterpay.order.Order;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class PaymentDao {

    /**
     * 결제 추가
     * @param payment
     */
    public void insertPayment(Payment payment) {
        String sql = """
                INSERT INTO PAYMENTS
                (PAYMENT_NO
                , PAYMENT_PRICE
                , ORDER_NO)
                VALUES 
                (PAYMENT_NO_SEQ.NEXTVAL 
                , ?
                , ?)
                """;
        DaoHelper.insert(sql
                , payment.getPrice()
                , payment.getOrder().getNo()
        );
    }

    /**
     * 결제 수정
     * @param payment
     */
    public void updatePayment(Payment payment) {
        String sql = """
                UPDATE PAYMENTS
                SET PAYMENT_PRICE = ? 
                WHERE PAYMENT_NO = ?   
                """;
        DaoHelper.update(sql
                , payment.getPrice()
                , payment.getNo());
    }

    /**
     * 결제 삭제
     * @param payment
     */
    public void deletePayment(Payment payment) {
        String sql = """
                DELETE FROM PAYMENTS
                WHERE PAYMENT_NO = ?
                """;
        DaoHelper.delete(sql
        , payment.getNo());
    }

    /**
     * 결제번호로 결제정보 조회
     * @param paymentNo
     * @return
     */
    public Payment getPaymentByNo(int paymentNo) {
        String sql = """
                SELECT * 
                FROM PAYMENTS
                WHERE PAYMENT_NO = ?
                """;

        return DaoHelper.selectOne(sql
            , rs -> {
            Payment payment = new Payment();
            payment.setNo(rs.getInt("PAYMENT_NO"));
            payment.setPrice(rs.getInt("PAYMENT_PRICE"));
            payment.getOrder().setNo(rs.getInt("ORDER_NO"));
            payment.setCreatedDate(rs.getDate("CREATED_DATE"));

            return payment;
        });
    }

    /**
     * 주문번호로 결제조회
     * @param orderNo
     * @return
     */
    public Payment getPaymentByOrderNo(int orderNo) {
        String sql= """
                SELECT *
                FROM PAYMENTS
                WHERE ORDER_NO = ?
                """;

        return DaoHelper.selectOne(sql
                , rs -> {
                    Payment payment = new Payment();
                    Order order =new Order();
                    payment.setOrder(order);
                    payment.setNo(rs.getInt("PAYMENT_NO"));
                    payment.setPrice(rs.getInt("PAYMENT_PRICE"));
                    payment.getOrder().setNo(rs.getInt("ORDER_NO"));
                    payment.setCreatedDate(rs.getDate("PAYMENT_DATE"));
                    return payment;}, orderNo);
    }
}
