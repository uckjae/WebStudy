<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	Emp e = new Emp();
	e.setEmpno(2000);
	e.setEname("bituser");
	
	HashMap<String,String> hp = new HashMap<>();
	hp.put("data", "1004");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
기존방식 :<%= e %><br>
기존방식 :<%= e.getEmpno() %><br>
기존방식 :<%= e.getEname() %><br>

<h3>EL(출력)</h3>
자바객체 출력하기(객체에 대한 직접접근 불가):${e}<br>
자바객체 속성 출력하기 : ${e.getEmpno()}<br>

1. JSTL (core) : 변수생성 , 제어문 <br>
<c:set var="m" value="<%=e%>" />
JSTL을 사용해서 변수 m을 생성 (e객체의 주소값) : ${m}<br>
<hr>
EL 출력 : JSTL 변수값을 출력 : ${m}<br>
EL 출력 : JSTL 변수(가능 : 잘안써요): ${m.getEmpno()}<br>
EL 출력 : JSTL 변수 (자동으로 : getter함수 호출)(member field 명): ${m.empno}<br>
EL 출력 : JSTL 변수 (자동으로 : getter함수 호출)(member field 명): ${m.ename}<br>
<hr>
<h3>EL & JSTL 사용하기</h3>
****EL 을 통해서 JAVA객체에 대한 직접 접근 불가****<br>
****JSTL set 구문을 사용해서 변수 생성<br>
request, session 객체에 담긴 변수는 접근 가능<br>
requestScope , sessionScope <br>
JSTL 변수의 value 값으로 (EL표현식)사용가능 <br>
<c:set var="username" value="${m.ename}" />
변수값 출력 :${username}<br>

<hr>
<h3>JSTL 변수 만들고 Scope 정의하기</h3>
	<c:set var="job" value="농구선수" scope="request" />
	당신의 직업은:${job}<br>
	만약에 당신이 [include][forward]한 페이지가 있다면 그 페이서 job변수 사용가능하다
<hr>	
<c:set var="job2" value="야구선수" scope="request" />
값 출력<br>
${job2}<br>
변수 삭제 기능<br>
<c:remove var="job2"/>
job2 변수 삭제:${job2}<br>

<c:set var="vhp" value="<%=hp%>" />
hp객체: ${vhp}<br>
hp객체: ${vhp.data}<br>
<!--  
hp.put("color","red");
-->
<c:set target="${vhp}" property="color" value="red" />
hp객체: ${vhp}<br>
</body>

</html>






