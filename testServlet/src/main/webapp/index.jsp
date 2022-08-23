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
	<a href="hello">hello 주소 요청</a>

	<form action="/hi" method="post">
		<input type="text" name="data1"><br> 
		<input type="submit" value="전송">
	</form>
</body>
</html>