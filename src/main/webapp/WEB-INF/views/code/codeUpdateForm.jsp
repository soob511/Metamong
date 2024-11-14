<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>코드/항목 수정</title>
    <link href="${pageContext.request.contextPath}/resources/css/code/codeAddForm.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
    <div class="container codeAdd-container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/menu.jsp" />
            <div class="col codeAdd-main">
                <jsp:include page="/WEB-INF/views/common/header.jsp" />
                <div class="codeAdd-header">
                    <p class="codeAdd-title">&gt; 코드/항목 수정</p>
                </div>
                <hr>
                <div class="container">
                    <div class="row">
                        <div class="col code">
                            <div class="codeAdd-subtitle" data-code-no="${code.codeNo}">코드</div>
                            <table class="table table-bordered code-table table-container">
                                <tr>
                                    <td class="table-light">코드명(논리)</td>
                                    <td colspan="5"><input type="text" id="codeNm" class="form-control code-input" value="${code.codeNm}" required></td>
                                </tr>
                                <tr>
                                    <td class="table-light">코드명(물리)</td>
                                    <td colspan="5"><input type="text" id="codeId" class="form-control code-input" value="${code.codeId}" required></td>
                                </tr>
                                <tr>
                                    <td class="table-light">코드길이</td>
                                    <td colspan="5"><input type="text" id="codeLength" class="form-control code-input" value="${code.codeLength}" required></td>
                                </tr>
                                <tr>
                                    <td class="table-light">내용</td>
                                    <td colspan="5"><input type="text" id="codeContent" value="${code.codeContent}" class="form-control content-input"></td>
                                </tr>
                                <tr>
                                    <td class="table-light">사용여부</td>
                                    <td colspan="5">
                                        <select id="codeIsActive" class="form-select use-status-select" aria-label="사용 여부 선택">
                                            <option value="1" ${code.codeIsActive == 1 ? 'selected' : null}>Y</option>
                                            <option value="0" ${code.codeIsActive == 0 ? 'selected' : null}>N</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-light">신청사유</td>
                                    <td colspan="5"><input type="text" id="applyReason" class="form-control code-input" value="${!applyReason ? applyReason : null}" required></td>
                                </tr>
                            </table>
                        </div>
                        <div class="col item">
                            <div class="d-flex item-subtitle justify-content-between align-items-center">
                                <div class="itemAdd-subtitle">항목</div>
                                <button class="btn-init btn-normal" type="button">초기화</button>
                            </div>
                            <table class="table table-bordered item-table table-container">
                                <tr>
                                    <td class="table-light">항목코드</td>
                                    <td colspan="5"><input type="text" id="itemId" class="form-control code-input" required></td>
                                </tr>
                                <tr>
                                    <td class="table-light">항목명</td>
                                    <td colspan="5"><input type="text" id="itemNm" class="form-control code-input" required></td>
                                </tr>
                                <tr>
                                    <td class="table-light">내용</td>
                                    <td colspan="5"><input type="text" id="itemContent" class="form-control content-input"></td>
                                </tr>
                                <tr>
                                    <td class="table-light">사용여부</td>
                                    <td colspan="5">
                                        <select id="itemIsActive" class="form-select use-status-select" aria-label="사용 여부 선택">
                                            <option value="1">Y</option>
                                            <option value="0">N</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <div class="button-group">
                                <button id="item-add" class="btn-add btn-accent" type="button">추가</button>
                                <button class="btn-edit btn-accent" type="button" disabled>수정</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item-container">
                    <div class="item-header">항목</div>
                    <div class="update-table-container table-container">
                        <table class="table table-hover bottom-table" style="table-layout: fixed;">
                          <colgroup>
						    <col style="width: 60px;">
						    <col style="width: 290px;">
						    <col style="width: 290px;">
						    <col style="width: 180px;">
						    <col style="width: 420px;">
						  </colgroup>
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">항목코드</th>
                                    <th scope="col">항목명</th>
                                    <th scope="col">사용여부</th>
                                    <th scope="col">내용</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody class="item-list" data-item-length="${itemLength}">
                                <c:forEach items="${items}" var="item" varStatus="i">
                                    <tr class="item ${i.index < itemLength ? 'oldItem' : null}" data-item-isupdate="${item.itemIsUpdate}">
                                        <td class="item-index">${i.index + 1}</td>
                                        <td class="itemId">${item.itemId}</td>
                                        <td class="itemNm">${item.itemNm}</td>
                                        <td class="itemIsActive">${item.itemIsActive == 1 ? 'Y' : 'N'}</td>
                                        <td class="itemContent">${item.itemContent}</td>
                                        <td>${i.index < itemLength ? '-' : '<i class="bi bi-trash3"></i>'}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="button-group">
                    <button class="btn-compare btn-normal" type="button">전/후 비교</button>
                    <button id="code-apply" class="btn-add btn-accent" type="button">신청</button>
                </div>
                <script src="${pageContext.request.contextPath}/resources/js/code/codeUpdateForm.js"></script>
            </div>
        </div>
    </div>
</body>
</html>