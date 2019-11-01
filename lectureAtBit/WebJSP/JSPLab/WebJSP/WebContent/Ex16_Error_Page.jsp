<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 
404 : 요청 페이지가 없는 경우
500 : 서버쪽 코드 문제 : 0으로 나누거나 , null 처리 강제 ..

web.xml 파일에 ...
 -->
<body>
<%
	String data = request.getParameter("name").toLowerCase();
%>
전달받은 내용 : <%= data %>
</body>
</html>