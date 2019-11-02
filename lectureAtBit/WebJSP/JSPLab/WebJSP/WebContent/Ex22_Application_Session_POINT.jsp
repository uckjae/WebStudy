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
Today POINT
서버자원(WAS.. memory) 활용

application : session
변수[전역]		  변수[개인에게 부여: 접속한 브라우져 마다 :sessioinID]
			  (접속한 사용자에게 부여되는 고유한변수)

사이트 접속 : 전체 접속자수 [1000명]
application.setAttribute("count",0); count 라는 전역변수 생성
사이트 접속하는 모든 session(사용자) 접근 가능

[session]
session.setArrribute("userid","kglim");
접속한 사용자 마다 고유하게 부여되는 변수

A라느 사용자가 웹서버 접속 
서버 session 객체 생성> 식별값(A001) > 클라이언트 브라우저(response)
A001 >> session.setAtrrivute("userid","")		

B라느 사용자가 웹서버 접속 
서버 session 객체 생성> 식별값(B001) > 클라이언트 브라우저(response)
B001 >> session.setAtrrivute("userid","")		

-->
<h3>세션정보</h3>
웹서버가 주여한 고유갑: <%=session.getId() %>
<hr>
<%
	String userid = request.getParameter("userid");
	session.setAttribute("id", userid); //id라는 세션변수
%>
<h3>세션 변수값</h3>
<%
	String id = (String)session.getAttribute("id");
	out.print("당신의 ID는 <b>"+id+"</b>");
%>
</body>
</html>