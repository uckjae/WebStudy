<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//요구사항 : UID 쿠키가 존재하면 input type = text name=uid value값에 cookie 보여주고 싶어요
String userid="";
Cookie[] cookies = request.getCookies();
if(cookies ==null){
	response.sendRedirect("Ex19_Login.jsp");
}else{
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("UID")){
			userid = cookies[i].getValue();
		}
		
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*주의사항 : 문자열 처리하기*/
var userdata = "<%=userid%>";
console.log(userdata);
</script>
</head>
<body>
	<form action="Ex20_LoginOk.jsp" method="get">
		ID:<input type="text" name="uid" value="<%=userid %>"><br>
		PWD:<input type="password" name="pwd"><br>
		<hr>
		ID값 유지하기<input type="checkbox" name="chk">
		<hr>
		<input type="submit" value="로그인"> 
		<input type="reset" value="취소"> 
	</form>
</body>
</html>