<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>직원목록</title>
    <link href="${pageContext.request.contextPath}/resources/css/member/memberList.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/menu.jsp" />
            <div class="col">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <div class="content">
                    <h4 class="fw-bold">> 직원목록</h4>
                    <div class="d-flex justify-content-end gap-2">
                        <div class="table-list-filters">
                            <div class="schema-filter">
                                <select id="schemaSelect" class="form-select" aria-label="Default select example">
                                    <option selected>ID</option>
                                    <option>이름</option>
                                    <option>권한</option>
                                    <option>소속</option>
                                    <option>사번</option>
                                </select>
                            </div>
                        </div>
                        <input class="form-control" type="search" id="memberSearch" name="keyword" placeholder="Search" aria-label="Search">
                        <button class="btn-search btn-accent">조회</button>
                    </div>

                    <div id="memberList">
                        <div class="d-flex justify-content-start">
                            <div>총 <span class="form-required" id="memberCount">${totalRows}</span>명의 회원이 있습니다.</div>
                        </div>
                        <table class="table table-hover table-container">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">프로필</th>
                                    <th scope="col">ID</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">권한</th>
                                    <th scope="col">소속</th>
                                    <th scope="col">사번</th>
                                    <th scope="col">연락처</th>
                                </tr>
                            </thead>
                            <tbody id="memberTable">
                                <c:forEach items="${list}" var="member" varStatus="status">
                                    <tr class="table-row">
                                        <td scope="row">${status.index + 1 + (pager.pageNo - 1) * 10}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty member.profFilename}">
                                                    <img class="profile-img" src="${pageContext.request.contextPath}/member/getMemberProfileImage?mId=${member.MId}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="profile-img" src="${pageContext.request.contextPath}/resources/image/general_prof.png">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${member.MId}</td>
                                        <td>${member.MName}</td>
                                        <td>${member.MRole}</td>
                                        <td>${member.teamName}</td>
                                        <td>${member.MEmpId}</td>
                                        <td>${member.MTel}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="page" id="memberPage">
                            <a href="memberList?pageNo=1" class="btn btn-outline-secondary btn-sm"><<</a>
                            <c:if test="${pager.groupNo > 1}">
                                <a href="memberList?pageNo=${pager.startPageNo - 1}" class="btn btn-outline-dark btn-sm"><</a>
                            </c:if>
                            <c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
                                <c:if test="${pager.pageNo == i}">
                                    <a href="memberList?pageNo=${i}" class="btn btn-secondary btn-sm">${i}</a>
                                </c:if>
                                <c:if test="${pager.pageNo != i}">
                                    <a href="memberList?pageNo=${i}" class="btn btn-outline-secondary btn-sm">${i}</a>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pager.groupNo < pager.totalGroupNo}">
                                <a href="memberList?pageNo=${pager.endPageNo + 1}" class="btn btn-outline-dark btn-sm">></a>
                            </c:if>
                            <a href="memberList?pageNo=${pager.totalPageNo}" class="btn btn-outline-secondary btn-sm">>></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/member/memberList.js"></script>
</body>
</html>