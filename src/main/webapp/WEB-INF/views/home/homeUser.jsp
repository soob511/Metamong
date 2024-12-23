<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>HOME</title>
    <link href="${pageContext.request.contextPath}/resources/css/home/home.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.5/dist/chart.umd.min.js"></script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <jsp:include page="/WEB-INF/views/common/menu.jsp" />
        <div class="col">
          <jsp:include page="/WEB-INF/views/common/header.jsp" />
          <div class="container main-container">
            <div class="row">
              <div class="col-6">
                <p class="board-title">신청 현황</p>
                <div class="container dash-board">
                  <div class="row">
                    <div class="col-4 chart">
                      <canvas id="chart" width="400" height="400"></canvas>
                    </div>
                    <div class="col">
                      <p class="project-title"># MetaMong 프로젝트</p>
                      <h4 class="project-user">반가워요! <span class="fw-bold">${userName}</span><span class="fs-5">님</span></h4>
                      <div class="summary-box d-flex justify-content-center align-items-center">
                        <div>
                          <p>승인대기</p>
                          <h3><span class="fw-bold">0</span><span class="fs-4">건</span></h3>
                        </div>
                        <div>
                          <p>승인</p>
                          <h3><span class="fw-bold">0</span><span class="fs-4">건</span></h3>
                        </div>
                        <div>
                          <p>반려</p>
                          <h3><span class="fw-bold">0</span><span class="fs-4">건</span></h3>
                        </div>
                        <div>
                          <p>반영</p>
                          <h3><span class="fw-bold">0</span><span class="fs-4">건</span></h3>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col notice-box">
                <div class="d-flex justify-content-between">
                  <p class="board-title">공지사항</p>
                  <a href="${pageContext.request.contextPath}/notice/noticeList"><button class="btn-notice">+ 더보기</button></a>
                </div>
                <div class="notice-container">
                  <table class="table table-hover table-container">
                    <thead class="table">
                      <tr class="table-light">
                        <th scope="col">제목</th>
                        <th scope="col">등록일</th>
                        <th scope="col">작성자</th>
                        <th scope="col">조회수</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${noticeList}" var="notice" varStatus="status">
                        <tr class="table-row" onclick="location.href='notice/noticeDetail?noticeId=${notice.noticeId}'" style="cursor: pointer">
                          <td id="noticeTitle">
                            <c:if test="${notice.noticeIsimp == '1'}">
                              <i class="bi bi-megaphone"></i>
                            </c:if>
                            ${notice.noticeTitle}
                          </td>
                          <td>
                            <fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd" />
                          </td>
                          <td>${notice.MId}</td>
                          <td>${notice.noticeHitcount}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-5">
                <div class="schema-filter">
                  <div class="schema-table-title">Table 목록</div>
                  <div class="d-flex align-items-center">
                    <label for="schemaSelect" class="schema-filter-label">스키마명</label>
                    <select id="schemaSelect" class="form-select" aria-label="Default select example">
                      <c:forEach items="${schemaEnum}" var="schemaEnum">
                        <c:if test="${schemaEnum.name() != 'MAIN'}">
                          <option value="${schemaEnum.name()}">${schemaEnum.name()}</option>
                        </c:if>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="table-box table-container">
                  <table class="table table-hover">
                    <thead class="table">
                      <tr class="table-light">
                        <th scope="col">No.</th>
                        <th scope="col">스키마</th>
                        <th scope="col">테이블명(논리)</th>
                        <th scope="col">테이블명(물리)</th>
                      </tr>
                    </thead>
                    <tbody id="tableList"></tbody>
                  </table>
                </div>
              </div>
              <div class="col">
                <p class="board-title">Column 목록</p>
                <div class="col-box table-container">
                  <table class="table table-hover">
                    <thead class="table">
                      <tr class="table-light">
                        <th scope="col">No.</th>
                        <th scope="col">컬럼명(논리)</th>
                        <th scope="col">컬럼명(물리)</th>
                        <th scope="col">데이터타입</th>
                        <th scope="col">길이</th>
                        <th scope="col">NULL</th>
                        <th scope="col">PK</th>
                      </tr>
                    </thead>
                    <tbody id="columnList"></tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/home/homeUser.js"></script>
  </body>
</html>