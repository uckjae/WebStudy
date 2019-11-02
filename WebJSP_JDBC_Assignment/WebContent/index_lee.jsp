<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/head_lee.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body id="page-top">
	<!-- header -->
	<jsp:include page="/common/top_lee.jsp"></jsp:include>
	
	<div id="wrapper">
		<jsp:include page="/common/left_lee.jsp"></jsp:include>
		<div id="content-wrapper" class="text-align-center">
			<!-- MAIN PAGE CONTENT  -->
			<div class="card-body">
			<%
				String id=null;
				id = (String)session.getAttribute("userid");
				if(id!=null){
					//회원
					out.print(id+"회원님 방가방가^^<br>");
					if(id.equals("admin")){
						out.print("<a href='memberlist_lee.jsp'>회원관리페이지</a>");
					}
				}else{
					//로그인 하지 않은 사용자
					//메인 페이지는 회원만 볼  수 있어요(강제 링크 추가)
					out.print("사이트 방문을 환영합니다^^ <br>회원가입 좀 하지...");
				}
			%>
			</div>
			<!-- footer -->
			<jsp:include page="/common/footer_lee.jsp"></jsp:include>	
		</div>
	</div>
</body>
</html>