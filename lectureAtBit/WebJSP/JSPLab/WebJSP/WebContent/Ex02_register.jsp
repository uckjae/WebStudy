<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  request.setCharacterEncoding("UTF-8"); 
    //서버쪽 객체를 사용할 수 있다 ...
    //아파치 톰캣 ...웹 전용객체를 제공 ... (request, response ...)
    //new 없이 바로 사용 가능한 객체 : 내장객체 ... 
    //클라이언트가 서버에 전달한 데이터 받기 
    //Ex02_register.jsp?userid=hong&pwd=111&hobby=soccer&hobby=baseball  ..
    
      String uid = request.getParameter("userid"); //단일값 
    String pwd = request.getParameter("pwd"); // 
   // String hobby = request.getParameter("hobby"); //값이 여러개면 안됨 
    String[] hobbys =request.getParameterValues("hobby");  //values 배열의 주소값을 떨어뜨린다 
    //jdbc 코드 가지고 디비 연결하고 insert....
    //hobbys >>주소값이 나온다 
    
    
    //****** 한글 처리 *******
    /* 전송방식 : GET (Tomcat9 한글 문제 없어요 )
       톰캣 9버전 이하라면 ... 
       1. 페이지 상단에 request.setCharacterEncoding("UTF-8");
       2. 서버 쪽에서도 ... server.xml >> 63번째 라인 >> 
       <Connector URIEncoding="UTF=8" connectionTimeout="20000" port="8090" protocol="HTTP/1.1" redirectPort="8443"/>
       
       전송방식 : POST 
       request.setCharacterEncoding("UTF-8"); 
       1. 반드시 데이터 받기 전에 request.setCharacterEncoding 하자 
       
       
       헷갈린다 >> 무조건 받는 페이지 상단에 request.setCharacterEncoding("UTF-8"); 이 코드를 쓰자 ....
       
    */
    %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   
</head>
<body>
입력값 : <%= uid %> <br>
입력값 : <%= pwd %> <br>
당신의 취미는 :

 <% 
    String data = "";
    for(String str : hobbys){
       data += str;
 %> 
 hobby: <%= str %><br>
 <%
    }
 %>
</body>
</html>