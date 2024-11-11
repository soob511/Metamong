<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>코드/항목 신청 상세보기(EXCEL)</title>
    <link href="${pageContext.request.contextPath}/resources/css/code/codeApplyExcelDetail.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
    <div class="container codeApplyInfo-container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/menu.jsp" />

            <div class="col codeApplyInfo-main">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />

                <div class="codeApplyInfo-header">
                    <p class="codeApplyInfo-title">&gt; 코드/항목 신청 상세보기(EXCEL)</p>
                    <sec:authorize access="hasRole('ROLE_DBA')">
                        <div class="button-groupDBA">
                            <c:if test="${applyList.approvalStatus == 0}">
                                <button class="btn-approve" onclick="codeApplyProcess(1, `${applyList.applyType}`)">승인</button>
                                <button class="btn-reject" onclick="codeApplyProcess(2, `${applyList.applyType}`)">반려</button>
                            </c:if>
                            <c:if test="${applyList.approvalStatus == 1}">
                                <button class="btn-approve" onclick="applyComplete(`${applyList.applyType}`)">반영</button>
                            </c:if>
                            <c:if test="${applyList.approvalStatus == 2 || applyList.approvalStatus == 3}">
                                <div class="btn-processed">처리완료</div>
                            </c:if>
                        </div>
                    </sec:authorize>

                    <c:if test="${applyList.approvalStatus == 2 && myApply != null }">
                        <a href="codeApplyRewrite?applyNo=<%= request.getParameter("applyNo") %>">
                            <button class="btn-rewrite">재작성</button>
                        </a>
                    </c:if>
                </div>
                <hr>

                <div class="codeApplyInfo">
                    <div class="codeApplyInfo-subtitle">신청정보</div>
                    <table class="table table-bordered codeApplyInfo-table">
                        <tr>
                            <td class="table-secondary">No.</td>
                            <td colspan="3">
                                <div class="table-text">${indexNo}</div>
                            </td>
                            <td class="table-secondary">신청 건수</td>
                            <td>
                                <div class="table-text">총 ${totalCount} 건</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="table-secondary">신청일자</td>
                            <td>
                                <div class="table-text">
                                    <fmt:formatDate value="${applyList.applyDate}" pattern="yyyy-MM-dd" />
                                </div>
                            </td>
                            <td class="table-secondary">신청자</td>
                            <td>
                                <div class="table-text">${applyList.MName}</div>
                            </td>
                            <td class="table-secondary">승인여부</td>
                            <td>
                                <div class="table-text">
                                    <c:choose>
                                        <c:when test="${applyList.approvalStatus == 0}">승인대기</c:when>
                                        <c:when test="${applyList.approvalStatus == 1}">승인</c:when>
                                        <c:when test="${applyList.approvalStatus == 2}">반려</c:when>
                                        <c:when test="${applyList.approvalStatus == 3}">반영</c:when>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="table-secondary">처리일자</td>
                            <td>
                                <fmt:formatDate value="${applyList.complDate}" pattern="yyyy-MM-dd" />
                            </td>
                            <td class="table-secondary">처리자</td>
                            <td>
                                <div class="table-text">${applyList.dbaName}</div>
                            </td>
                            <td class="table-secondary">반려사유</td>
                            <td>
                                <div class="table-text">${applyList.rejectReason}</div>
                            </td>
                        </tr>
                    </table>
                </div>
                
				<div class="container list-container">
		        	<div class="row d-flex gap-5">	        		
	        		<div class="col code-container">
		                    <div class="code-header">코드</div>
		                    <div class="code-table-container">
		                        <table class="table table-hover bottom-table">
		                            <thead class="table-secondary">
		                                <tr>
		                                    <th scope="col">No.</th>
		                                    <th scope="col">코드명(논리)</th>
		                                    <th scope="col">코드명(물리)</th>
		                                    <th scope="col">코드길이</th>
		                                    <th scope="col">내용</th>
		                                </tr>
		                            </thead>
		                            <tbody class="code-tbody">
		                              <c:forEach items="${applyCodes}" var="applyCode" varStatus="i">
		                                    <tr class="code" onclick="getExcelItems(${applyCode.codeNo})">
		                                        <th>${i.index+1}</th>
		                                        <td>${applyCode.codeNm}</td>
		                                        <td>${applyCode.codeId}</td>
		                                        <td>${applyCode.codeLength}</td>
		                                        <td>${applyCode.codeContent}</td>
		                                    </tr>
		                               </c:forEach>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
		        	
		                <div class="col item-container">
		                    <div class="item-header">항목</div>
		                    <div class="item-table-container">
		                        <table class="table table-hover bottom-table">
		                            <thead class="table-secondary">
		                                <tr>
		                                    <th scope="col">No.</th>
		                                    <th scope="col">항목코드</th>
		                                    <th scope="col">항목명</th>
		                                    <th scope="col">내용</th>
		                                </tr>
		                            </thead>
		                            <tbody class="item-tbody">
	                                    <tr><th colspan="4">코드를 선택해 주세요.</th></tr>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
	                </div>
                </div>

                <div class="button-group">
                    <a href="codeApplyList">
                        <button class="btn-list" type="button">목록</button>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/code/codeApplyDetail.js"></script>
</body>
</html>