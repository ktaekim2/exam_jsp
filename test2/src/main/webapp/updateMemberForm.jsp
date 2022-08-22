<%@ page import="com.example.test2.model.MemberDAO" %>
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
    </style>
</head>
<body>
<%
    MemberDAO memberDAO = new MemberDAO();
    String custno = request.getParameter("custno");
    MemberDTO memberDTO = memberDAO.findById(custno);
%>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<div id="contents">
    <form action="updateMember.jsp" name="updateForm">
        회원번호(자동발생): <input type="text" name="custno" value="<%=memberDTO.getCustno()%>"> <br>
        회원성명: <input type="text" name="custname" value="<%=memberDTO.getCustname()%>"> <br>
        회원전화: <input type="text" name="phone" value="<%=memberDTO.getPhone()%>"> <br>
        회원주소: <input type="text" name="address" value="<%=memberDTO.getAddress()%>"> <br>
        가입일자: <input type="text" name="joindate" value="<%=memberDTO.getJoindate()%>"> <br>
        고객등급(A:VIP, B:일반, C:직원): <input type="text" name="grade" value="<%=memberDTO.getGrade()%>"> <br>
        도시코드: <input type="text" name="city" value="<%=memberDTO.getCity()%>"> <br>
        <input type="button" value="등록" onclick="saveCheck()">
        <input type="button" onclick="location.href='findMember.jsp'" value="조회">
    </form>
</div>
<%@include file="footer.jsp"%>
</body>
<script>
    function saveCheck() {
        if (document.updateForm.custname.value == "") {
            alert("이름을 입력해주세요");
            document.updateForm.custname.focus();
            return false;
        } else if (document.updateForm.phone.value == "") {
            alert("전화번호를 입력해주세요");
            document.updateForm.phone.focus();
            return false;
        } else if (document.updateForm.address.value == "") {
            alert("주소를 입력해주세요");
            document.updateForm.address.focus();
            return false;
        } else if (document.updateForm.joindate.value == "") {
            alert("가입일자를 입력해주세요");
            document.updateForm.joindate.focus();
            return false;
        } else if (document.updateForm.grade.value == "") {
            alert("고객등급을 입력해주세요");
            document.updateForm.grade.focus();
            return false;
        } else if (document.updateForm.city.value == "") {
            alert("도시코드를 입력해주세요");
            document.updateForm.city.focus();
            return false;
        }
        alert("회원정보수정이 완료되었습니다.");
        document.updateForm.submit();
    }
</script>
</html>
