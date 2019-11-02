<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.한글처리
	request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    
    /*  
    	request객체
    	Tomcat 이 가지고 있는 내장객체
    	[JSP 파일에서는  Default Tomcat 내장 객체를 선언없이 사용가능]
        
    	request 객체 (요청객체)
    	1. 요청 페이지당 한개의    request 객체 생성
    	2. 클라이언트 정보를 서버로 보내기 (request)
    	3. 클라이언트의 정보(IP , 브라우져 버전 , 종류)
    	
    	request 내장 객체는 클라이언트에서 서버로 요청할때 생성되는
    	HttpServletRequest 타입을 갖는 객체가 자동 생성되고 그 주속를 참조하는  request ..
    	
    
    */


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request  객체 함수</title>
</head>
<body>
id:<%=id %><hr>
접속한 클라이언트 IP : <%= request.getRemoteAddr() %> <br>
서버 (요청한방식 : 인코딩) : <%= request.getCharacterEncoding() %><br>
전송방식:<%= request.getMethod() %><br>
포트:<%= request.getServerPort() %><br>
context root(홈 디렉토리, 가상디렉토리 , 웹 경로) :<%=request.getContextPath() %>
<!-- 
request.getContextPath() >>
가상경로(웹에서): /WebJSP
실경로: C:\SmartWeb\WebJSP\JSPLab\WebJSP

http://192.168.0.76:8090/WebJSP/Ex04_request.jsp : 가상경로

http://192.168.0.76:8090/WebJSP/ 가지는 서비스 경로(defalut)
WebContent 폴더를 의미합니다
 -->
 <%=request.getRequestURI() %>
</body>
</html>











