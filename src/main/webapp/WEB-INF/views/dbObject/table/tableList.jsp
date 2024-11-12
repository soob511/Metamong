<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>테이블 관리</title>
    <link
      href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableList.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  </head>
  <body>
    <div class="container table-list-container">
      <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col table-list-main">
          <jsp:include page="/WEB-INF/views/common/header.jsp" />
          <div class="table-list-header">
            <p class="table-list-title">&gt; 테이블 관리</p>
          </div>
          <div class="table-list-filters">
            <div class="schema-filter">
              <label for="schemaSelect" class="schema-filter-label"
                >스키마명</label
              >
              <select
                id="schemaSelect"
                class="form-select"
                aria-label="Default select example"
              >
                <option value="">전체</option>
                <c:forEach items="${schemaEnum}" var="schemaEnum">
                  <option value="${schemaEnum.name()}">
                    ${schemaEnum.name()}
                  </option>
                </c:forEach>
              </select>
            </div>
            <div class="table-search">
              <label for="tableNameSearch" class="table-search-label"
                >테이블명(논리/물리)</label
              >
              <div class="container-fluid">
                <form class="d-flex search-form">
                  <input
                    class="form-control"
                    type="search"
                    id="tableNameSearch"
                    placeholder="Search"
                    aria-label="Search"
                  />
                  <button class="btn-search btn-accent">조회</button>
                </form>
              </div>
            </div>
          </div>
          <hr />
          <div class="container table-management">
            <div class="row">
              <div class="col-6 tables-table">
                <div class="tables-management">
                  <p class="tables-management-title">테이블</p>
                  <sec:authorize
                    access="hasRole('ROLE_USER') and !hasRole('ROLE_DBA')"
                  >
                    <div class="tables-buttons">
                      <a href="tableAddForm"
                        ><button class="btn-add btn-accent">추가</button></a
                      >
                      <button class="btn-edit btn-normal">수정</button>
                    </div>
                  </sec:authorize>
                  <sec:authorize access="hasRole('ROLE_DBA')">
                    <button
                      class="btn-dataType btn-normal"
                      data-bs-toggle="modal"
                      data-bs-target="#dataTypeModal"
                    >
                      데이터타입 관리
                    </button>
                  </sec:authorize>
                </div>
                <div class="table-contanier table-container">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th scope="col">No.</th>
                        <th scope="col">테이블(논리)</th>
                        <th scope="col">테이블(물리)</th>
                        <th scope="col">스키마</th>
                        <th scope="col">내용</th>
                      </tr>
                    </thead>
                    <tbody id="tableList">
                      <c:forEach items="${list}" var="table" varStatus="status">
                        <tr
                          class="tableListTr"
                          data-table-no="${table.tableNo}"
                          onclick="showColumnList(${table.tableNo})"
                        >
                          <td>${status.index+1}</td>
                          <td>${table.tableNm}</td>
                          <td>${table.tableId}</td>
                          <td>${table.schemaNm}</td>
                          <td>${table.tableContent}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="col-6 column-table">
                <div class="column-management">
                  <p class="column-management-title">컬럼</p>
                </div>
                <div class="column-contanier table-container">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th scope="col">No.</th>
                        <th scope="col">컬럼(논리)</th>
                        <th scope="col">컬럼(물리)</th>
                        <th scope="col">타입</th>
                        <th scope="col">길이</th>
                        <th scope="col">NULL</th>
                        <th scope="col">PK</th>
                      </tr>
                    </thead>
                    <tbody id="columnList">
                      <tr>
                        <th colspan="7">테이블을 선택해 주세요.</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 데이터타입 관리 모달 -->
    <div
      class="modal fade"
      tabindex="-1"
      id="dataTypeModal"
      data-bs-backdrop="static"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">데이터타입 관리</h4>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="container team-container">
              <div class="row d-flex gap-4">
                <div class="col team-container">
                  <div class="dataType-subtitle">데이터타입 내역</div>
                  <table class="table" id="dataTypeTable">
                    <thead class="table-light">
                      <tr>
                        <th scope="col">No.</th>
                        <th scope="col">데이터타입</th>
                        <th scope="col">사용여부</th>
                      </tr>
                    </thead>
                    <tbody id="dataTypeList"></tbody>
                  </table>
                </div>
                <div class="col team-form">
                  <div class="dataType-subtitle">추가/수정</div>
                  <table class="table" id="dataTypeTable">
                    <tr>
                      <td class="table-light">데이터타입</td>
                      <td>
                        <input
                          type="text"
                          id="dataType"
                          class="form-control"
                          placeholder="입력"
                          required
                        />
                      </td>
                    </tr>
                    <tr>
                      <td class="table-light">사용여부</td>
                      <td>
                        <select
                          id="dataTypeIsActive"
                          class="form-select use-status-select"
                          aria-label="사용 여부 선택"
                        >
                          <option value="1">Y</option>
                          <option value="0">N</option>
                        </select>
                      </td>
                    </tr>
                  </table>
                  <div class="button-group d-flex justify-content-end gap-2">
                    <button class="btn-typeAdd btn-accent" type="button">
                      추가
                    </button>
                    <button
                      class="btn-typeEdit btn-normal"
                      type="button"
                      disabled
                    >
                      수정
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="modal-btns">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                취소
              </button>
              <button id="btn-save" type="button" class="btn btn-primary">
                저장하기
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/alarm.jsp" />
    <script src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableList.js"></script>
  </body>
</html>
