<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>공지사항 상세</title>
    <link href="${pageContext.request.contextPath}/resources/css/notice/notice.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <sec:authorize access="hasRole('ROLE_ADMIN')">
          <jsp:include page="/WEB-INF/views/common/menuAdmin.jsp" />
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_DBA')">
          <sec:authorize access="!hasRole('ROLE_ADMIN')">
            <jsp:include page="/WEB-INF/views/common/menu.jsp" />
          </sec:authorize>
        </sec:authorize>
        <div class="col">
          <jsp:include page="/WEB-INF/views/common/header.jsp" />
          <div>
            <div class="content">
            	<div class="notice-header">
            		<p class="fw-bold notice-title">&gt; 공지사항 상세</p>
            	</div>
              <table class="table table-bordered table-container">
                <tr>
                  <td class="table-light" id="tdth">제목<span class="form-required">(*)</span></td>
                  <td id="table-contents" colspan="5">${notice.noticeTitle}</td>
                </tr>
                <tr>
                  <td class="table-light" id="tdth">작성자</td>
                  <td id="table-contents" style="width: 20%">${notice.MId}</td>
                  <td class="table-light" style="width: 16.66%" id="tdth">작성일자</td>
                  <td id="table-contents" style="width: 16.66%">
                    <fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd" />
                  </td>
                  <td class="table-light" style="width: 16.66%" id="tdth">조회수</td>
                  <td id="table-contents" style="width: 16.66%">${notice.noticeHitcount+1}</td>
                </tr>
                <c:if test="${notice.noticeFilename != null}">
                  <tr>
                    <td class="table-light" id="tdth">첨부파일</td>
                    <td id="table-contents" colspan="5">
                      <a href="fileDownload?noticeId=${notice.noticeId}" style="color: blue">${notice.noticeFilename}</a>
                    </td>
                  </tr>
                </c:if>
                <tr>
                  <td class="table-light" id="tdth">내용</td>
                  <td colspan="5" id="detailContents">${notice.noticeContent}</td>
                </tr>
              </table>
              <table class="table table-bordered  table-container" id="subTable">
                <tr>
                  <td class="table-light" id="subtdth">다음글</td>
                  <td id="table-contents">
                    <c:choose>
                      <c:when test="${notice.nextNum == 0}">다음글이 없습니다.</c:when>
                      <c:otherwise>
                        <a href="noticeDetail?noticeId=${notice.nextNum}" style="color: black">${notice.nextTitle}</a>
                      </c:otherwise>
                    </c:choose>
                  </td>
                </tr>
                <tr>
                  <td class="table-light" id="subtdth">이전글</td>
                  <td id="table-contents">
                    <c:choose>
                      <c:when test="${notice.prevNum == 0}">이전글이 없습니다.</c:when>
                      <c:otherwise>
                        <a href="noticeDetail?noticeId=${notice.prevNum}" style="color: black">${notice.prevTitle}</a>
                      </c:otherwise>
                    </c:choose>
                  </td>
                </tr>
              </table>
              <div class="d-flex justify-content-end mt-3">
              <c:choose>
                <c:when test="${writer}">
                  <button type="button" class="btn-delete me-2" data-notice-id="${notice.noticeId}">삭제</button>
                  <button type="submit" class="btn-add me-2">
                    <a href="noticeUpdateForm?noticeId=${notice.noticeId}" style="color: white">수정</a>
                  </button>
                  <button type="button" class="btn-list" data-page-no="${pager.pageNo}">
                    <a href="noticeList?pageNo=${pager.pageNo}" style="color: white">목록</a>
                  </button>
                </c:when>
                <c:otherwise>
                    <button type="button" class="btn-add" data-page-no="${pager.pageNo}">
                      <a href="noticeList?pageNo=${pager.pageNo}" style="color: white">목록</a>
                    </button>
                  </c:otherwise>
                  </c:choose>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
      <script src="${pageContext.request.contextPath}/resources/js/notice/noticeDelete.js"></script>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_DBA')">
      <sec:authorize access="!hasRole('ROLE_ADMIN')">
        <script src="${pageContext.request.contextPath}/resources/js/notice/noticeDBA.js"></script>
      </sec:authorize>
    </sec:authorize>
  </body>
</html>