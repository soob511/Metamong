<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/joinForm.css">
</head>
<body>
	<div class="d-flex vh-100">
	
		<div class="flex-fill d-flex flex-column align-items-center left-section">
			<div class="text-white">
				메타 정보 관리 시스템<br>
				META-MONG
			</div>
			<div class="text-white">
				Welcome.<br>
				Start your journey now<br>
				with out META data<br>
				management system!
			</div>
		</div>
	
		<div class="flex-fill d-flex justify-content-center align-items-center flex-column">
			<form>
				<div class="font-size-1" >
					Login<br>
					Sign in to your account
				</div>
				<div>User Name</div>
					<input type="text" class="form-control" placeholder="Username"
						aria-label="Username">

				<div>Password</div>
				<input type="password" class="form-control" placeholder="Password"
						aria-label="Password">
								
					<div class="d-grid gap-2 d-md-block btn-box">
					  <button class="btn btn-primary" type="submit">Button</button>
					</div>
				<div>
					New User?
					<span>Sign up</span>
				</div>
			</form>
		</div>
	
	</div>
</body>
</html>