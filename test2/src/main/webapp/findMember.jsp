<%@ page import="com.example.test2.model.MemberDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.test2.model.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }
        #contents {
            padding: 20px;
            background-color: burlywood;
            text-align: center;
        }
        table {
            margin-left: auto;
            margin-right: auto;
        }
        table, tr, th, td {
            border: 1px black solid;
            padding: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<div id="contents">
    <table>
        <tr>
            <th>회원번호</th>
            <th>회원성명</th>
            <th>전화번호</th>
            <th>주소</th>
            <th>가입일자</th>
            <th>고객등급</th>
            <th>거주지역</th>
        </tr>
        <%
            MemberDAO memberDAO = new MemberDAO();
            List<MemberDTO> findAll = memberDAO.findAll();
            for (MemberDTO memberDTO : findAll) {
        %>
        <tr>
            <td><a href="updateMemberForm.jsp?custno=<%=memberDTO.getCustno()%>"><%=memberDTO.getCustno()%></a></td>
            <td><%=memberDTO.getCustname()%></td>
            <td><%=memberDTO.getPhone()%></td>
            <td><%=memberDTO.getAddress()%></td>
            <td><%=memberDTO.getJoindate()%></td>
            <td><%=memberDTO.getGrade()%></td>
            <td><%=memberDTO.getCity()%></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%@include file="footer.jsp"%>

</body>
</html>
