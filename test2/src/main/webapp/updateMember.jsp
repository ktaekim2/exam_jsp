<%@ page import="com.example.test2.model.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String custno = request.getParameter("custno");
    String custname = request.getParameter("custname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");

    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.updateMember(custno, custname, phone, address, joindate, grade, city);
%>
<script>
    location.href = "findMember.jsp";
</script>
</body>
</html>
