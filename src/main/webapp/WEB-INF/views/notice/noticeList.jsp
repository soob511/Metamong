<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <link href="${pageContext.request.contextPath}/resources/css/notice/notice.css" rel="stylesheet">
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
                <div class="content">
                    <div class="notice-header">
                        <p class="notice-title fw-bold">&gt; 공지사항</p>
                    </div>
                    <div class="d-flex justify-content-end">
                        <div class="table-list-filters me-3">
                            <div class="schema-filter">
                                <select id="schemaSelect" class="form-select" aria-label="Default select example">
                                    <option selected>제목</option>
                                    <option>내용</option>
                                    <option>제목+내용</option>
                                    <option>작성자</option>
                                </select>
                            </div>
                        </div>
                        <input class="form-control" type="search" id="noticeSearch" name="keyword" placeholder="Search" aria-label="Search">
                        <button class="btn-search btn-accent">조회</button>
                    </div>
                    <div id="noticeList">
                        <div class="d-flex justify-content-start">
                            <div>총 <span class="form-required" id="noticeCount">${totalRows}</span>건의 게시물이 있습니다.</div>
                        </div>
                        <table class="table table-hover table-container" style="table-layout: fixed;">
	                          <colgroup>
							    <col style="width: 100px;">
							    <col style="width: 750px;">
							    <col style="width: 200px;">
							    <col style="width: 200px;">
							  </colgroup>
                            <thead>
                                <tr class="table-light">
                                    <th scope="col">No.</th>
                                    <th scope="col" id="title">제목</th>
                                    <th scope="col">등록일</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">조회수</th>
                                </tr>
                            </thead>
                            <tbody id="noticeTable">
                                <c:forEach items="${list}" var="notice" varStatus="status">
                                    <tr class="table-row" onclick="location.href='noticeDetail?noticeId=${notice.noticeId}'" style="cursor: pointer;">
                                        <td scope="row">
                                            <c:choose>
                                                <c:when test="${notice.noticeIsimp == '1'}">
                                                    <button type="button" class="btn btn-sm">
                                                        <i class="bi bi-megaphone"></i>
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    ${pager.totalRows - (pager.pageNo - 1) * pager.rowsPerPage - status.index}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td id="title">${notice.noticeTitle}</td>
                                        <td><fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd" /></td>
                                        <td>${notice.MId}</td>
                                        <td>${notice.noticeHitcount}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_DBA')">
                            <div class="d-flex justify-content-end">
                                <div class="btn btn-write" id="btn-write">
                                    <a href="${pageContext.request.contextPath}/notice/noticeAddForm">작성하기</a>
                                </div>
                            </div>
                        </sec:authorize>
                        <div class="page">
                            <a href="noticeList?pageNo=1" class="btn btn-outline-secondary btn-sm"><<</a>
                            <c:if test="${pager.groupNo > 1}">
                                <a href="noticeList?pageNo=${pager.startPageNo - 1}" class="btn btn-outline-dark btn-sm"><</a>
                            </c:if>
                            <c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
                                <c:if test="${pager.pageNo == i}">
                                    <a href="noticeList?pageNo=${i}" class="btn btn-secondary btn-sm">${i}</a>
                                </c:if>
                                <c:if test="${pager.pageNo != i}">
                                    <a href="noticeList?pageNo=${i}" class="btn btn-outline-secondary btn-sm">${i}</a>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pager.groupNo < pager.totalGroupNo}">
                                <a href="noticeList?pageNo=${pager.endPageNo + 1}" class="btn btn-outline-dark btn-sm">></a>
                            </c:if>
                            <a href="noticeList?pageNo=${pager.totalPageNo}" class="btn btn-outline-secondary btn-sm">>></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <script src="${pageContext.request.contextPath}/resources/js/notice/noticeList_admin.js"></script>
    </sec:authorize>

    <sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_DBA')">
        <sec:authorize access="!hasRole('ROLE_ADMIN')">
            <script src="${pageContext.request.contextPath}/resources/js/notice/noticeList.js"></script>
        </sec:authorize>
    </sec:authorize>
</body>
</html>