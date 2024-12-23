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
                    <p class="fw-bold codeApplyInfo-title">&gt; 코드/항목 신청 상세보기(EXCEL)</p>
                    <sec:authorize access="hasRole('ROLE_DBA')">
                        <div class="button-groupDBA">
                            <c:if test="${applyList.approvalStatus == 0}">
                                <button class="btn-approve btn-accent" onclick="codeApplyProcess(1, `${applyList.applyType}`)">승인</button>
                                <button class="btn-reject btn-gray" onclick="codeApplyProcess(2, `${applyList.applyType}`)">반려</button>
                            </c:if>
                            <c:if test="${applyList.approvalStatus == 1}">
                                <button class="btn-approve btn-accent" onclick="applyComplete(`${applyList.applyType}`)">반영</button>
                           		<button class="btn-rollback btn-normal" onclick="codeApplyProcess(0, `${applyList.applyType}`)">승인취소</button>
                            </c:if>
                            <c:if test="${applyList.approvalStatus == 2 || applyList.approvalStatus == 3}">
                                <div class="btn-processed btn-light">처리완료</div>
                            </c:if>
                        </div>
                    </sec:authorize>

                </div>
                <hr>

                <div class="codeApplyInfo">
                    <div class="codeApplyInfo-subtitle">신청정보</div>
                    <table class="table table-bordered codeApplyInfo-table table-container">
                    <colgroup>
                    	<col style="width: 180px;">
					    <col style="width: 220px;">
					    <col style="width: 180px;">
					    <col style="width: 220px;">
					    <col style="width: 180px;">
                    </colgroup>
                        <tr>
                            <td class="table-light">No.</td>
                            <td>
                                <div class="table-text">${indexNo}</div>
                            </td>
                            <td class="table-light">신청 건수</td>
                            <td>
                                <div class="table-text">총 ${totalCount} 건</div>
                            </td>
                            <td class="table-light">승인여부</td>
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
                            <td class="table-light">신청일자</td>
                            <td>
                                <div class="table-text">
                                    <fmt:formatDate value="${applyList.applyDate}" pattern="yyyy-MM-dd" />
                                </div>
                            </td>
                            <td class="table-light">신청자</td>
                            <td>
                                <div class="table-text">${applyList.MName}</div>
                            </td>
                            <td class="table-light">신청사유</td>
                            <td>
                                <div class="table-text">${applyList.applyReason}</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="table-light">처리일자</td>
                            <td>
                                <fmt:formatDate value="${applyList.complDate}" pattern="yyyy-MM-dd" />
                            </td>
                            <td class="table-light">처리자</td>
                            <td>
                                <div class="table-text">${applyList.dbaName}</div>
                            </td>
                            <td class="table-light">반려사유</td>
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
		                    <div class="code-table-container table-container">
		                        <table class="table table-hover bottom-table" style="table-layout: fixed;">
		                          <colgroup>
								    <col style="width: 50px;">
								    <col style="width: 165px;">
								    <col style="width: 165px;">
								    <col style="width: 80px;">
								  </colgroup>
		                            <thead class="table-light">
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
		                                        <td>${i.index+1}</td>
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
		                    <div class="item-table-container table-container">
		                        <table class="table table-hover bottom-table" style="table-layout: fixed;">
				                          <colgroup>
										    <col style="width: 60px;">
										    <col style="width: 165px;">
										    <col style="width: 165px;">
										  </colgroup>
		                            <thead class="table-light">
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
                        <button class="btn-list btn-accent" type="button">목록</button>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/code/codeApplyDetail.js"></script>
</body>
</html>