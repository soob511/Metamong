<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/common/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/member/joinForm.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/js/member/joinForm.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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
                <div class="d-flex flex-column justify-content-center align-items-center join-container">
                    <div class="col-12 text-center mb-4">
                        <h1>Sign Up</h1>
                    </div>
                    <div class="col-12 d-flex flex-column align-items-center">
                        <div class="id-box">
                            <div class="input-group">
                                <label for="mId" class="input-label">아이디</label>
                                <input type="text" class="form-control" placeholder="예) oti123" id="MId" aria-label="mId" aria-describedby="mId">
                                <button class="btn-confirm" type="submit">중복확인</button>
                            </div>
                            <span class="username-message msg">오류메세지</span>
                        </div>
                        <div class="id-box">
                            <div class="input-group">
                                <label for="mPassword" class="input-label">비밀번호</label>
                                <input type="password" class="form-control" placeholder="영문, 숫자 조합 8~16자" id="MPassword" aria-label="mPassword" aria-describedby="mPassword">
                            </div>
                            <span class="password-message msg">오류메세지</span>
                        </div>
                        <div class="pw-box">
                            <div class="input-group">
                                <label for="MPasswordConfirm" class="input-label">비밀번호 확인</label>
                                <input type="password" class="form-control" placeholder="비밀번호 재입력" id="MPasswordConfirm" aria-label="MPasswordConfirm" aria-describedby="MPasswordConfirm" required>
                            </div>
                            <span class="password-confirm-message msg">오류메세지</span>
                        </div>
                        <div class="input-group name-box">
                            <label for="mName" class="input-label">이름</label>
                            <input type="text" class="form-control" placeholder="예) 홍길동" id="MName" aria-label="mName" aria-describedby="mName">
                        </div>
                        <div class="input-group">
                            <label for="mTeam" class="input-label">소속</label>
                            <select class="form-select" id="teamId" aria-label="team_Id" aria-describedby="mTeam">
                                <option selected>소속을 선택하세요</option>
                                <option value="1">개발1팀</option>
                                <option value="2">개발2팀</option>
                                <option value="3">개발3팀</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <label for="mEmpId" class="input-label">사번</label>
                            <input type="text" class="form-control" placeholder="예) 123456" id="MEmpId" aria-label="mEmpId" aria-describedby="mEmpId">
                        </div>
                        <div class="input-group">
                            <label for="mPhone" class="input-label">연락처</label>
                            <input type="text" class="form-control" placeholder="예) 010-1234-5678" id="MTel" aria-label="mPhone" aria-describedby="mPhone">
                        </div>
                        <div class="input-group">
                            <label for="mRole" class="input-label">계정 권한</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="MRole" id="roleUser" value="User" checked>
                                <label class="form-check-label" for="roleUser">User</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="MRole" id="roleDBA" value="DBA">
                                <label class="form-check-label" for="roleDBA">DBA</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 text-center mt-3">
                        <button id="btn-signup" type="button" class="btn-join btn-lg" disabled>Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/member/joinForm.js"></script>
</body>
</html>