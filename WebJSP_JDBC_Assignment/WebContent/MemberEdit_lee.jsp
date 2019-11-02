<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	회원정보 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=?
	 1.2 : update koreamember set ename=? where id=?		 
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	      <input type="text" value="rs.getString(id)">
	      수정안하고 .. 화면 .. 전송(x) : <td>rs.getString("id")</td>
	      수정안하고 .. 화면 .. 전송   : <input type="text" value="rs.getString(id)" readonly>
	      수정하고 ..화면  ..전송   :  <input type="text" value="rs.getString(id)">
	
	*/
    request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='login_lee.jsp'</script>");
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id,pwd,name,age,trim(gender),email from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery(); 
		
		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건
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
		<div class="container">
			<div id="content-wrapper" class="text-align-center">
				<form action="MemberEditOk.jsp" method="post" name="editForm" id="editForm">
					<div class="form-group">

						<div class="form-label-group" style="padding-left: 0.3em">
							<input type="text" id="id" name="id" class="form-control" value="<%=rs.getString(1)%>"
								required="required" readonly>
							<label for="id">ID</label>
						</div>

					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" id="pwd" name="pwd" class="form-control" value="<%= rs.getString(2) %>"
								>
							<label for="password">PassWord</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString(4)%>"
										>
									<label for="name">Name</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" id="age" name="age" class="form-control"
										value="<%=rs.getString(4)%>">
									<label for="age">Age</label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<div class="breadcrumb">
										
									<input type="radio" name="gender" id="gender" value="여" 
									<%if (rs.getString(5).equals("여")){ %>checked<%}%>>여자
									<input type="radio" name="gender" id="gender" value="남"
									<%if (rs.getString(5).equals("남")){ %>checked<%}%>>남자
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" id="email" name="email" class="form-control"
										value="<%=rs.getString(6)%>">
									
									<label for="email">Email</label>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div style="text-align: center;">
				<input type="submit" class="btn btn-primary" value="수정하기" style="width: 13%;">
				<a href="memberlist_lee"><button class="btn btn-primary">리스트로</button></a>
			</div>
			</form>
			<!-- footer -->
			<jsp:include page="/common/footer_lee.jsp"></jsp:include>
		</div>
	</div>
	</div>

</body>
</html>
<%
	}catch(Exception e){
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}

%>