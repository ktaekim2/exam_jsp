package com.example.test1.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	public int saveMember(String id, String name, String dept, String position, String duty, String phone) throws Exception {
		con = getConnection(); // DB 접속을 위해 getConnection 메서드 호출
		String sql = "INSERT INTO PERSONNEL VALUES(?,?,?,?,?,?)"; // insert 쿼리 수행을 위한 쿼리문 세팅(mybatis에서 했던 내용과 비슷하다고 보면 됩니다.)
		pstmt = con.prepareStatement(sql); // DB에 전송할 쿼리문 세팅
		// 위의 sql에서 물음표(?)로 처리한 위치에 값을 채움.
		pstmt.setString(1, id); // 숫자는 물음표 순서, 다음은 해당 위치에 채울 값.
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, duty);
		pstmt.setString(6, phone);
		// executeUpdate()는 성공하면 1이상의 값, 실패하면 0을 반환함.
		int result = pstmt.executeUpdate(); // insert, update, delete 쿼리 수행할 때는 executeUpdate() 호출
		pstmt.close(); // 쿼리 실행이 끝나면 pstmt 종료
		con.close(); // 접속 종료
		return result;
	}

	public List<MemberDTO> findMember(String searchType, String idValue, String deptValue) throws Exception {
		con = getConnection();
		List<MemberDTO> findResult = new ArrayList<>();
		String sql = "";
		if (searchType.equals("id")) {
			sql = "SELECT * FROM PERSONNEL WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idValue);
		} else if (searchType.equals("dept")) {
			sql = "SELECT * FROM PERSONNEL WHERE DEPT=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deptValue);
		}
		rs = pstmt.executeQuery(); // select 쿼리 수행할 때만 executeQuery() 호출
		while (rs.next()) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(rs.getString(1));
			memberDTO.setName(rs.getString(2));
			memberDTO.setDept(rs.getString(3));
			memberDTO.setPosition(rs.getString(4));
			memberDTO.setDuty(rs.getString(5));
			memberDTO.setPhone(rs.getString(6));
			findResult.add(memberDTO);
		}
		return findResult;
	}

	public int updateMember(String id, String name, String dept, String position, String duty, String phone) throws Exception {
		con = getConnection();
		String sql = "UPDATE PERSONNEL SET NAME=?, DEPT=?, POSITION=?, DUTY=?, PHONE=? WHERE ID=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, duty);
		pstmt.setString(5, phone);
		pstmt.setString(6, id);
		int result = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return result;
	}

	public int deleteMember(String id, String name) throws Exception {
		con = getConnection();
		String sql = "DELETE FROM PERSONNEL WHERE ID=? AND NAME=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		int result = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return result;
	}
}
