<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>코드/항목 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/code/codeList.css" rel="stylesheet" />
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
                        <select id="useSelect" class="form-select" aria-label="Default select">
                            <option value="2" selected>전체</option>
                            <option value="1">Y</option>
                            <option value="0">N</option>
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
                                </div>
                            </div>
                            <div class="code-table-container">
	                            <table class="table table-hover" id="codeTable">
	                                <thead class="table-primary">
	                                    <tr>
	                                        <th scope="col">No.</th>
	                                        <th scope="col">코드(논리)</th>
	                                        <th scope="col">코드(물리)</th>
	                                        <th scope="col">사용여부</th>
	                                        <th scope="col">내용</th>
	                                        <th scope="col">수정</th>
	                                    </tr>
	                                </thead>
	                                <tbody id="codeList">
	                                <c:forEach items="${codeList}" var="code">
	                                    <tr class="code-row"  onclick="showItemList(${code.codeNo})">
	                                        <th>${code.codeNo}</th>
	                                        <td>${code.codeNm}</td>
	                                        <td>${code.codeId}</td>
	                                        <td>${code.codeIsActive == 1 ? 'Y' : 'N'}</td>
	                                        <td>${code.codeContent}</td>
	                                        <td><a href="codeUpdateForm">
                                        		<button class="btn-edit">수정</button>
                                   			</a></td>
	                                    </tr>
	                                </c:forEach>
	                                </tbody>
	                            </table>
                            </div>
                        </div>

                        <!-- 항목 목록 -->
                        <div class="col-6 item-table">
                            <div class="item-management">
                                <p class="item-management-title">항목</p>
                            </div>
                            <div class="item-table-container">
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
                                <tbody id="itemList">                        
	                                <tr><th colspan="5">코드를 선택해 주세요.</th></tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/code/codeList.js"></script>
</body>
</html>
