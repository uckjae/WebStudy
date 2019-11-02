<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*  
	 1.관리자만 접근 가능한 페이지
	 2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
	 3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 
	*/
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href = 'login_lee.jsp'</script>");
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="/common/head_lee.jsp"></jsp:include>
	<title>LogIn Page</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="/common/top_lee.jsp"></jsp:include>

	<div id="wrapper">
		<jsp:include page="/common/left_lee.jsp"></jsp:include>
		<div id="content-wrapper" class="text-align-center">
			<%
				  		String id = request.getParameter("id");
				  
				  		Connection conn = null;
				  		PreparedStatement pstmt = null;
				  		ResultSet rs = null;
				  		
				  		try{
				  			conn = Singleton_Helper.getConnection("oracle");
				  			String sql = "select id,pwd,name,age,gender,email from koreamember where id=?";
				  			pstmt = conn.prepareStatement(sql);
				  			
				  			pstmt.setString(1, id);
				  			
				  			rs = pstmt.executeQuery();
				  			//rs.next(); 추후에 데이터 1건 경우  (while 없이 )
				  			while(rs.next()){
				  %>
			<div class="card-body">
			<h3>회원 정보</h3>
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tr>
						<th style="width:1rem;">아이디</th>
						<td style="width:1rem"><%= rs.getString("id") %></td>
					</tr>
					<tr>
						<th style="width:1rem">비번</th>
						<td style="width:1rem"><%= rs.getString("pwd") %></td>
					</tr>
					<tr>
						<th style="width:1rem">이름</th>
						<td style="width:1rem"><%= rs.getString("name") %></td>
					</tr>
					<tr>
						<th style="width:1rem">나이</th>
						<td style="width:1rem"><%= rs.getString("age") %></td>
					</tr>
					<tr>
						<th style="width:1rem">성별</th>
						<td style="width:1rem"><%= rs.getString("gender") %></td>
					</tr>
					<tr>
						<th style="width:1rem">이메일</th>
						<td style="width:1rem"><%= rs.getString("email") %></td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="memberlist_lee.jsp">목록가기</a>
						</td>
					</tr>
				</table>
				<%				
				  			}
				 
				  		}catch(Exception e){
				  			
				  		}finally{
				  			Singleton_Helper.close(rs);
				  			Singleton_Helper.close(pstmt);
				  		}
				  
				  %>
			</div>
</div>
			<!-- footer -->
			<jsp:include page="/common/footer_lee.jsp"></jsp:include>
		</div>
	</div>

</body>

</html>