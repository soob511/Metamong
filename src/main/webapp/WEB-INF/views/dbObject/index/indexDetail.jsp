<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>인덱스 상세보기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexDetail.css" />
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
            </div>
            <hr>
            <table class="table table-bordered">
              <tr>
                <td class="table-primary">No.</td>
                <td id="table-contents" colspan="3">3</td>
              </tr>
              <tr>
                <td class="table-primary">신청일자</td>
                <td id="table-contents">2024-10-21</td>
                <td class="table-primary">신청자</td>
                <td id="table-contents">김유저(KimUser)</td>
              </tr>
              <tr>
                <td class="table-primary">처리일자</td>
                <td id="table-contents">2024-10-24</td>
                <td class="table-primary">처리자</td>
                <td id="table-contents">나디비(ImDBA)</td>
              </tr>
              <tr>
                <td class="table-primary">인덱스명</td>
                <td id="table-contents">idx_order_customer_date</td>
                <td class="table-primary">스키마명</td>
                <td id="table-contents">ASSET</td>
              </tr>
              <tr>
                <td class="table-primary">참조테이블</td>
                <td id="table-contents">TAB_ASSET</td>
                <td class="table-primary">참조컬럼</td>
                <td id="table-contents">customer_id ASC, order_date DESC</td>
              </tr>
              <tr>
                <td class="table-primary">신청사유</td>
                <td id="table-contents">ASSET 스키마에서 사용 예정입니다.</td>
                <td class="table-primary">UNIQUE</td>
                <td id="table-contents">Y</td>
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
            </table>
            <div class="d-flex justify-content-end">
              <a href="${pageContext.request.contextPath}/index/indexApplyList"><button class="btn-list">목록</button></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexList.js"></script>
  </body>
</html>