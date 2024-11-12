<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/loginForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/passwordModal.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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
					<form action="${pageContext.request.contextPath}/login" method="post">
	                    <div class="input-group">
	                        <label for="mId" class="input-label">UserName</label> 
	                        <input type="text" class="form-control"  id="mId" name="mId" aria-label="mId">
	                    </div>
	
	                    <div class="input-group">
	                        <label for="mPassword" class="input-label">Password</label> 
	                        <input type="password" class="form-control"  id="mPassword" name="mPassword" aria-label="mPassword">
	                    </div>
	
	                    <div class="login-actions">
	                        <button type="submit" class="btn btn-login">Login</button>
	                    </div>					
					</form>

                    <div class="signup-notice mt-3">
                        <p>New User? <a href="${pageContext.request.contextPath}/member/joinForm">Sign up</a></p>
                    </div>
                    <div class="signup-notice mt-3">
                        <p id="modalOpen" data-bs-toggle="modal" data-bs-target="#sqlLoadModal">
							Forgot Password?
						</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="sqlLoadModal" tabindex="-1"
		aria-labelledby="sqlLoadModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="modalClose"></button>
				</div>
				<div class="modal-body">
					<div class="table-container d-flex justify-content-center">
						<form action="${pageContext.request.contextPath}/member/resetUserPassword" method="post">
							<div class="table-header">Reset Your Password</div>
							<div class="modal-input-group">
		                        <label for="mId" class="input-label">UserName</label> 
		                        <input type="text" class="form-control"  id="mName" name="mName" aria-label="mName" placeholder="">
		                    </div>
			               	<div class="modal-input-group">
			                    <label for="mId" class="input-label">PhoneNumber</label>
				               	<input type="text" class="form-control"  id="mTel" name="mTel" aria-label="mTel" placeholder="">
			               	</div>		                    
		                    <div class="modal-input-group">
		                        <label for="mPassword" class="input-label">Password</label> 
		                        <input type="password" class="form-control"  id="newPassword" name="newPassword" aria-label="newPassword" placeholder="" disabled>
		                    </div>
		                    <div class="modal-input-group">
		                        <label for="mPassword" class="input-label">ConfirmPassword</label> 
		                        <input type="password" class="form-control"  id="checkPassword" name="checkPassword" aria-label="checkPassword" placeholder="" disabled>
		                    </div>
		                  	<div class="d-flex justify-content-center">
		                        <button type="submit" class="modal-btn-submit">Confirm</button>		                  	
		                  	</div>
							<button type="button" onclick="checkValidUser()" class="modal-btn-check">Check</button>			               	
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/member/loginForm.js"></script>
</body>
</html>
