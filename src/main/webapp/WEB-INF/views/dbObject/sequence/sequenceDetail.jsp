<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>시퀀스 상세보기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dbObject/sequence/sequenceDetail.css" />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col">
          <jsp:include page="/WEB-INF/views/common/header.jsp" />
          <div class="index-container">
            <div class="table-list-header">
              <p class="table-list-title">&gt; DB Object &gt; 신청내역 &gt; 시퀀스 상세보기</p>
            </div>
            <hr>
            <table class="table table-bordered">
              <tr>
                <td class="table-primary">No.</td>
                <td id="table-contents" colspan="3">3</td>
              </tr>
              <tr>
                <td class="table-primary">신청일자</td>
                <td id="table-contents" style="width:38%">2024-10-21</td>
                <td class="table-primary" >신청자</td>
                <td id="table-contents" style="width:38%" >김유저(KimUser)</td>
              </tr>
              <tr>
                <td class="table-primary">처리일자</td>
                <td id="table-contents" style="width:38%">2024-10-24</td>
                <td class="table-primary">처리자</td>
                <td id="table-contents" style="width:38%">나디비(ImDBA)</td>
              </tr>
              <tr>
                <td class="table-primary">시퀀스명</td>
                <td id="table-contents" colspan="3">SEQ_ASSET</td>
                
              </tr>
              <tr>
                <td class="table-primary">스키마명</td>
                <td id="table-contents" colspan="3">ASSET</td>
               
              </tr>
              <tr>
                <td class="table-primary">신청사유</td>
                <td id="table-contents" colspan="3">편리한 프로젝트 관리를 위해 생성이 필요합니다.</td>
                
              </tr>
              <tr>
                <td class="table-primary">상태</td>
                <td id="table-contents" colspan="3">승인</td>
              </tr>
              <tr>
                <td class="table-primary">반려사유</td>
                <td id="table-contents" colspan="3">-</td>
              </tr>
              <tr>
                <td class="table-primary">쿼리문</td>
                <td id="table-contents" colspan="3"><button class="btn-sql">SQL</button></td>
              </tr>
               <tr>
                <td class="table-primary">첨부파일</td>
                <td id="table-contents" colspan="3">SEQUENCE.txt</td>
              </tr>
            </table>
            <div class="d-flex justify-content-end">
              <a href="${pageContext.request.contextPath}/sequence/sequenceApplyList"><button class="btn-list">목록</button></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/dbObject/sequence/sequenceList.js"></script>
  </body>
</html>