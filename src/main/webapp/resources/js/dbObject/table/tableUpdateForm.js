$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:first').addClass('active');
    
    $(".btn-update").prop("disabled", true);
    
    $("#columnList").on("click", ".checkTr", function() {
	    $(".checkTr").removeClass("table-active");
	    $(this).addClass("table-active");
	    
	    const colNm = $(this).find("td:eq(1)").text();
        const colId = $(this).find("td:eq(2)").text();
        const dataType = $(this).find("td:eq(3)").text();
        const colLength = $(this).find("td:eq(4)").text();
        const colIsnullable = $(this).find("td:eq(5)").text();
        const colPk = $(this).find("td:eq(6)").text();
        
        $("#colNm").val(colNm);
        $("#colId").val(colId);
        $("#dataType").val(dataType);
        $("#dataLength").val(colLength);
        $("#nullable").val(colNullable);
        $("#isUse").val(colPk);

        $(".btn-update").prop("disabled", false);
	});
    
    const pkSelect = $("#isUse");
    const nullableSelect = $("#nullable");


    function updateNullableSelect() {
        if (pkSelect.val() === "Y") {
            nullableSelect.val("NOTNULL");
            nullableSelect.prop("disabled", true);
        } else {
            nullableSelect.prop("disabled", false);
        }
    }
    
    updateNullableSelect();

    pkSelect.on("change", function() {
    	updateNullableSelect();
    });
    
    function resetAndDisableButton() {
    	console.log("실행");
    	$("#itemForm")[0].reset();
        $("#columnList tr").removeClass("selected");
        $(".btn-update").prop("disabled", true);
        $(".checkTr").removeClass("table-active");
        $("#colNm").prop("disabled", false);
        $("#colId").prop("disabled", false);
        updateNullableSelect();
    }
    
    $.ajax({
        url: "/Metamong/dataType/dataTypeList",
        type: "GET",
        dataType: "json",
        success: function(data) {
        		console.log(data);
        		var selectBox = $('#dataType');
        		$.each(data, function(index, dataType) {
        			selectBox.append($('<option>', {
        				value: dataType.dataType,
        				text: dataType.dataType
        			}));
        		});	
        }
    });
    
    $(".btn-reset").on("click", function() {
    	resetAndDisableButton();
    });

    $(".btn-load").on("click", function() {
        $.ajax({
            url: "/Metamong/code/codeLoad",
            type: "GET",
            success: function(data) {
                var html = "";
                var count = 0;
                data.forEach(code => {
                    html += `<tr class="code-row" data-code-nm="${code.codeNm}" data-code-id="${code.codeId}" data-code-length="${code.codeLength}">
                                <td>${++count}</td>
                                <td>${code.codeNm}</td>
                                <td>${code.codeId}</td>
                                <td>${code.codeLength}</td>
                                   <td>${code.codeContent != null ? code.codeContent : ''}</td>
                             </tr>`;
                });
                $('#codeList').html(html);
            }	  
        });
    });

    $(".bi-search").on("click", function() {
        searchCode();
    });
    
    $("#codeNameSearch").on("keydown", function(event) {
        if (event.keyCode === 13) { 
            event.preventDefault();
            searchCode();
        }
    });
    
    $(document).on("click", ".code-row", function() {
        const codeNm = $(this).data("code-nm");
        const codeId = $(this).data("code-id");
        const codeLength = $(this).data("code-length");
        
        $("#colNm").val(codeNm);
        $("#colId").val(codeId);
        $("#dataLength").val(codeLength);
        $('#codeLoadModal').modal('hide');
    });

    function searchCode() {
        var keyword = $("#codeNameSearch").val();

        $.ajax({
            url: "/Metamong/code/codeLoadSearch",
            type: "GET",
            data: { keyword: keyword },
            success: function(data) {
                var html = "";
                var cHtml = `<th colspan="7">테이블을 선택해 주세요.</th>`; 

                if (Object.keys(data).length > 0) {
                    var count = 0;
                    data.forEach(code => {
                        html += `<tr class="code-row" data-code-nm="${code.codeNm}" data-code-id="${code.codeId}" data-code-length="${code.codeLength}">
                                    <td>${++count}</td>
                                    <td>${code.codeNm}</td>
                                    <td>${code.codeId}</td>
                                    <td>${code.codeLength}</td>
                                     <td>${code.codeContent != null ? code.codeContent : ''}</td>
                                 </tr>`;
                    });
                } else {
                    html += `<tr>
                                <th colspan="5">해당 조건에 맞는 테이블이 없습니다.</th>
                             </tr>`;
                }

                $('#codeList').html(html);
            }
        });
    }
    $(".btn-add").on("click", function() {
        var colNm = $("#colNm").val();
        var colId = $("#colId").val();
        var dataType = $("#dataType").val(); 
        var colLength = $("#dataLength").val();
        var colIsnullable = $("#nullable").val();
        var colPk = $("#isUse").val();

        if (colNm === "" || colId === "") {
            Swal.fire({
                icon: 'warning',                  
                title: '추가할 내용을 <br/>전부 입력해주세요.'   
            });
        } else {
            // colId 중복 여부 확인
            var isDuplicate = false;
            $("#columnList tr").each(function() {
                if ($(this).find("td:eq(2)").text() === colId) {
                    isDuplicate = true;
                    return false; // 중복이 발견되면 반복문 종료
                }
            });

            if (isDuplicate) {
                Swal.fire({
                    icon: 'warning',
                    title: '이미 존재하는 컬럼(물리)이름입니다.',
                    text: '다른 컬럼(물리)이름를 입력해 주세요.'
                });
            } else {
                // 중복이 없는 경우에만 행 추가
                var rowCount = $("#columnList tr").length + 1;
                
                var newRow = `
                    <tr class="checkTr" data-change="1">
                        <td>${rowCount}</td>
                        <td>${colNm}</td>
                        <td>${colId}</td>
                        <td>${dataType}</td>
                        <td>${colLength}</td>
                        <td>${colIsnullable}</td>
                        <td>${colPk}</td>
                        <td><i class="bi bi-trash3 delete-row"></i></td>
                    </tr>
                `;
                
                $("#columnList").append(newRow);

                // 새로 추가된 행의 data-change 속성 값을 확인
                console.log("New row data-change:", $("#columnList tr:last").attr("data-change"));

                resetAndDisableButton();
            }
        }
    });


    $(".btn-update").on("click", function() {
        var selectedRow = $("#columnList tr.selected");
        if (selectedRow.length) {
            var colNm = $("#colNm").val();
            var colId = $("#colId").val();
            var dataType = $("#dataType").val();
            var colLength = $("#dataLength").val();
            var colIsnullable = $("#nullable").val();
            var colPk = $("#isUse").val();

            if (colNm === "" || colId === "") {
                Swal.fire({
                    icon: 'warning',
                    title: '수정할 내용을 <br/>전부 입력해주세요.'
                });
            } else {
                selectedRow.find("td:eq(1)").text(colNm);
                selectedRow.find("td:eq(2)").text(colId);
                selectedRow.find("td:eq(3)").text(dataType);
                selectedRow.find("td:eq(4)").text(colLength);
                selectedRow.find("td:eq(5)").text(colIsnullable);
                selectedRow.find("td:eq(6)").text(colPk);

                selectedRow.data("change", 1).attr("data-change", 1); 
                console.log("Updated row data-change:", selectedRow.attr("data-change"));

                resetAndDisableButton();
                $(".btn-update").prop("disabled", true);
            }
        } else {
            Swal.fire({
                icon: 'warning',
                title: '수정할 행을<br/> 선택해주세요.'
            });
        }
    });

    $(document).on("click", ".delete-row", function (event) {
        event.stopPropagation(); 
        $(this).closest("tr").remove();
        updateRowNumbers();
        resetAndDisableButton();
    });


    $(document).on("click", "#columnList tr", function () {
    	$(".btn-update").prop("disabled", false);
        $("#columnList tr").removeClass("selected");
        $(this).addClass("selected");
        const colNm = $(this).find("td:eq(1)").text();
        const colId = $(this).find("td:eq(2)").text();
        const dataType = $(this).find("td:eq(3)").text();
        const colLength = $(this).find("td:eq(4)").text();
        const colNullable = $(this).find("td:eq(5)").text();
        const colPk = $(this).find("td:eq(6)").text();

        $("#colNm").val(colNm);
        $("#colId").val(colId);
        $("#dataType").val(dataType);
        $("#dataLength").val(colLength);
        $("#nullable").val(colNullable);
        $("#isUse").val(colPk);
    });

    $("#move-up").on("click", function () {
        var selectedRow = $("#columnList tr.selected");
    	selectedRow.data("change", 1).attr("data-change", 1); 
        if (selectedRow.length && selectedRow.prev().length) {
            selectedRow.prev().before(selectedRow);
            updateRowNumbers();
        }
    });

    $("#move-down").on("click", function () {
        var selectedRow = $("#columnList tr.selected");
    	selectedRow.data("change", 1).attr("data-change", 1); 
        if (selectedRow.length && selectedRow.next().length) {
            selectedRow.next().after(selectedRow);
            updateRowNumbers();
        }
    });


    function updateRowNumbers() {
        $("#columnList tr").each(function (index) {
            $(this).find("td:first").text(index + 1);
        });
    }
    
    
    $(".btn-apply").on("click", function() {
    	var schemaName = $("#schemaName").text();
    	var tableNm = $("#tableNm").text();
    	var tableId = $("#tableId").text();
        var applyReason = $("#applyReason").val();
        var tableContent = $("#tableContent").val();
        var columns = [];
        var applyType = "UPDATE";
        var tableNo = $(".codeAdd-subtitle").data("table-no"); 
        
        $("#columnList tr").each(function() {
            var column = {
                colNm: $(this).find("td:eq(1)").text(),
                colId: $(this).find("td:eq(2)").text(),
                dataType: $(this).find("td:eq(3)").text(),
                colLength: $(this).find("td:eq(4)").text(),
                colIsnullable: $(this).find("td:eq(5)").text(),
                colPk: $(this).find("td:eq(6)").text(),
                colIsupdate: $(this).data("change") 
            };
            columns.push(column);
        });

        if (applyReason === "") {
            Swal.fire({
                icon: 'warning',
                title: '테이블에 관한 내용을 전부 입력해주세요'
            });
        } else if (columns.length === 0) {
            Swal.fire({
                icon: 'warning',
                title: '컬럼을 추가해주세요'
            });
        }    else if (!columns.some(column => column.colPk === "Y")) {
            Swal.fire({
                icon: 'warning',
                title: 'PK가 포함되어야 합니다'
            });
        } else {
        	var tableInfo={
        		schemaName:schemaName,
        		tableNm:tableNm,
        		tableId:tableId,
        		applyReason:applyReason,
        		tableContent:tableContent,
        		columns:columns,
        		applyType:applyType,
        		tableNo:tableNo
        	}
        	console.log(tableInfo);
            $.ajax({
                url: "/Metamong/table/applyTable",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(tableInfo), 
                traditional: true,
                success: function(data) {
                    Swal.fire({
                        icon: 'success',
                        title: '테이블 수정 신청이<br/>완료되었습니다.',
                        text: '신청 승인 후, 테이블이 반영됩니다.'
                    }).then(result => {
                        location.href = "/Metamong/table/tableApplyList";
                    });
                }
            });
        }
    });

    $(".btn-compare").on("click", function() {
        var columns = [];
        var tableNo = $(".codeAdd-subtitle").data("table-no");
        var applyReason = $("#applyReason").val();

        $("#columnList tr").each(function() {
            var column = {
                colNm: $(this).find("td:eq(1)").text(),
                colId: $(this).find("td:eq(2)").text(),
                dataType: $(this).find("td:eq(3)").text(),
                colLength: $(this).find("td:eq(4)").text(),
                colIsnullable: $(this).find("td:eq(5)").text().trim() === "NULL" ? 1 : 0, 
                	colIspk: $(this).find("td:eq(6)").text().trim() === "Y" ? 1 : 0,       
                isChange: $(this).data("change") || "0" 
            };
            columns.push(column);
        });
        
        var data = JSON.stringify({
            tableNo: tableNo,
            columns: columns,
            applyReason:applyReason
        });
        	console.log(columns);
        $.ajax({
            url: "/Metamong/table/tableCompare",
            type: "POST",
            contentType: "application/json",
            data: data,
            success: function(response) {
              location.href=response;
            }
        });
    });



});
