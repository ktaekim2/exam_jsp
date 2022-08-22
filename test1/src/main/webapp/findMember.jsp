<%@ page import="com.example.test1.model.MemberDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.test1.model.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
		<td>사번</td>
		<td>이름</td>
		<td>부서</td>
		<td>직급</td>
		<td>직책</td>
		<td>연락처</td>
	</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			String searchType = request.getParameter("searchType");
			String idValue = request.getParameter("idValue");
			String deptValue = request.getParameter("deptValue");
			System.out.println("deptValue + searchType + idValue = " + deptValue + searchType + idValue);
			MemberDAO memberDAO = new MemberDAO();
			List<MemberDTO> searchResult = memberDAO.findMember(searchType, idValue, deptValue);
			System.out.println("searchResult = " + searchResult);
			for (MemberDTO memberDTO: searchResult) {
		%>
		<tr>
			<td><%=memberDTO.getId()%></td>
			<td><%=memberDTO.getName()%></td>
			<td><%=memberDTO.getDept()%></td>
			<td><%=memberDTO.getDuty()%></td>
			<td><%=memberDTO.getPosition()%></td>
			<td><%=memberDTO.getPhone()%></td>
		</tr>
        <%
            }
        %>
	</table>
</body>
</html>