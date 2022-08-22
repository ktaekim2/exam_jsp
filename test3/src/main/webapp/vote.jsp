<%@ page import="com.example.test3.model.VoteDAO" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-08-04
  Time: 오전 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String v_jumin = request.getParameter("v_jumin");
        String v_name = request.getParameter("v_name");
        String m_no = request.getParameter("m_no");
        String v_time = request.getParameter("v_time");
        String v_area = request.getParameter("v_area");
        String v_confirm = request.getParameter("v_confirm");

        VoteDAO voteDAO = new VoteDAO();
        int result = voteDAO.saveVote(v_jumin, v_name, m_no, v_time, v_area, v_confirm);
        if (result > 0) {
    %>
<script>
    alert("투표하기 정보가 정상적으로 등록되었습니다!");
    location.href = "index.jsp";
</script>
    <%
        } else {
    %>
<script>
    alert("투표하기 실패!");
</script>
    <%
        }
    %>
</html>
