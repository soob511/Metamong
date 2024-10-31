<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link href="${pageContext.request.contextPath}/resources/css/notice/notice.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <jsp:include page="/WEB-INF/views/common/menuAdmin.jsp" />
        <div class="col-10">
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <div>
                <div class="content">
                    <h4 class="fw-bold notice-title">> 공지사항 상세</h4>
                    <table class="table table-bordered">
                        <tr>
                            <td class="table-primary">제목<span class="form-required">(*)</span></td>
                            <td id="table-contents" colspan="5">${notice.noticeTitle}</td>
                        </tr>
                        <tr>
                            <td class="table-primary">작성자</td>
                            <td id="table-contents" style="width:20%">관리자</td>
                            <td class="table-primary" style="width:16.66%">작성일자</td>
                            <td id="table-contents" style="width:16.66%"><fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd"/></td>
                            <td class="table-primary" style="width:16.66%">조회수</td>
                            <td id="table-contents" style="width:16.66%">${notice.noticeHitcount}</td>
                        </tr>
                        <c:if test=${notice.noticeFilename != null}>
                        <tr>
                            <td class="table-primary">첨부파일</td>
                            <td id="table-contents" colspan="5"><a href="fileDownload?noticeId=${notice.noticeId}" style="color:blue;">${notice.noticeFilename}</a></td>
                        </tr>
                        </c:if>
                        <tr>
                            <td class="table-primary">내용</td>
                            <td colspan="5" id="detailContents" >${notice.noticeContent}</td>
                        </tr>
                    </table>
                    <table class="table table-bordered">
                        <tr>
                            <td class="table-primary">이전글</td>
                            <td id="table-contents">
	                            <c:if test=${prevNotice.noticeId != null}>
	                            	<a href="noticeDetail?noticeId=${prevNotice.noticeId}" style="color:black;">${prevNotice.noticeTitle}</a>	                           
	                        </c:if>
                           </td>
                        </tr>
                        <tr>
                            <td class="table-primary">다음글</td>
                            <td id="table-contents">
                            <c:if test= ${nextNotice.noticeId != null}>
                            	<a href="noticeDetail?noticeId=${nextNotice.noticeId}" style="color:black;">${nextNotice.noticeTitle}</a>	
                            </c:if>
                           	</td>                    
                        </tr>
                    </table>
                    <div class="d-flex justify-content-end mt-3">
                        <button type="button" class="btn-delete me-2" data-notice-id="${notice.noticeId}">삭제</button>
                        <button type="submit" class="btn-add me-2"><a href="noticeUpdateForm?noticeId=${notice.noticeId}" style="color:white;">수정</a></button>
                        <button type="button" class="btn-list" data-page-no="${pager.pageNo}"><a href="noticeList?pageNo=${pager.pageNo}" style="color:white;">목록</a></button>
                    </div>                 
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notice/noticeDelete.js"></script>
</body>
</html>