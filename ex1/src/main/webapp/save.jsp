<%@ page import="com.ex.ex1.model.ExDAO" %>
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
	<!-- 스프립틀릿(scriptlet) -->
	<%
		String data1 = request.getParameter("data1"); // request객체에서 제공하는 getParameter라는 메서드를 이용, @RequestParam
		String data2 = request.getParameter("data2");
		// ExDAO의 saveData 메서드 호출
		ExDAO exDAO = new ExDAO();
		int result = exDAO.saveData(data1, data2);
		// result > 0 이면 저장성공 alert, 0이면 저장실패 alert
		if (result > 0) {
			%>
	<script>
		alert("저장성공");
		location.href = "Hello.jsp"; // mvc기반에서는 컨트롤러를 거쳐야함. 이렇게 하면 안됨.
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
	<h2>전달받은 값</h2>
	<h3><%=data1%></h3>
	<h3><%=data2%></h3>
</body>
</html>