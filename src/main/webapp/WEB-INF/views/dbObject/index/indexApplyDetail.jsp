<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>인덱스 상세보기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexApplyDetail.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dbObject/common/sqlModal.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col">
          <jsp:include page="/WEB-INF/views/common/header.jsp" />
          <div class="index-container" id="applyContainer" data-applyno="${detail.applyNo}">
            <div class="table-list-header">
              <p class="table-list-title">&gt; DB Object &gt; 신청내역 &gt; 인덱스 상세보기</p>
              	<sec:authorize access="hasRole('ROLE_DBA')">
					<div class="button-groupDBA">
						<c:choose>
							<c:when test="${detail.approvalStatus == 0}">
								<button class="btn-approve" onclick="indexApplyDba(1)">승인</button>
								<button class="btn-reject" onclick="indexApplyDba(2)">반려</button>
							</c:when>
							<c:when test="${detail.approvalStatus == 1}">
								<button class="btn-reflect">반영</button>
								<button class="btn-rollback">승인취소</button>
							</c:when>
							<c:when
								test="${detail.approvalStatus == 2 || applyList.approvalStatus == 3}">
								<button class="btn-complete">처리완료</button>
							</c:when>
						</c:choose>
					</div>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_DBA') and !hasRole('ROLE_ADMIN')">
				<c:if test="${detail.approvalStatus == 2 and detail.MName == userName}">
					<button class="btn-reapply">재작성</button>				
				</c:if>
				</sec:authorize>
            </div>
            <hr>
            <table class="table table-bordered">
              <tr id="detailApplyNo" data-value="${detail.applyNo}">
                <td class="table-light">No.</td>
                <td id="table-contents" colspan="3">${no}</td>
              </tr>
              <tr id="detailApplyType" data-value="${detail.applyType}">
                <td class="table-light">신청일자</td>
                <td class="table-td-width" id="table-contents">
                	<fmt:formatDate value="${detail.applyDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td class="table-light">신청자</td>
                <td id="table-contents">${detail.MName}</td>
              </tr>
              <tr>
                <td class="table-light">처리일자</td>
                <td class="table-td-width" id="table-contents">
                	<fmt:formatDate value="${detail.complDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td class="table-light">처리자</td>
                <td id="table-contents">${detail.dbaName}</td>
              </tr>
              <tr>
                <td class="table-light">인덱스명</td>
                <td class="table-td-width" id="idxName" data-value="${detail.idxName}">
                	${detail.idxName}
               	</td>
                <td class="table-light">스키마명</td>
                <td id="schemaName" data-value="${detail.schemaName}">
                	${detail.schemaName}
               	</td>
              </tr>
              <tr>
                <td class="table-light">참조테이블</td>
                <td class="table-td-width" id="tableId" data-value="${detail.tableId}">
                	${detail.tableId}
               	</td>
                <td class="table-light">참조컬럼</td>
                <td id="refColumn" data-value="${detail.refColumn}">
                	${detail.refColumn}
                </td>
              </tr>
              <tr>
                <td class="table-light">신청사유</td>
                <td class="table-td-width" id="applyReason" data-value="${detail.applyReason}">
                	${detail.applyReason}
               	</td>
                <td class="table-light">UNIQUE</td>
                <td id="isUnique" data-value="${detail.isUnique}">
                	${detail.isUnique}
                </td>
              </tr>
              <tr>
                <td class="table-light">상태</td>
                <td id="approvalStatus" colspan="3">${detail.approvalStatus}</td>
              </tr>
              <tr>
                <td class="table-light">반려사유</td>
                <td id="rejectReason" colspan="3">${detail.rejectReason}</td>
              </tr>
              <tr>
                <td class="table-light">쿼리문</td>
                <td id="sqlContents" colspan="3">
                	
               	</td>
              </tr>
            </table>
            <div class="d-flex justify-content-end">
              <a href="${pageContext.request.contextPath}/index/indexApplyList"><button class="btn-list">목록</button></a>
            </div>
          </div>
        </div>
      </div>
    </div>

	<div class="modal fade" id="sqlLoadModal" tabindex="-1"
		aria-labelledby="sqlLoadModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="table-container">
						<div class="table-header d-flex align-items-center">SQL</div>
						<textarea class="table-body">
							${detail.query}
						</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexApplyDetail.js"></script>
  </body>
</html>