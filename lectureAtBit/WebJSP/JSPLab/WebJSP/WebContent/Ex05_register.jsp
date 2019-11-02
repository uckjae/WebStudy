<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//1. request 객체(클라이언트 입력한값)
	//input > text, password, radio, textarea, select
	//input > checkbox, select(multiple)
	//넘어오는 갓이 : 단일값, 다중값
	
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("pwd");
	
	//다중값
	//<input checkbox name="hobby"...여러개
	//?hobby=a&hobby=b&hobby
	String[] hobbys = request.getParameterValues("hobby");
	
	for(String str:hobbys){
		//출력
	}
	Enumeration<String> e = request.getParameterNames();
	String name="";
	while(e.hasMoreElements()){
		name+="/"+e.nextElement();
	}
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
userid:<%=userid %>
userpwd:<%=userpwd %>
<%
	for(String str:hobbys)
%>
	취미:<% %>
</body>
</html>