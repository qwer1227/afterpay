package com.jhta.afterpay.addr;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class AddrDao {

    public void insertAddr(Addr addr) {
        String sql = """
                INSERT INTO ADDRESSES
                (ADDR_NO
                , ADDR_NAME, ADDR_TEL 
                , ZIP_CODE, ADDR_1, ADDR_2
                , ISADDR_HOME, USER_NO)
                values(ADDR_NO_SEQ.NEXTVAL
                , ?, ?
                ,?, ?, ?
                ,?, ?)
                """;
        DaoHelper.insert(sql
        , addr.getName(), addr.getTel()
        , addr.getZipCode(), addr.getAddr1(), addr.getAddr2()
        , addr.getIsAddrHome(), addr.getUser().getNo());
    }

    public void deleteAddr(int addrNo) {
        String sql = """
                DELETE 
                FROM ADDRESSES
                WHERE ADDR_NO = ?
                """;
        DaoHelper.delete(sql, addrNo);
    }

    public void updateAddr(Addr addr) {
        String sql= """           
                UPDATE ADDRESSES
                SET 
                ADDR_NO = ?
                ,ADDR_NAME = ?
                ,ADDR_TEL = ?
                ,ZIP_CODE = ?
                ,ADDR_1 = ?
                ,ADDR_2 = ?
                ,ISADDR_HOME = ?
                ,USER_NO = ?
                """;
        DaoHelper.update(sql, addr.getNo()
                            , addr.getName()
                            , addr.getTel()
                            , addr.getZipCode()
                            , addr.getAddr1()
                            , addr.getAddr2()
                            , addr.getIsAddrHome()
                            , addr.getUser().getNo()
        );
    }

    public Addr getAddrByNo(int addrNo) {
        String sql = """
                SELECT *
                FROM ADDRESSES
                WHERE ADDR_NO = ?
                """;
            Addr addr = new Addr();
            User user = new User();
            addr.setUser(user);
        return DaoHelper.selectOne(sql, rs-> {
            addr.setNo(rs.getInt("ADDR_NO"));
            addr.setName(rs.getString("ADDR_NAME"));
            addr.setTel(rs.getString("ADDR_TEL"));
            addr.setZipCode(rs.getString("ZIP_CODE"));
            addr.setAddr1(rs.getString("ADDR_1"));
            addr.setAddr2(rs.getString("ADDR_2"));
            addr.setIsAddrHome(rs.getString("ISADDR_HOME"));
            addr.getUser().setNo(rs.getInt("USER_NO"));
            return addr;
        }, addrNo);
    }

    public List<Addr> getAllAddrByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM ADDRESSES
                WHERE USER_NO = ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            Addr addr = new Addr();
            addr.setNo(rs.getInt("ADDR_NO"));
            addr.setName(rs.getString("ADDR_NAME"));
            addr.setTel(rs.getString("ADDR_TEL"));
            addr.setZipCode(rs.getString("ZIP_CODE"));
            addr.setAddr1(rs.getString("ADDR_1"));
            addr.setAddr2(rs.getString("ADDR_2"));
            addr.setAddrHome(rs.getString("ISADDR_HOME"));
            User user = new User();
            user.setNo(userNo);
            addr.setUser(user);
            return addr;
        }, userNo);
    }
}
