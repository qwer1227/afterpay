package com.jhta.afterpay.addr;

import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class AddrDao {

    public void insertAddr(AddrDto addr) {
        String sql = """
                INSERT INTO ADDRESSES
                (ADDR_NO, ADDR_NAME, ADDR_TEL 
                , ZIP_CODE, ADDR_1, ADDR_2
                , ISADDR_HOME, USER_NO)
                values(?, ?, ?
                ,?, ?, ?
                ,?, ?)
                """;
        DaoHelper.insert(sql, addr.getNo(), addr.getName(), addr.getTel()
        , addr.getZipCode(), addr.getAddr1(), addr.getAddr2()
        , addr.isAddrHome(), addr.getUser().getNo());
    }

    public void deleteAddr(int addrNo) {
        String sql = """
                DELETE 
                FROM ADDRESSES
                WHERE ADDR_NO = ?
                """;
        DaoHelper.delete(sql, addrNo);
    }

    public void updateAddr(AddrDto addr) {
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
                            , addr.isAddrHome()
                            , addr.getUser().getNo()
        );
    }

    public AddrDto getAddrByNo(int addrNo) {
        String sql = """
                SELECT *
                FROM ADDRESSES
                WHERE ADDR_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs-> {
            AddrDto addr = new AddrDto();
            addr.setNo(rs.getInt("ADDR_NO"));
            addr.setName(rs.getString("ADDR_NAME"));
            addr.setTel(rs.getString("ADDR_TEL"));
            addr.setZipCode(rs.getString("ZIP_CODE"));
            addr.setAddr1(rs.getString("ADDR_1"));
            addr.setAddr2(rs.getString("ADDR_2"));
            addr.setAddrHome(rs.getString("ISADDR_HOME"));
            addr.getUser().setNo(rs.getInt("USER_NO"));
            return addr;
        }, addrNo);
    }

    public List<AddrDto> getAllAddrByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM ADDRESSES
                WHERE USER_NO = ?
                """;

        return DaoHelper.selectList(sql, rs -> {
            AddrDto addr = new AddrDto();
            addr.setNo(rs.getInt("ADDR_NO"));
            addr.setName(rs.getString("ADDR_NAME"));
            addr.setTel(rs.getString("ADDR_TEL"));
            addr.setZipCode(rs.getString("ZIP_CODE"));
            addr.setAddr1(rs.getString("ADDR_1"));
            addr.setAddr2(rs.getString("ADDR_2"));
            addr.setAddrHome(rs.getString("ISADDR_HOME"));
            addr.getUser().setNo(rs.getInt("USER_NO"));
            return addr;
        }, userNo);
    }
}
