<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/loginForm.css">
</head>
<body>
	<div class="container-fluid login-page">
		<div class="row">

			<div class="col-lg-6 main-area">
				<div class="content-top">
					<p class="main-subtitle">메타 정보 관리 시스템</p>
					<h1 class="main-title">META-MONG</h1>
				</div>

				<div class="content-bottom">
					<div class="main-paragraph">
						<p>Welcome.</p>
						<p>Start your journey now</p>
						<p>with our META data</p>
						<p>management system!</p>
					</div>
				</div>
			</div>

			<div class="col-6 login-area" id="loginForm">
				<div class="login-container">
					<div class="login-header">
						<h1>Login</h1>
						<p>Sign in to your account</p>
					</div>

					<div class="input-group">
						<label for="mId" class="input-label">UserName</label> <input
							type="text" class="form-control" id="mId" aria-label="mId">
					</div>

					<div class="input-group">
						<label for="mPassword" class="input-label">Password</label> <input
							type="password" class="form-control" id="mPassword"
							aria-label="mPassword">
					</div>

					<div class="login-actions">
						<a href="${pageContext.request.contextPath}/homeUser">
							<button type="button" class="btn btn-login">Login</button>
						</a>
					</div>

					<div class="signup-notice mt-3">
						<p>
							New User? <a
								href="${pageContext.request.contextPath}/member/joinForm">Sign
								up</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
