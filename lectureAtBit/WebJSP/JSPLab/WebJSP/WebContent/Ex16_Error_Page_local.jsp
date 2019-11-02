<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/commonError.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--  
페이지마다 고유한 에러 페이지 설정
errorPage="/error/commonError.jsp"

그래서 
web.xml
전역으로 설정
-->
<body>
<%
	String data = request.getParameter("name").toLowerCase();
%>
전달받은 내용 : <%= data %>
</body>
</html>