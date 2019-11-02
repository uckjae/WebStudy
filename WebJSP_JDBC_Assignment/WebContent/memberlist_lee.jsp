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
		out.print("<script>location.href = 'Ex02_JDBC_Login.jsp'</script>");
	}
%>
<!DOCTYPE html>
<html>

<head>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
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
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id, ip from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
				%>
			<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th colspan="3">회원리스트</th>
							<th id="resultnum"></th>
						</tr>
						<tr>
							<th>아이디</th>
							<th>IP</th>
							<td>삭제</td>
							<td>수정</td>
						</tr>
					</thead>
					<% while(rs.next()){ %>
					<tr>
						<td width="100px" class="counting">
							<a href='Memberdetail.jsp?id=<%=rs.getString("id")%>'><%=rs.getString("id")%></a>
						</td>
						<td width="100px"><%=rs.getString("ip")%></td>
						<td width="5em">
							<a href="MemberDelete.jsp?id=<%=rs.getString("id")%>">[삭제]</a>
						</td>
						<td width="5em">
							<a href="MemberEdit_lee.jsp?id=<%=rs.getString("id")%>">[수정]</a>
						</td>
					</tr>
					<% } %>
				</table>
				
				
				<hr>
				<%	
					}catch(Exception e){
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				%>
				<!-- footer -->
				<jsp:include page="/common/footer_lee.jsp"></jsp:include>
			</div>
		</div>
	</div>
	</div>
  
</body>
<!-- 검색 결과수 보여주는 기능ㄴ -->
<script type="text/javascript">
  	$(function(){
  		//console.log($(".form-control-sm")[1]);
  		$(".form-control-sm").keyup(function() {
  			var num = $("tbody").find(".odd").length+$("tbody").find(".even").length;
  			//console.log(num);
  			if(num==1 && $("tbody").find("td").text()=="No matching records found"){
  				$("#resultnum").html("검색결과 없음 " );
  				//console.log("done!!");
  			}else{
  				$("#resultnum").html("검색결과 : " + num + "건");
  			}
  			
  		});
  	});
  
  </script>

</html>