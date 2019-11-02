<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
1. 메모리쿠키(브라우저 쿠키) : Client 강제적으로 지우지 않으면 없어 지지 않음, 브라우저를 닫기 전까지 , 강제로 소멸타임 : -1 부여
2. 파일쿠키(소멸시간을 가지고 있다) : Client가 강제로 지우지 않는한, 정해진 시간이 되지 않는한
	setMaxage(60) 60초
	30일:(30*24*60*60) 일*시*분*초
 -->
 <%
 	Cookie co = new Cookie("bit","hong");
 	co.setMaxAge(60);
 	response.addCookie(co);
 %>


</body>
</html>