<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //스크립트 릿(java code 작성 영역)
	Date day = new Date();
	/*
		JSP 페이지 : UI > html + css + javascript 코드   + 
                   Server code (JDBC) > java 코드 <% 안에서 구현...
                   >> 디자인 코드 + 서버 로직 코드 (좋은 방식은 아님) 
                   >> [ 결론  ]
                   >> servlet (Java Web을 구현하는 page)
                   >> UI > jsp
                   >> MVC (model(java) :  view(jsp)  : controller(servlet))
                   >> 잘하는 것만 해 .... model2  기반의  MVC패턴
                   
                   >> JSP 와  html 차이점
                   >> tomcat(WAS)(웹 서버) 이유 : Web service 
                   >> 1. html 로만 구성  : web server 만 필요 (요청을 받아서 전달)
                   >> 2. jsp 로 구성 : WAS 를 통해서 컴파일 >> 변환 >> 전달
                   >> 192.168.0.3:8090/WebJSP/Ex01_Basic.jsp  요청을 보내면
                   >> WAS(jsp) -> compile(class 생성) -> 결과(정적(디자인된 코드) + 동적(java 코드 변환 )) -> Client 전달
                   >> 컴파일된 코드 확인하기
                   >> C:\SmartWeb\WebJSP\JSPLab\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\WebJSP\org\apache\jsp
                   
                   JSP 구성 요소
                   1. 선언부 (JSP 페이지에 대한 기본 설정 세팅)
                   ex) page 지시자 >> 사용언어 , 인코딩 , import 자원

				   2. 스크립트 요소
				   2.1  스크립트 릿 : <% ... java code  구현...
				   2.2 표현식 (출력방법):(출력대상 : client 웹 브라우져)  <%=
				   2.3 선언부 (공통적인 자원(scope page) : 공통함수 ) <%!	
	
	*/
%>
<%!
    //java code (공통함수)
    public int add(int i , int j){
	   return i+j;
    }

%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
	String str = "hong";
%>
<%= str %><br>
<%= day %>
<%
	int result = add(100,200);
%>
<hr>
당신이 호출한 add 함수 결과는 : <%= result %>
</body>
</html>






