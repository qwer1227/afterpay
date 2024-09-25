package com.jhta.afterpay.addr;

import com.jhta.afterpay.user.User;
import com.jhta.afterpay.util.DaoHelper;

import java.util.List;

public class AddrDao {

    /**
     * 주소 추가
     *
     * @param addr
     */
    public void insertAddr(Addr addr) {
        String sql = """
                INSERT INTO ADDRESSES
                (ADDR_NO
                , ADDR_NAME, ADDR_TEL 
                , ZIP_CODE, ADDR_1, ADDR_2
                , ISADDR_HOME, USER_NO, RECIPIENT)
                values(ADDR_NO_SEQ.NEXTVAL
                , ?, ?
                ,?, ?, ?
                ,?, ?)
                """;
        DaoHelper.insert(sql
                , addr.getName(), addr.getTel()
                , addr.getZipCode(), addr.getAddr1(), addr.getAddr2()
                , addr.getIsAddrHome(), addr.getUser().getNo(), addr.getRecipient());
    }

    /**
     * 주소 삭제
     *
     * @param addrNo
     */
    public void deleteAddr(int addrNo) {
        String sql = """
                DELETE 
                FROM ADDRESSES
                WHERE ADDR_NO = ?
                """;
        DaoHelper.delete(sql, addrNo);
    }

    /**
     * 주소 수정
     *
     * @param addr
     */
    public void updateAddr(Addr addr) {
        String sql = """           
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
                ,RECIPIENT = ?
                """;
        DaoHelper.update(sql, addr.getNo()
                , addr.getName()
                , addr.getTel()
                , addr.getZipCode()
                , addr.getAddr1()
                , addr.getAddr2()
                , addr.getIsAddrHome()
                , addr.getUser().getNo()
                , addr.getRecipient()
        );
    }

    /**
     * 주소 번호로 주소 조회
     *
     * @param addrNo
     * @return
     */
    public Addr getAddrByNo(int addrNo) {
        String sql = """
                SELECT *
                FROM ADDRESSES
                WHERE ADDR_NO = ?
                """;

        return DaoHelper.selectOne(sql, rs -> {
            Addr addr = new Addr();
            User user = new User();
            addr.setUser(user);
            addr.setNo(rs.getInt("ADDR_NO"));
            addr.setName(rs.getString("ADDR_NAME"));
            addr.setTel(rs.getString("ADDR_TEL"));
            addr.setZipCode(rs.getString("ZIP_CODE"));
            addr.setAddr1(rs.getString("ADDR_1"));
            addr.setAddr2(rs.getString("ADDR_2"));
            addr.setRecipient(rs.getString("RECIPIENT"));
            addr.setIsAddrHome(rs.getString("ISADDR_HOME"));
            addr.getUser().setNo(rs.getInt("USER_NO"));
            return addr;
        }, addrNo);
    }

    /**
     * 유저번호로 유저의 모든 주소 조회
     *
     * @param userNo
     * @return
     */
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
            addr.setRecipient(rs.getString("RECIPIENT"));
            User user = new User();
            user.setNo(userNo);
            addr.setUser(user);
            return addr;
        }, userNo);
    }

    /**
     * 집주소로 설정된 사용자의 주소 조회
     * @param userNo
     * @return
     */
    public Addr getHomeAddrByUserNo(int userNo) {
        String sql = """
                SELECT *
                FROM ADDRESSES
                WHERE USER_NO = ?
                    AND ISADDR_HOME = 'Y'
                """;

        return DaoHelper.selectOne(sql, rs-> {
            Addr addr = new Addr();
            User user = new User();
            addr.setUser(user);
            addr.setNo(rs.getInt("ADDR_NO"));
            addr.setName(rs.getString("ADDR_NAME"));
            addr.setTel(rs.getString("ADDR_TEL"));
            addr.setZipCode(rs.getString("ZIP_CODE"));
            addr.setAddr1(rs.getString("ADDR_1"));
            addr.setAddr2(rs.getString("ADDR_2"));
            addr.setIsAddrHome(rs.getString("ISADDR_HOME"));
            addr.getUser().setNo(rs.getInt("USER_NO"));
            return addr;
        }, userNo);
    }

    /**
     * 배송주소 번호로 조회해 해당하는 주소의 정보 수정
     * @param addr
     */
    public void updateAddrByAddrNo(Addr addr) {
        String sql = """
                UPDATE ADDRESSES
                SET ZIP_CODE = ?
                    , ADDR_1 = ?
                    , ADDR_2 = ?
                WHERE ADDR_NO = ?
                """;
        DaoHelper.update(sql
                , addr.getZipCode()
                , addr.getAddr1()
                , addr.getAddr2()
                , addr.getNo());
    }
}
