<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="content-type" content_type="text/html">
	<jsp:include page="/common/head_lee.jsp"></jsp:include>
	<title>LogIn Page</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="/common/top_lee.jsp"></jsp:include>

	<div id="wrapper">
		<jsp:include page="/common/left_lee.jsp"></jsp:include>
		<div class="container" style="text-align: center; padding-top: 2em;">Login
		<div id="content-wrapper" class="text-align-center">
			<form action="loginOk_lee.jsp">
				<div class="form-group">
					<div class="form-label-group">
						<input type="text" name="id" id="id" class="form-control" placeholder="ID"
							required="required" >
						<label for="id">ID</label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-label-group">
						<input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password"
							required="required">
						<label for="pwd">Password</label>
					</div>
				</div>
				
				<input class="btn btn-primary btn-block" type="submit" value="Login"> 
			</form>
			<div class="text-center">
				<a class="d-block small mt-3" href="register.html">Register an Account</a>
				<a class="d-block small" href="forgot-password.html">Forgot Password?</a>
			</div>
			</div>
			<!-- footer -->
			<jsp:include page="/common/footer_lee.jsp"></jsp:include>
		</div>
	</div>

</body>

</html>