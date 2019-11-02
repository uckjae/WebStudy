<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.bit.Emp" %>
<%
	Emp e = new Emp();
	e.setEmpno(1000);
	e.setName("홍길동");
	
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int date = cal.get(Calendar.DATE);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
출력표현식<br>
사번:<%=e.getEmpno() %><br>
이름:<%=e.getName() %><br>
전체:<%=e.toString() %><br>
<hr>
현재날짜:<%=year %>년 <%=month %>월 <%=date %>일
</body>
</html>