<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberid = (String)session.getAttribute("memberid");
	boolean loginstate = (memberid==null)?false:true;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원전용 페이지</title>
</head>
<body>
	<%
		if(loginstate){
			out.print(memberid +"님 로그인 상태입니다");
			out.print("당신읜 이 페이지를 볼 수 있습니다");
			out.print("<a href='Ex23_Session_LogOut.jsp'>로그아웃</a>");
		}else{
			out.print("<script> alert('넌 누구냐') </script>");
			out.print("<script> location.href='Ex23_Session_Login.jsp'; </script>");
		}
	
	%>
</body>
</html>