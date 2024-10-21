<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
<link	href="${pageContext.request.contextPath}/resources/css/common/style.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/member/joinForm.css"
	rel="stylesheet" />
</head>
<body>

	<div class="container">
		<div class="row">

			<div class="menu">
				<p class="logo">
					<a href="${pageContext.request.contextPath}/">@meta-mong</a>
				</p>
			</div>
			
			<div class="col">
				<div
					class="d-flex flex-column justify-content-center align-items-center join-container">

					<div class="col-12 text-center mb-4">
						<h1>Sign Up</h1>
					</div>

					<div class="col-12 d-flex flex-column align-items-center">
						<div class="input-group">
							<label for="mId" class="input-label">아이디</label> <input
								type="text" class="form-control" placeholder="예) oti123"
								id="mId" aria-label="mId" aria-describedby="mId">
							<button class="btn-confirm" type="submit">중복확인</button>
						</div>
						<div class="input-group">
							<label for="mPassword" class="input-label">비밀번호</label> <input
								type="password" class="form-control"
								placeholder="영문, 숫자 조합 8~16자" id="mPassword"
								aria-label="mPassword" aria-describedby="mPassword">
						</div>
						<div class="input-group">
							<label for="mPasswordConfirm" class="input-label">비밀번호 확인</label>
							<input type="password" class="form-control"
								placeholder="비밀번호 재입력" id="mPasswordConfirm"
								aria-label="mPasswordConfirm"
								aria-describedby="mPasswordConfirm">
						</div>
						<div class="input-group">
							<label for="mName" class="input-label">이름</label> <input
								type="text" class="form-control" placeholder="예) 홍길동" id="mName"
								aria-label="mName" aria-describedby="mName">
						</div>
						<div class="input-group">
							<label for="mTeam" class="input-label">소속</label> <select
								class="form-select" id="mTeam" aria-label="mTeam"
								aria-describedby="mTeam">
								<option selected>소속을 선택하세요</option>
								<option value="개발1팀">개발1팀</option>
								<option value="개발2팀">개발2팀</option>
								<option value="개발3팀">개발3팀</option>
							</select>
						</div>

						<div class="input-group">
							<label for="mEmpId" class="input-label">사번</label> <input
								type="text" class="form-control" placeholder="예) 123456"
								id="mEmpId" aria-label="mEmpId" aria-describedby="mEmpId">
						</div>
						<div class="input-group">
							<label for="mPhone" class="input-label">연락처</label> <input
								type="text" class="form-control" placeholder="예) 010-1234-5678"
								id="mPhone" aria-label="mPhone" aria-describedby="mPhone">
						</div>
						<div class="input-group">
							<label for="mRole" class="input-label">계정 권한</label>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="accountRole"
									id="roleUser" value="User" checked> <label
									class="form-check-label" for="roleUser">User</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="accountRole"
									id="roleDBA" value="DBA"> <label
									class="form-check-label" for="roleDBA">DBA</label>
							</div>
						</div>
					</div>

					<div class="col-12 text-center mt-4">
						<button type="button" class="btn-join btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
