<%@ page import="com.ex.ex1.model.ExDAO"%>
<%@ page import="com.ex.ex1.model.ExDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td {
	border: 1px solid black;
}
</style>

</head>
<body>
	<h2>find.jsp</h2>
	<table>
		<tr>
			<td>data1</td>
			<td>data2</td>
		</tr>
		<%
		ExDAO exDAO = new ExDAO();
		List<ExDTO> findAll = exDAO.findAll();
		for (ExDTO ex : findAll) {
		%>
		<tr>
			<td><%=ex.getData1()%></td>
			<td><%=ex.getData2()%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>