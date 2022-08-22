package com.ex.ex1.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// DB 접속, 쿼리실행 등 DB와 관계된 기능 수행.
public class ExDAO {
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
	
	// controller와 service기능을 jsp에서 함
	// save.jsp에서 ExDAO의 메서드를 이용해 data를 가져옴
	public int saveData(String data1, String data2) throws Exception {
		con = getConnection(); // DB접속
		// throws: 예외를 던지다
		// try/catch: 해당 메서드에서 예외처리를 하겠다
		
		// sql문 준비
		String sql = "INSERT INTO EXTABLE VALUES(?,?)"; // mybatis, jpa가 자동으로 해주던 ?(변수)를 직접 해줘야
		// DB에 전송할 쿼리문 세팅
		pstmt = con.prepareStatement(sql); // Statement: 쿼리문, 쿼리문을 준비하다(현재 접속한 db상태에서, 위에 담긴 문장)
		// ? 채우기
		pstmt.setString(1, data1); // (?의 순서, 값), 정수면 setInt
		pstmt.setString(2, data2);
		// 쿼리문 실행
		int result = pstmt.executeUpdate(); // ctrl + enter, insert가 된 수만큼 int 리턴을 줌
		return result;
	}
	
	// mybatis가 자동으로 해주는 기능
	public List<ExDTO> findAll() throws Exception {
		con = getConnection();
		String sql = "SELECT * FROM EXTABLE"; // mybatis처럼 쿼리문 끝에 ; 쓰면 안됨
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery(); // select 쿼리일때만
		List<ExDTO> findAll = new ArrayList<>();
		while(rs.next()) { // next(): 한 줄 체크 후 다음줄이 있는지 확인함(boolean)
			ExDTO exDTO = new ExDTO();
			exDTO.setData1(rs.getString(1)); // 첫번째 컬럼 값
			exDTO.setData2(rs.getString(2));
			findAll.add(exDTO);
		}
		return findAll;
	}
	
	
}
