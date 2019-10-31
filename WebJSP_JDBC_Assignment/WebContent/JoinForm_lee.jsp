<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="container"></div>
		<div id="content-wrapper" class="text-align-center">
			<form>
          <div class="form-group">
            <div class="form-row">
              <div class="form-label-group">
                  <input type="text" id="id" class="form-control" placeholder="ID" required="required" autofocus="autofocus">
                  <label for="firstName">ID</label>
              </div>
              
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required">
              <label for="inputEmail">Email address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
                  <label for="inputPassword">Password</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required">
                  <label for="confirmPassword">Confirm password</label>
                </div>
              </div>
            </div>
          </div>
          <a class="btn btn-primary btn-block" href="login.html">Register</a>
        </form>
		<!-- footer -->
			<jsp:include page="/common/footer_lee.jsp"></jsp:include>
		</div></div>
	</div>

</body>
</html>