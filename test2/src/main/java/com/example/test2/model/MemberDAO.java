package com.example.test2.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    // Connection, PreparedStatement, ResultSet 객체는 ojdbc11.jar 라이브러리가 있어야만 사용가능.
    Connection con = null; // DB 접속을 위한 객체
    PreparedStatement pstmt = null; // 쿼리문 전송을 위한 객체
    ResultSet rs = null; // select 쿼리 등을 수행했을 때 select 결과를 담는 객체

    // DB에 접속하기 위한 메서드. DAO 클래스의 모든 메서드가 시작전에 이 메서드를 호출해야 DB 작업 수행 가능.
    public Connection getConnection() throws Exception {
        // 이 메서드의 내용은 보통 평가지에서 제시함. (사용자 계정만 잘 구분하면 됨.)

        // 클래스를 로드 하는 역할(매개변수로 넘기는 클래스가 가지고 있는 필드, 메서드 종류, 클래스 이름 등을 JVM에 할당)
        // 인스턴스 생성 및 초기화를 해줌.
        // 컴파일 시점이 아니라 런타임 시점에 로딩을 할 수 있게 해줌.(DI랑 비슷한 역할)
        Class.forName("oracle.jdbc.OracleDriver"); // 사용할 DB 드라이버 로드
        // 접속할 DB 주소, 사용자 계정, 비밀번호
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "user1", "1234");
        return con;
    }

    public int getCustNo() throws Exception {
        con = getConnection();
        String sql = "SELECT COUNT(CUSTNO) FROM member_tbl_02";
        pstmt = con.prepareStatement(sql);
        rs = pstmt.executeQuery();
        int result = 100001;
        if (rs.next()) {
            int memberCount = rs.getInt(1);
            result = result + memberCount;
        }
        rs.close();
        pstmt.close();
        con.close();
        return result;
    }


    public int saveMember(String custno, String custname, String phone, String address, String joindate, String grade, String city) throws Exception {
        con = getConnection();
        String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, custno);
        pstmt.setString(2, custname);
        pstmt.setString(3, phone);
        pstmt.setString(4, address);
        pstmt.setString(5, joindate);
        pstmt.setString(6, grade);
        pstmt.setString(7, city);
        int result = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return result;
    }

    public List<MemberDTO> findAll() throws Exception {
        con = getConnection();
        String sql = "select custno, custname, phone, address, to_char(joindate,'YYYY-MM-DD'),     " +
                     "case    when grade='A' then 'VIP'" +
                     "        when grade='B' then '일반'" +
                     "        when grade='C' then '직원'" +
                     "        else '없음' \n" +
                     "    end as grade, city from member_tbl_02";
        pstmt = con.prepareStatement(sql);
        rs = pstmt.executeQuery();
        List<MemberDTO> memberList = new ArrayList<>();
        while (rs.next()) {
            MemberDTO memberDTO = new MemberDTO();
            memberDTO.setCustno(rs.getString(1));
            memberDTO.setCustname(rs.getString(2));
            memberDTO.setPhone(rs.getString(3));
            memberDTO.setAddress(rs.getString(4));
            memberDTO.setJoindate(rs.getString(5));
            memberDTO.setGrade(rs.getString(6));
            memberDTO.setCity(rs.getString(7));
            memberList.add(memberDTO);
        }
        System.out.println("memberList = " + memberList);
        return memberList;
    }

    public MemberDTO findById(String custno) throws Exception {
        con = getConnection();
        String sql = "select custno, custname, phone, address, joindate, grade, city from member_tbl_02 where custno=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, custno);
        rs = pstmt.executeQuery();
        MemberDTO memberDTO = null;
        if (rs.next()) {
            memberDTO = new MemberDTO();
            memberDTO.setCustno(rs.getString(1));
            memberDTO.setCustname(rs.getString(2));
            memberDTO.setPhone(rs.getString(3));
            memberDTO.setAddress(rs.getString(4));
            memberDTO.setJoindate(rs.getString(5));
            memberDTO.setGrade(rs.getString(6));
            memberDTO.setCity(rs.getString(7));
        }
        return memberDTO;
    }

    public int updateMember(String custno, String custname, String phone, String address, String joindate, String grade, String city) throws Exception {
        con = getConnection();
        String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, custname);
        pstmt.setString(2, phone);
        pstmt.setString(3, address);
        pstmt.setString(4, joindate);
        pstmt.setString(5, grade);
        pstmt.setString(6, city);
        pstmt.setString(7, custno);
        int result = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return result;
    }


    public List<SalesDTO> salesList() throws Exception {
        con = getConnection();
        // 여러 줄에 걸쳐서 쓸 때는 띄어쓰기 조심
        String sql = "select m.custno, m.custname, " +
                     "case    when m.grade='A' then 'VIP'" +
                     "        when m.grade='B' then '일반'" +
                     "        when m.grade='C' then '직원' " +
                     "        else '없음' " +
                     "        end as grade," +
                     "    sum(mo.price) as total " +
                     "    from member_tbl_02 m, money_tbl_02 mo " +
                     "        where m.custno=mo.custno " +
                     "        group by m.custno, m.custname, m.grade " +
                     "        order by total desc";
        pstmt = con.prepareStatement(sql);
        rs = pstmt.executeQuery();
        List<SalesDTO> salesList = new ArrayList<>();
        while (rs.next()) {
            SalesDTO salesDTO = new SalesDTO();
            salesDTO.setCustno(rs.getInt(1)); // int로 가져와야 하기 때문에 getInt() 사용
            salesDTO.setCustname(rs.getString(2));
            salesDTO.setGrade(rs.getString(3));
            salesDTO.setSalesAmount(rs.getInt(4));
            salesList.add(salesDTO);
        }
        return salesList;

    }
}
