<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 등록</title>
    <link href="${pageContext.request.contextPath}/resources/css/notice/notice.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
<sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_DBA')">
<div class="container">
    <div class="row">
         <sec:authorize access="hasRole('ROLE_ADMIN') ">
	        <jsp:include page="/WEB-INF/views/common/menuAdmin.jsp" />
	    </sec:authorize>
	    <sec:authorize access="hasRole('ROLE_DBA')">
	     	<sec:authorize access="!hasRole('ROLE_ADMIN')">
	        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
	        </sec:authorize>
	   </sec:authorize>
        <div class="col">
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <div>
                <div class="content">
                    <div class="notice-header">
                        <p class="notice-title">&gt; 공지사항 등록</p>
                    </div>
                    <form id="insertNotice" action="insertNotice" method="post" enctype="multipart/form-data">
                        <table class="table table-container">
                            <tr>
                                <td class="table-light form-label" id="tdth">제목<span class="form-required">(*)</span></td>
                                <td><input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value=""></td>
                            </tr>
                            <tr>
                                <td class="table-light form-label" id="tdth">중요도<span class="form-required">(*)</span></td>
                                <td>
                                    <select class="form-select" id="noticeIsimp" name="noticeIsimp" required style="width:100px;">
                                        <option value="">선택</option>
                                        <option value="0" ${notice.noticeIsimp == null || notice.noticeIsimp == 0 ? 'selected' : ''}>기본</option>
                                        <option value="1" ${notice.noticeIsimp == 1 ? 'selected' : ''}>중요</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="table-light form-label" id="tdth">작성자</td>
                                <td id="author"><span>${member.MId}</span></td>
                            </tr>
                            <input type="hidden" name="MId" id="MId" value="${member.MId}">
                            <tr>
                                <td class="table-light form-label" id="tdth">내용<span class="form-required">(*)</span></td>
                                <td id="noticeContentTd">
                                    <textarea class="form-control" id="noticeContent" name="noticeContent" rows="12"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="table-light form-label" id="tdth">첨부파일</td>
                                <td><input class="form-control" type="file" name="noticeFile" id="noticeFile"></td>
                            </tr>
                        </table>
                        <div class="d-flex justify-content-end mt-3">
                            <a href="noticeList">
                                <button type="button" class="btn-cancel me-2">취소</button>
                            </a>
                            <button type="button" class="btn-add me-2" data-notice-regdate="${notice.noticeRegdate}">등록</button>
                        </div>
                        <input type="hidden" name="noticeRegdate" value="${notice.noticeRegdate}">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</sec:authorize>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<script src="${pageContext.request.contextPath}/resources/js/notice/noticeAddForm.js"></script>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_DBA')">
	<sec:authorize access="!hasRole('ROLE_ADMIN')">
<script src="${pageContext.request.contextPath}/resources/js/notice/noticeDBA.js"></script>
	</sec:authorize>
</sec:authorize>

</body>
</html>