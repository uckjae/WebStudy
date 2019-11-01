<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//login.html -> submit -> Ex01_Basic.jsp (요청을 받는 ..)
	String id = request.getParameter("userid");
	
	//include , forward 
	request.setAttribute("name", "korea");
	session.setAttribute("user", "bit");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
	EL(표현식) : JSP 페이지에서 사용하는 스크립트 언어 (화면 출력)
	이유 : 스파게티 (% 와 html 혼재되는 코드)  : 유지보수 , 코드의 해석(가독성)
	         문제를 개선하기 위해서 script 기반의 EL & JSTL 생성 (JSP 페이지에서만 사용가능)
	EL : JSP 페이지에서 화면 출력 목적 (% 녀석없이 server 자원 출력)
	
	EL 이 가지는 기본객체
	paramValues  :  요청 파라미터의 <파라미터이름, 값배열> 매핑을 저장한 Map 객체
	param        :  요청 파라미터의 <파라미터이름, 값> 매핑을 저장한 Map 객체
	requestScope :  request 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체
	sessionScope :  session 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체
	applicationScope : application 기본 객체에 저장된 속성의 <속성,값> 매핑을 저장한 Map 객체
 -->
스크립트릿:<b><%=id%></b><br>
스크립트릿:<%= request.getAttribute("name") %><br>
스크립트릿:<%= session.getAttribute("user") %><br>
<hr>
EL request value : ${requestScope.name}<br>
EL request value (생략 :requestScope): ${name}<br>
EL session value(생략 :sessionScope) : ${user}<br> 
EL session value: ${sessionScope.user}<br> 
<hr>
기존 :<%= request.getParameter("userid")%><br>
EL request parameter : ${param.userid}<br> 

<h3>EL 기본 문법</h3>
<b>EL 표현식(출력)</b><br>
스크립트 릿 <%= 200+400 %><br>
EL:${200+300}<br>
EL:${"1" + 1}<br><!--  문자형 숫자 (자동 형변환) 연산 -->
EL:${1==1}<br><!-- 논리연산 제공 true ,false -->
EL:${!true}<br>
EL:${empty x}<br><!-- x라는 값이 비어있니  -->
<%-- EL:${null +1} --%><br><!-- null 값을 0 변환 연산 -->
</body>
</html>











