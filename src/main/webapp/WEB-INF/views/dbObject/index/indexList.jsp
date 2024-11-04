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
              <div class="index-list-header">
                <p>&gt; 인덱스 관리</p>
              </div>
              <div class="index-list-filters">
              	<div class="schema-filter">
                  <label for="schemaSelect" class="schema-filter-label">스키마명</label>
					<select id="schemaSelect" class="form-select" aria-label="Default select example">
					    <c:forEach items="${schemaEnum}" var="schemaEnum">
					        <option value="${schemaEnum.name()}">
					        	<c:if test="${schemaEnum.name() == 'MAIN'}">
						        	전체
						        </c:if>
						        <c:if test="${schemaEnum.name() != 'MAIN'}">
						            ${schemaEnum.name()}
						        </c:if>
					        </option>
					    </c:forEach>
					</select>
                </div>
                <div class="table-column-filter">
                  <label for="tableSelect" class="schema-filter-label">참조테이블명</label>
					<select id="tableSelect" class="form-select" aria-label="Default select example">
						<option>선택</option>
					</select>
                </div>
                <div class="table-column-filter">
                  <label for="columnSelect" class="schema-filter-label">참조컬럼명</label>
					<select id="columnSelect" class="form-select" aria-label="Default select example">
						<option>선택</option>
					</select>
                </div>
                
                <div class="index-search">
                  <label for="indexNameSearch" class="index-search-label">인덱스명</label>
                  <div class="container-fluid">
                    <div class="d-flex index-form">
                      <input class="form-control" type="search" id="indexNameSearch" placeholder="Search" aria-label="Search">
                      	<i id="biSearch" class="bi bi-search"></i>
                    </div>
                  </div>
                </div>
                <div class="d-flex align-items-center ms-4">
	                <button class="btn-search" id="indexSearchBtn">조회</button>
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
	                  	<c:forEach items="${list}" var="index" varStatus="status">
	                  		<tr>
		                      <th>${status.index + 1}</th>
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