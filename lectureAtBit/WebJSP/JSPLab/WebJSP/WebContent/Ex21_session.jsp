<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
session: 브라우저(접속한 사용자) 마다 서버에서 부여하는 고유한 객체

session 값: 웹 서버가 접속한 클아이언트(브라우저)에게 부여하는 고유한 ID 값(식별값)

A라는 사용자가 > 웹서버에 접속 > session 객체 생성 > 고유한 ID 값을 만들고 > ID 값을 Client response
자동으로...
JSESSIONID : FC5DB0FDD579268F37ADAAA74E6FD55B

동기화 작업(로그인, 로그아웃,정보)
처음 접속한 시간
마지막 접속한 시간
 -->
 <%
 	Date time = new Date();
 	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 %>
 <h3>세션정보</h3>
 session객체의 식별값: <%=session.getId() %>
 <hr>
 <%
 	time.setTime(session.getCreationTime());
 %>
 [session 생성된시간] : <%=formatter.format(time) %>
 <hr>
 <%
 	time.setTime(session.getLastAccessedTime());
 %>
  [session 마지막접속시간] : <%=formatter.format(time) %>
</body>
</html>