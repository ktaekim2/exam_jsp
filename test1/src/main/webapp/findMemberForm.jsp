<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="findMember.jsp">
		<input type="radio" value="id" name="searchType"> 사원번호로 조회: <input type="text" name="idValue"><br>
		<input type="radio" value="dept" name="searchType">
			소속부서: <select name="deptValue">
					<option value="인사부">인사부</option>
					<option value="기획부">기획부</option>
					<option value="홍보부">홍보부</option>
					<option value="영업부">영업부</option>
					<option value="경리부">경리부</option>
					</select>	
		<br>
		<input type="submit" value="조회"> <button type="button" onclick="location.href='index.jsp'">취소</button>
	</form>
</body>
</html>