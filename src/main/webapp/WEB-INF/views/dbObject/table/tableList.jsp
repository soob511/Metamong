<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <link
    rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableList.css"
  />
  <head>
    <meta charset="UTF-8" />
    <title>테이블 내역 관리</title>
    <link
      href="${pageContext.request.contextPath}/resources/css/dbObject/tableList.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col">
          <jsp:include page="/WEB-INF/views/common/header.jsp" />
          <div>view</div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableList.js"></script>
  </body>
</html>
