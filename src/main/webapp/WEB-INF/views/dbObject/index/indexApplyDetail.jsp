<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>인덱스 상세보기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexDetail.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dbObject/common/sqlModal.css" />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col">
          <jsp:include page="/WEB-INF/views/common/header.jsp" />
          <div class="index-container">
            <div class="table-list-header">
              <p class="table-list-title">&gt; DB Object &gt; 신청내역 &gt; 인덱스 상세보기</p>
              	<!-- <div class="button-groupDBA">
						<button class="btn-approve">승인</button>
						<button class="btn-reject">반려</button>
				</div> -->
            </div>
            <hr>
            <table class="table table-bordered">
              <tr>
                <td class="table-primary">No.</td>
                <td id="table-contents" colspan="3">${no}</td>
              </tr>
              <tr>
                <td class="table-primary">신청일자</td>
                <td id="table-contents">
                	<fmt:formatDate value="${detail.applyDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td class="table-primary">신청자</td>
                <td id="table-contents">${detail.MName}</td>
              </tr>
              <tr>
                <td class="table-primary">처리일자</td>
                <td id="table-contents">
                	<fmt:formatDate value="${detail.complDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td class="table-primary">처리자</td>
                <td id="table-contents">${detail.dbaName}</td>
              </tr>
              <tr>
                <td class="table-primary">인덱스명</td>
                <td id="table-contents">${detail.idxName}</td>
                <td class="table-primary">스키마명</td>
                <td id="table-contents">${detail.schemaName}</td>
              </tr>
              <tr>
                <td class="table-primary">참조테이블</td>
                <td id="table-contents">${detail.tableId}</td>
                <td class="table-primary">참조컬럼</td>
                <td id="table-contents">${detail.refColumn}</td>
              </tr>
              <tr>
                <td class="table-primary">신청사유</td>
                <td id="table-contents">${detail.applyReason}</td>
                <td class="table-primary">UNIQUE</td>
                <td id="isUnique">${detail.isUnique}</td>
              </tr>
              <tr>
                <td class="table-primary">상태</td>
                <td id="approvalStatus" colspan="3">${detail.approvalStatus}</td>
              </tr>
              <tr>
                <td class="table-primary">반려사유</td>
                <td id="rejectReason" colspan="3">${detail.rejectReason}</td>
              </tr>
              <tr>
                <td class="table-primary">쿼리문</td>
                <td id="table-contents" colspan="3">
                	<button class="btn-sql" data-bs-toggle="modal" data-bs-target="#sqlLoadModal">
                		SQL
               		</button>
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
						<div class="table-body">
							${detail.query}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexList.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexDetail.js"></script>
  </body>
</html>