<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="codeContainer">
    <div class="table-container">
        <table class="table table-hover">
            <thead class="table">
                <tr class="table-primary">
                    <th scope="col">No.</th>
                    <th scope="col">신청일자</th>
                    <th scope="col">신청자</th>
                    <th scope="col">코드명(논리)</th>
                    <th scope="col">코드명(물리)</th>
                    <th scope="col">분류</th>
                    <th scope="col">상세보기</th>
                    <th scope="col">상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="code" varStatus="status">
                    <tr>
                        <th scope="row">${status.index + 1}</th>
                        <td>
                            <fmt:formatDate value="${code.applyDate}" pattern="yyyy-MM-dd" />
                        </td>
                        <td>${code.MName}</td>
                        <td>${code.codeNm}</td>
                        <td>${code.codeId}</td>
                        <td>${code.applyObj}</td>
                        <td>
                            <button class="btn-history-details" onclick="codeApplyDetail(${code.applyNo}, ${status.index + 1})">상세보기</button>
                        </td>
                        <td class="code-approve">
                            <c:choose>
                                <c:when test="${code.approvalStatus == 0}">
                                    <span id="status-await">승인대기</span>
                                </c:when>
                                <c:when test="${code.approvalStatus == 1}">
                                    <span id="status-approve">승인</span>
                                </c:when>
                                <c:when test="${code.approvalStatus == 2}">
                                    <span id="status-rejected">반려</span>
                                </c:when>
                                <c:when test="${code.approvalStatus == 3}">
                                    <span id="status-applied">반영</span>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="page">
        <div class="pagination">
            <a href="codeApplyList?pageNo=1" class="btn btn-outline-primary btn-sm">&lt;&lt;</a>
            <c:if test="${pager.groupNo > 1}">
                <a href="javascript:codeApplySearch(${pager.startPageNo - 1})" class="btn btn-outline-info btn-sm">&lt;</a>
            </c:if>
            <c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
                <c:if test="${pager.pageNo == i}">
                    <a href="javascript:codeApplySearch(${i})" class="btn btn-outline-primary btn-sm">${i}</a>
                </c:if>
                <c:if test="${pager.pageNo != i}">
                    <a href="javascript:codeApplySearch(${i})" class="btn btn-outline-primary btn-sm">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pager.groupNo < pager.totalGroupNo}">
                <a href="javascript:codeApplySearch(${pager.endPageNo + 1})" class="btn btn-outline-info btn-sm">&gt;</a>
            </c:if>
            <a href="javascript:codeApplySearch(${pager.totalPageNo})" class="btn btn-outline-primary btn-sm">&gt;&gt;</a>
        </div>
    </div>
</div>