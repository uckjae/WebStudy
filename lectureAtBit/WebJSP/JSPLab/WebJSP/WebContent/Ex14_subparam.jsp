<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>Ex14_include_param_Main.jsp : request 객체 공유</h3>
<fieldset>
	<legend>
		INCLUDE
	</legend>
	request : <%= request.getParameter("type") %><br>
	request : <%= request.getParameter("userid") %><br>
	<h3>main 페이지에서 param 액션태그로 전달된 값</h3>
	<%
		String h = request.getParameter("hobby");
		String p = request.getParameter("pwd");
		out.print("비번 : " + p + "<br>");
		if(h.equals("basketball")){
			out.print("<i>당신의 취미는" + h + "입니다</i>");
		}else{
			out.print("<i>당신은 취미가 없네요</i>");
		}
		
		
	%>
	
</fieldset>