<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL 출력(서버쪽 자원 ...) <%= 대체
	//EL 사용한다고 해서 JAVA의 객체를 지원하는 것은 아니다
	Date today = new Date();
    request.setAttribute("day", today);
    session.setAttribute("day2", today);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 목적  (출력)</h3>
	<%= request.getAttribute("day") %><br>
	EL:${day}<br>
	EL 습관:${requestScope.day}<br>
	Session EL : ${sessionScope.day2}<br>
</body>
</html>





