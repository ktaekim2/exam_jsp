package com.ex.ex2.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ExDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "user1", "1234");
		return con;
	}

	public int saveData(String data1, String data2) throws Exception {
		con = getConnection();
		String sql = "INSERT INTO EXTABLE VALUES(?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, data1);
		pstmt.setString(2, data2);
		int result = pstmt.executeUpdate();
		return result;
	}
	
	public List<ExDTO> findAll() {
		
	}
}
