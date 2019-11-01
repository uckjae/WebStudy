<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	//데이터받기
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	
	//확인하기
	out.print(uid+"/"+pwd);
	
	//로직(업무)처리
	//DB연결 > select > 회원테이블 > id(0) > pwd(0)
	//id, pwd 같으면 회원으로
	boolean success = false;
	if(uid.equals(pwd)){//로그인 성공
		//session 변수에 ID 값 담기
		//******~~~~~ session 객체(변수) scope(모든 페이지 접근가능)
		session.setAttribute("memberid", uid);
		success = true;
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
			if(success){
				out.print("<br><b>로그인 성공</b><br>");
				String user = (String)session.getAttribute("memberid");
				out.print(user+"님 로그인되었습니다");
				out.print("<a href='Ex23_Session_Member.jsp'>회원전용</a>");
			}else{
		%>
			<script type="text/javascript">
				alert("다시 로그인해주세요");
				window.history.go(-1);//로그인 페이지로 이동
				//location.href=""가능
			</script>
		<%
		
			}
		%>
</body>
</html>