<%@ page import="com.example.test2.model.MemberDAO" %>
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
            background-color: burlywood;
            padding: 20px;
            text-align: center;

        }
    </style>
</head>
<%
    MemberDAO memberDAO = new MemberDAO();
    int custno = memberDAO.getCustNo();
%>
<body>
<%@include file="header.jsp"%>
<%@include file="nav.jsp"%>

<div id="contents">
    <form action="saveMember.jsp" name="saveForm">
        회원번호(자동발생): <input type="text" name="custno" value="<%=custno%>"> <br>
        회원성명: <input type="text" name="custname"> <br>
        회원전화: <input type="text" name="phone"> <br>
        회원주소: <input type="text" name="address"> <br>
        가입일자: <input type="text" name="joindate"> <br>
        고객등급(A:VIP, B:일반, C:직원): <input type="text" name="grade"> <br>
        도시코드: <input type="text" name="city"> <br>
        <input type="button" value="등록" onclick="saveCheck()">
        <input type="button" onclick="location.href='findMember.jsp'" value="조회">
    </form>
</div>

<%@include file="footer.jsp"%>
</body>
<script>
    function saveCheck() {
        if (document.saveForm.custname.value == "") {
            alert("이름을 입력해주세요");
            document.saveForm.custname.focus();
            return false;
        } else if (document.saveForm.phone.value == "") {
            alert("전화번호를 입력해주세요");
            document.saveForm.phone.focus();
            return false;
        } else if (document.saveForm.address.value == "") {
            alert("주소를 입력해주세요");
            document.saveForm.address.focus();
            return false;
        } else if (document.saveForm.joindate.value == "") {
            alert("가입일자를 입력해주세요");
            document.saveForm.joindate.focus();
            return false;
        } else if (document.saveForm.grade.value == "") {
            alert("고객등급을 입력해주세요");
            document.saveForm.grade.focus();
            return false;
        } else if (document.saveForm.city.value == "") {
            alert("도시코드를 입력해주세요");
            document.saveForm.city.focus();
            return false;
        }
        alert("회원등록이 완료되었습니다.");
        document.saveForm.submit();
    }
</script>
</html>
