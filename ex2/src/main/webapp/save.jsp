<%@ page import="com.ex.ex2.model.ExDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>save.jsp</h2>
	<%
	String data1 = request.getParameter("data1");
	String data2 = request.getParameter("data2");

	ExDAO exDAO = new ExDAO();
	int result = exDAO.saveData(data1, data2);
	// result > 0 이면 저장성공 alert, 0이면 저장실패 alert
	if (result > 0) {
	%>
	<script>
		alert("저장성공");
		location.href = "index.jsp";
	</script>
	<%
	} else {
	%>
	<script>
		alert("저장실패");
	</script>
	<%
	}
	%>
</body>
</html>