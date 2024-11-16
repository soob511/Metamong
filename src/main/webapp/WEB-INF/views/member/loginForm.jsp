<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        
            <div class="col-lg-5 main-area">
                <div class="content-top">
                <img class="main-img" src="${pageContext.request.contextPath}/resources/image/login.png">
                </div>
            </div>

            <div class="col-6 login-area" id="loginForm">
                <div class="login-container">
                    <div class="login-header">
                        <h3>Login to META-MONG</h3>
                    </div>
					
					<form action="${pageContext.request.contextPath}/login" method="post">
	                    <div class="input-group">
	                        <input type="text" class="form-control"  id="mId" name="mId" aria-label="mId" placeholder="USER ID">
	                    </div>
	
	                    <div class="input-group">
	                        <input type="password" class="form-control"  id="mPassword" name="mPassword" aria-label="mPassword" placeholder="********">
	                    </div>
	
	                    <div class="login-actions">
	                        <button type="submit" class="btn btn-login">login</button>
	                    </div>					
					</form>
					<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
						<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials'}">
							<div id="loginAlertMessage"></div>
   						</c:if>
					</c:if>

                    <div class="signup-notice mt-3">
                        <span> <a href="${pageContext.request.contextPath}/member/joinForm">회원가입</a></span>
                        <span> | </span>
                        <span id="modalOpen" data-bs-toggle="modal" data-bs-target="#sqlLoadModal">
							비밀번호 찾기
						</span>
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
						<form id="resetPasswordForm" >
							<div class="table-header">비밀번호 초기화</div>
							<div class="modal-input-group">
		                        <label for="mId" class="input-label">회원 ID</label> 
		                        <input type="text" class="form-control"  id="checkId" name="checkId" aria-label="checkId" placeholder="">
		                    </div>
		                    <span></span>
			               	<div class="modal-input-group">
			                    <label for="mId" class="input-label">전화번호</label>
				               	<input type="text" class="form-control"  id="mTel" name="mTel" aria-label="mTel" placeholder="">
			               	</div>
			               	<span></span>		                    
		                    <div class="modal-input-group">
		                        <label for="mPassword" class="input-label">비밀번호</label> 
		                        <input type="password" class="form-control"  id="newPassword" name="newPassword" aria-label="newPassword" placeholder="" disabled>
		                    </div>
		                    <span class="password-message msg">오류메세지</span>
		                    <div class="modal-input-group">
		                        <label for="mPassword" class="input-label">비밀번호 확인</label> 
		                        <input type="password" class="form-control"  id="checkPassword" name="checkPassword" aria-label="checkPassword" placeholder="" disabled>
		                    </div>
		                    <span class="password-confirm-message msg">오류메세지</span>
		                  	<div class="d-flex justify-content-center">
		                        <button type="button" onclick="resetPassword()" class="modal-btn-submit" disabled>확인</button>		                  	
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
