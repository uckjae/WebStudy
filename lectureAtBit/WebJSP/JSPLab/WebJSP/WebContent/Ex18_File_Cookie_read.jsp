<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>파일 쿠키 read</h3>
<%
//클라이언트 브라우져가 가지고 있는 (내 DOMAIN) 가져오기
	Cookie[] cs =  request.getCookies();
	if(cs.length>0 || cs!=null){
		for(Cookie c : cs){
			out.print(c.getName() + "<br>");
			out.print(c.getValue() +"<br>");
			//out.print( c.getmaxAge() +"<br>");
			out.print( c.getDomain());
		}
	}

%>
</body>
</html>