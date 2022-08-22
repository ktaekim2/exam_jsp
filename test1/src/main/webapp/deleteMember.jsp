<%@ page import="com.example.test1.model.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");

    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.deleteMember(id, name);
    if (result>0) {
%>
<script>
    alert("삭제성공");
    location.href="index.jsp";
</script>
<%
    } else {
%>
<script>
    alert("삭제실패");
    location.href="deleteMemberForm.jsp";
</script>
<%
    }
%>
</body>
</html>
