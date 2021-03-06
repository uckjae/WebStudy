<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
요청에대한 흐름제어

include
forward

공통점 : request 객체를 공유한다
차이점 : include 제에권을 가지고 있다
	  forward 제어권을 넘겨준다(POINT : 요청 주소는 동일한데 다른 페이지의 내용을 서비스한다)
	  Why? 처음 요청했던 주소의 buffer 그대로 사용
	  localhost:8090/WebJSP/login.jsp... forward (A.jsp)
	    담는 그릇은 login.jsp 그릇에 담기는 내용은 A.jps, B.jsp, C.jsp
	  
	  
*/
String code = request.getParameter("code");
String viewURI = null;
	if(code.equals("A")){
		viewURI = "/forward/A.jsp";
	}
	else if(code.equals("B")){
		viewURI = "/forward/B.jsp";
	}
	else if(code.equals("C")){
		viewURI = "/forward/C.jsp";
	}

%>
<jsp:forward page="<%=viewURI %>"></jsp:forward>
<!-- 아래 코드의 실행여부는?? -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
나는 FORWARD 페이지 입니다.
</body>
</html>