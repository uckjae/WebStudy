<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%
    //Client 전송한 데이터 받기
    //Ex09_login.jsp?txtuserid=hong&txtpwd=1004
    String userid = request.getParameter("txtuserid");
    String pwd = request.getParameter("txtpwd");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
</head>
<body>
    <h3>당신이 입력한 데이터는</h3>
    ID<%= userid %><br>
    PWD<%= pwd %><br>
</body>
</html>