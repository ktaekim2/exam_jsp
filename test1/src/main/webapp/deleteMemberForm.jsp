<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>사원 퇴사처리</h2>
<form action="deleteMember.jsp">
    성명: <input type="text" name="name"><br>
    사원번호: <input type="text" name="id"><br>
    <input type="submit" value="삭제"> <button type="button" onclick="location.href='index.jsp">취소</button>
</form>
</body>
</html>
