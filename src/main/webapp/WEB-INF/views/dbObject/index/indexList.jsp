<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>인덱스 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexList.css" />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col">
          <jsp:include page="/WEB-INF/views/common/header.jsp" />
          <div class="index-container">
            <div>
              <div class="table-list-header">
                <p class="table-list-title">&gt; 인덱스 관리</p>
              </div>
              <div class="table-list-filters">
                <div class="table-search">
                  <label for="indexNameSearch" class="table-search-label">인덱스명</label>
                  <div class="container-fluid">
                    <form class="d-flex search-form">
                      <input class="form-control me-2" type="search" id="indexNameSearch" placeholder="Search" aria-label="Search">
                      <i id=biSearch class="bi bi-search"></i>
                    </form>
                  </div>
                </div>
                <div class="schema-filter">
                  <label for="schemaSelect" class="schema-filter-label">스키마명</label>
                  <select id="schemaSelect" class="form-select" aria-label="Default select example">
                    <option selected value="MAIN">USER_2024_OTI_FINAL_TEAM1</option>
                    <option value="SUB1">USER_2024_OTI_FINAL_TEAM1_1</option>
                    <option value="SUB2">USER_2024_OTI_FINAL_TEAM1_2</option>
                    <option value="SUB3">USER_2024_OTI_FINAL_TEAM1_3</option>
                  </select>
                </div>
              </div>
            </div>
            <hr>
            <div class="index-table">
              <div class="tables-table">
                <div class="tables-management">
                  <p class="tables-management-title">인덱스</p>
                  <div class="tables-buttons">
                    <a href="${pageContext.request.contextPath}/index/indexAddForm"><button class="btn-add">추가</button></a>
                    <a href="${pageContext.request.contextPath}/index/indexDeleteForm"><button class="btn-del">삭제</button></a>
                  </div>
                </div>
                <div class="table-container">
	                <table class="table table-hover">
	                  <thead class="table-primary">
	                    <tr>
	                      <th scope="col">No.</th>
	                      <th scope="col">인덱스명</th>
	                      <th scope="col">스키마명</th>
	                      <th scope="col">참조테이블명</th>
	                      <th scope="col">참조컬럼명</th>
	                      <th scope="col">유일성</th>
	                    </tr>
	                  </thead>
	                  <tbody id="indexTableBody">
	                  	<c:forEach items="${list}" var="index">
	                  		<tr>
		                      <th></th>
		                      <td>${index.indexName}</td>
		                      <td>${index.schemaName}</td>
		                      <td>${index.tableName}</td>
		                      <td>${index.columnName}</td>
		                      <td>${index.uniqueness}</td>
	                    	</tr>
	                  	</c:forEach>
	                  </tbody>
	                </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexList.js"></script>
  </body>
</html>