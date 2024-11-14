<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-start">
    <div>총 <span class="form-required" id="memberCount">${totalRows}</span>명의 회원이 있습니다.</div>
</div>

<table class="table table-hover table-container" style="table-layout: fixed;">
  <colgroup>
    <col style="width: 85px;">
    <col style="width: 150px;">
    <col style="width: 250px;">
    <col style="width: 150px;">
    <col style="width: 150px;">
    <col style="width: 150px;">
    <col style="width: 250px;">
  </colgroup>
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
        <c:if test="${totalRows >= 1}">
            <c:forEach items="${list}" var="member" varStatus="status">
                <tr>
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
        </c:if>
        <c:if test="${totalRows == 0}">
            <tr>
                <th colspan="8">검색 결과가 없습니다.</th>
            </tr>
        </c:if>
    </tbody>
</table>

<c:if test="${totalRows > 0}">
    <div class="page">
        <a href="javascript:memberSearch(1)" class="btn btn-outline-secondary btn-sm"><<</a>
        <c:if test="${pager.groupNo > 1}">
            <a href="javascript:memberSearch(${pager.startPageNo - 1})" class="btn btn-outline-dark btn-sm"><</a>
        </c:if>
        <c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
            <c:if test="${pager.pageNo == i}">
                <a href="javascript:memberSearch(${i})" class="btn btn-secondary btn-sm">${i}</a>
            </c:if>
            <c:if test="${pager.pageNo != i}">
                <a href="javascript:memberSearch(${i})" class="btn btn-outline-secondary btn-sm">${i}</a>
            </c:if>
        </c:forEach>
        <c:if test="${pager.groupNo < pager.totalGroupNo}">
            <a href="javascript:memberSearch(${pager.endPageNo + 1})" class="btn btn-outline-dark btn-sm">></a>
        </c:if>
        <a href="javascript:memberSearch(${pager.totalPageNo})" class="btn btn-outline-secondary btn-sm">>></a>
    </div>
</c:if>

<script src="${pageContext.request.contextPath}/resources/js/member/memberList.js"></script>