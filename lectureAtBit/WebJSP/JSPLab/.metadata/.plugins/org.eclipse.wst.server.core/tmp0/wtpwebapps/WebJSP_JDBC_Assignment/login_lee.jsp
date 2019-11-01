<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/head.jsp"></jsp:include>
<title>LogIn Page</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="/common/top_lee.jsp"></jsp:include>
	
	<div id="wrapper">
		<jsp:include page="/common/left_lee.jsp"></jsp:include>
		<div id="content-wrapper" class="text-align-center">
			<div class="container">
				<form>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
              <label for="inputEmail">Email address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">Password</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                Remember Password
              </label>
            </div>
          </div>
          <a class="btn btn-primary btn-block" href="index.html">Login</a>
        </form>
			
			</div>		
		</div>
	</div>

</body>
</html>