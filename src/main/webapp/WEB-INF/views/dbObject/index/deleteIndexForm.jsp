<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>인덱스 삭제 신청</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dbObject/index/deleteIndexForm.css" />
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
                <p class="table-list-title">&gt; 인덱스 삭제</p>
              </div>
              <div class="table-list-filters">
                <div class="table-search">
                  <label for="tableNameSearch" class="table-search-label">인덱스명</label>
                  <div class="container-fluid">
                    <form class="d-flex search-form">
                      <input class="form-control me-2" type="search" id="tableNameSearch" placeholder="Search" aria-label="Search">
                      <i class="bi bi-search"></i>
                    </form>
                  </div>
                </div>
                <div class="schema-filter">
                  <label for="schemaSelect" class="schema-filter-label">스키마명</label>
                  <select id="schemaSelect" class="form-select" aria-label="Default select example">
                    <option selected>선택</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>
                </div>
              </div>
            </div>
            <hr>
            <div class="container index-tables">
              <div class="row">
                <div class="col-7 index-table">
                  <p class="index-apply-title">인덱스</p>
                  <div class="table-container">
                    <table class="table table-hover">
                      <thead class="table-primary">
                        <tr>
                          <th scope="col">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                          </th>
                          <th scope="col">No.</th>
                          <th scope="col">인덱스명</th>
                          <th scope="col">스키마명</th>
                          <th scope="col">참조테이블명</th>
                          <th scope="col">참조컬럼명</th>
                          <th scope="col">유일성</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th><input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked></th>
                          <td>1</td>
                          <td>SEQ_CODE</td>
                          <td>kosa_oracle_server-team3</td>
                          <td>참조테이블</td>
                          <td>참조컬럼</td>
                          <td>N</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="col index-apply-reason">
                  <p>신청사유</p>
                  <textarea></textarea>
                  <button class="btn-add">신청</button>
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