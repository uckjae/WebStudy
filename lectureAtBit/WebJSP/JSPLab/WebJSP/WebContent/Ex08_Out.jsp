<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체(WAS가 기지고 있는...):out</title>
</head>
<body>
	<%
		boolean b = true;
		if(10>5){
	%>
		IF(true):<font color="red"><%=b %></font>
	<%		
		}else{
			b = false;
	%>
		IF(false):<font color="blue"><%=b %></font>
	
	<% 
		}
	
	%>
	<h3>out 객체(서버코드작업이 편해요 : UI 작업이 불편해요)</h3>
	<%
		boolean b2 = true;
	if(10>5){
		out.print("IF(true):<font color='red'>" + b2 +"</font>");
	}else{
		out.print("IF(false):<font color='blue'>" + b2 +"</font>");
	}
	%>

</body>
</html>