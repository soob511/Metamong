<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link href="${pageContext.request.contextPath}/resources/css/notice/notice.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
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
                        <c:if test="${notice.noticeFilename != null}">
                        <tr>
                            <td class="table-primary">첨부파일</td>
                            <td id="table-contents" colspan="5"><a href="fileDownload?noticeId=${notice.noticeId}" style="color:black;">${notice.noticeFilename}</a></td>
                        </tr>
                        </c:if>
                        <tr>
                            <td class="table-primary">내용</td>
                            <td colspan="5">
                                <textarea class="form-control"  id="exampleFormControlTextarea1" rows="12" required >
                                   ${notice.noticeContent}
                                </textarea>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-bordered">
                        <tr>
                            <td class="table-primary">이전글</td>
                            <td id="table-contents"><a href="noticeDetail?noticeId=2" style="color:black;">코드 추가 요청에 관한 공지입니다.</a></td>
                        </tr>
                        <tr>
                            <td class="table-primary">다음글</td>
                            <td id="table-contents"><a href="noticeDetail?noticeId=3" style="color:black;">DB 신청양식 폼</a></td>
                        </tr>
                    </table>
                    <div class="d-flex justify-content-end mt-3">
                        <button type="button" class="btn-cancel me-2"><a href="deleteNotice?noticeId=${notice.noticeId}" style="color:#003567;">삭제</a></button>
                        <button type="submit" class="btn-add me-2"><a href="noticeUpdateForm?noticeId=${notice.noticeId}" style="color:white;"> 수정</a></button>
                        <button type="button" class="btn-list"><a href="noticeList?pageNo=${pager.pageNo}" style="color:white;">목록</a></button>
                    </div>                 
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/notice/notice.js"></script>
</body>
</html>