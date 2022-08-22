<%@ page import="com.example.test1.model.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 위의 submit 클릭하면 아래 코드 실행되면서 값을 가져옴. -->
<%

    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String dept = request.getParameter("dept");
    String position = request.getParameter("position");
    String duty = request.getParameter("duty");
    String phone = request.getParameter("phone");

    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.updateMember(id, name, dept, position, duty, phone);
    if (result > 0) {
%>
<script>
    alert("정보변경성공");
    location.href="index.jsp";
</script>
<%
} else {
%>
<script>
    alert("정보변경실패");
    location.href="updateMemberForm.jsp";
</script>
<%
    }
%>
</body>
</html>
