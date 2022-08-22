<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리시스템</title>
</head>
<body>
	<h2>인사관리시스템</h2>
	<button onclick="location.href='findMemberForm.jsp'">
		조회
	</button>
	<button onclick="location.href='saveMemberForm.jsp'">
		사원등록
	</button>
	<button onclick="location.href='updateMemberForm.jsp'">
		정보변경
	</button>
	<button onclick="location.href='deleteMemberForm.jsp'">
		퇴사처리
	</button>
	<button onclick="window.close()">
		종료
	</button>
</body>
</html>