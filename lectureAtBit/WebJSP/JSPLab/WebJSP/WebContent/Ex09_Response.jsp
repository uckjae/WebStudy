    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <title>Response</title>
        </head>
        <body>
        <!--
        Client -> Server
        요청(Request)

        Server -> Client
        응답(Response)

        Tomcat(Javax...)


        response
        1. 출력(표현식)
        2. 페이지 이동처리(sendRedirext)

        :javascripㅅ: 페이지 이동 : loactions.href-"Ex02_Basic.jsp"
        :**페이지 서버 재요청 주소창에 엔터,F5 **

        :java : response.sendRedirect("Ex01_Basic.jsp")===locations.href="Ex01_Basic.jsp"
        -->
            1.일반적인 사용(=출력) : <%= 100+200+300 %><br>
            2.sendRedirect : response객체의 함수(클라이언트 서버에게 페이지를 재요청)
            <%
                    response.sendRedirect("Ex01_Basic.jsp");// 페이지에 대한 재요청
            %>

        </body>
        <!-- 
        	response.sendRedirect 작성 javascript
         -->
         <script type="text/javascript">
         	location.herf="Ex01_Baisc.jsp";
         </script>
        </html>