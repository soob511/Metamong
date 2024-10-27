<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>코드/항목 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/code/codeList.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery for easier DOM manipulation -->
</head>
<body>
    <div class="container code-list-container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/menu.jsp" />

            <div class="col code-list-main">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />

                <div class="code-list-header">
                    <p class="code-list-title">&gt; 코드/항목 관리</p>
                </div>

                <div class="code-list-filters">
                    <div class="code-search">
                        <label for="codeNameSearch" class="code-search-label">코드명(논리/물리)</label>
                        <div class="container-fluid">
                            <form class="d-flex search-form">
                                <input class="form-control me-2" type="search" id="codeNameSearch" placeholder="Search" aria-label="Search">
                                <i class="bi bi-search"></i>
                            </form>
                        </div>
                    </div>

                    <div class="use-filter">
                        <label for="useSelect" class="use-filter-label">사용여부</label>
                        <select id="useSelect" class="form-select" aria-label="Default select example">
                            <option selected>선택</option>
                            <option value="1">Y</option>
                            <option value="2">N</option>
                        </select>
                    </div>
                </div>

                <hr>

                <div class="container code-management">
                    <div class="row">
                        <!-- 테이블 목록 -->
                        <div class="col-6 code-table">
                            <div class="code-management">
                                <p class="code-management-title">코드</p>
                                <div class="code-buttons">
                                    <button class="btn-excel">EXCEL 업로드</button>
                                    <a href="codeAddForm">
                                        <button class="btn-add">추가</button>
                                    </a>
                                    <a href="codeUpdateForm">
                                        <button class="btn-edit">수정</button>
                                    </a>
                                </div>
                            </div>
                            <table class="table table-hover" id="codeTable">
                                <thead class="table-primary">
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">코드(논리)</th>
                                        <th scope="col">코드(물리)</th>
                                        <th scope="col">사용여부</th>
                                        <th scope="col">내용</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${codeList}" var="code">
                                    <tr class="code-row" data-code-no="${code.codeNo}">
                                        <th>${code.codeNo}</th>
                                        <td>${code.codeNm}</td>
                                        <td>${code.codeId}</td>
                                        <td>${code.codeIsActive == 1 ? 'Y' : 'N'}</td>
                                        <td>${code.codeContent}</td>
                                    </tr>
                                </c:forEach>	
                                </tbody>
                            </table>
                        </div>

                        <!-- 항목 목록 -->
                        <div class="col-6 item-table">
                            <div class="item-management">
                                <p class="item-management-title">항목</p>
                            </div>
                            <table class="table table-hover" id="itemTable">
                                <thead class="table-primary">
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">항목코드</th>
                                        <th scope="col">항목명</th>
                                        <th scope="col">사용여부</th>
                                        <th scope="col">내용</th>
                                    </tr>
                                </thead>
                                <tbody>                                
	                                <c:forEach items="${itemList}" var="items">
									    <c:forEach items="${items}" var="item">
									        <tr>
									            <th>${item.codeNo}</th>
									            <td>${item.itemId}</td>
									            <td>${item.itemNm}</td>
									            <td>${item.itemIsActive == 1 ? 'Y' : 'N'}</td>
									            <td>${item.itemContent}</td>
									        </tr>
									    </c:forEach>
									</c:forEach>
                                </tbody>
                          
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/code/codeList.js"></script>
</body>
</html>
