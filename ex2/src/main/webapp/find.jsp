
<% page import="com.ex.ex2.model.ExDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>find.jsp</h2>
	<table>
		<tr>
			<th>data1</th>
			<th>data2</th>
		</tr>
		<%
		ExDAO exDAO = new ExDAO();
		exDAO.findAll();
		%>
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
</body>
</html>