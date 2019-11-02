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
	<script type="text/javascript">
 //jquery 로 간단하게 유효성 check 하기
 $(function() {
  	$('#joinForm').submit(function() {
	   //alert("가입");
	if ($('#id').val() == "") { // 아이디 검사
    	alert('ID를 입력해 주세요.');
    	$('#id').focus();
    return false;
   } else if ($('#pwd').val() == "") { // 비밀번호 검사
    alert('PWD를 입력해 주세요.');
    $('#pwd').focus();
    return false;
   }else if ($('#mname').val() == "") { // 이름 검사
    alert('mname를 입력해 주세요.');
    $('#mname').focus();
    return false;
   }else if ($('#age').val() == "") { // 나이 검사
    alert('age를 입력해 주세요.');
    $('#age').focus();
    return false;
   }else if ($('#email').val() == "") { // 우편번호
    alert('email를 입력해 주세요.');
    $('#email').focus();
    return false;
   }
   
  });
 });
</script>
</head>

<body>
	<!-- header -->
	<jsp:include page="/common/top_lee.jsp"></jsp:include>

	<div id="wrapper">
		<jsp:include page="/common/left_lee.jsp"></jsp:include>
		<div class="container">
			<div id="content-wrapper" class="text-align-center">
				<form action="JoinOk.jsp" method="post" name="joinForm" id="joinForm">
					<div class="form-group">

						<div class="form-label-group" style="padding-left: 0.3em">
							<input type="text" id="id" name="id" class="form-control" placeholder="ID"
								required="required" autofocus="autofocus">
							<label for="id">ID</label>
						</div>

					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" id="pwd" name="pwd" class="form-control" placeholder="PassWord"
								required="required">
							<label for="password">PassWord</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" id="mname" name="mname" class="form-control" placeholder="Name"
										required="required">
									<label for="mname">Name</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" id="age" name="age" class="form-control"
										placeholder="Age" required="required">
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
										checked>여자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender"
										id="gender" value="남">남자
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-label-group">
									<input type="text" id="email" name="email" class="form-control"
										placeholder="Email" required="required">
									
									<label for="email">Email</label>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div style="text-align: center;">
				<input type="submit" class="btn btn-primary" value="Register" style="width: 80%; text-align: center;">
				<input type="reset" class="" value="Cancle" style="width: 80%; text-align: center;">
			</div>
			</form>
			<!-- footer -->
			<jsp:include page="/common/footer_lee.jsp"></jsp:include>
		</div>
	</div>
	</div>

</body>

</html>