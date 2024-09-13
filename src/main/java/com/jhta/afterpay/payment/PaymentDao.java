package com.jhta.afterpay.payment;

import com.jhta.afterpay.order.OrderDto;
import com.jhta.afterpay.util.DaoHelper;

import java.util.Date;
import java.util.List;

public class PaymentDao {
    public void insertPayment(PaymentDto payment) {
        String sql = """
                INSERT INTO PAYMENTS
                (PAYMENT_NO, PAYMENT_PRICE, ORDER_NO)
                VALUES 
                (?, ?, ?)
                """;
        DaoHelper.insert(sql
                , payment.getNo()
                , payment.getPrice()
                , payment.getOrder().getNo()
        );
    }

    public void updatePayment(PaymentDto payment) {
        String sql = """
                UPDATE PAYMENTS
                SET PAYMENT_PRICE = ? 
                WHERE PAYMENT_NO = ?   
                """;
        DaoHelper.update(sql
                , payment.getPrice()
                , payment.getNo());
    }

    public void deletePayment(PaymentDto payment) {
        String sql = """
                DELETE FROM PAYMENTS
                WHERE PAYMENT_NO = ?
                """;
        DaoHelper.delete(sql
        , payment.getNo());
    }

    public PaymentDto getPaymentByNo(int paymentNo) {
        String sql = """
                SELECT * 
                FROM PAYMENTS
                WHERE PAYMENT_NO = ?
                """;

        return DaoHelper.selectOne(sql
            , rs -> {
            PaymentDto payment = new PaymentDto();
            payment.setNo(rs.getInt("PAYMENT_NO"));
            payment.setPrice(rs.getInt("PAYMENT_PRICE"));
            payment.getOrder().setNo(rs.getInt("ORDER_NO"));
            payment.setCreatedDate(rs.getDate("CREATED_DATE"));

            return payment;
        }
        );
    }

    public List<PaymentDto> getAllPaymentsByOrderNo(int orderNo) {
        String sql= """
                SELECT *
                FROM PAYMENTS
                WHERE ORDER_NO = ?
                """;

        return DaoHelper.selectList(sql
             ,   rs -> {
                PaymentDto payment = new PaymentDto();






                    return payment;
                }

                );
    }
}
