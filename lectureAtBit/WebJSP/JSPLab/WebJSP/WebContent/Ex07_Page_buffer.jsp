<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="true"%>
<!-- 
페이지에 어떠한 설정도 하지 않으면 buffer="8kb" autoFlush="true"

Page에 더이상 실행할 자원이 없으면 자동 : flush
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(int i=0; i<10;i++){
		out.print("<b>"+i+"</b><br>");
	}

%>
</body>
</html>