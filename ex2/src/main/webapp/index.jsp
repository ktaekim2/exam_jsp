<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>index.jsp</h2>
	<a href="save.jsp">save.jsp로 이동</a>
	<a href="find.jsp">db데이터 조회</a>
	<form action="save.jsp">
		입력값1: <input type="text" name="data1"> 
		입력값2: <input type="text" name="data2">
		<input type="submit" value="전송">
	</form>
</body>
</html>