$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:first').addClass('active');
    
    
    $("#columnList").on("click", ".checkTr", function() {
	    $(".checkTr").removeClass("table-active");
	    $(this).addClass("table-active");
	});
    
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
        $("#itemForm")[0].reset(); 
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
                                <td>${code.codeContent}</td>
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
                                    <td>${code.codeContent}</td>
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
        var colNullable = $("#nullable").val();
        var colPk = $("#isUse").val();
        console.log(colLength);
        if (colNm === "" || colId === ""|| colLength === "") {
        	Swal.fire({
        		  icon: 'warning',                  
        		  title: '추가할 내용을 <br/>전부 입력해주세요.',    
        		});
        }else{
            var rowCount = $("#columnList tr").length + 1;

            var newRow = `
                 <tr class="checkTr">
                    <td>${rowCount}</td>
                    <td>${colNm}</td>
                    <td>${colId}</td>
                    <td>${dataType}</td>
                    <td>${colLength}</td>
                    <td>${colNullable}</td>
                    <td>${colPk}</td>
                    <td><i class="bi bi-trash3 delete-row"></i></td>
                </tr>
            `;
        }
        $("#columnList").append(newRow); 

        $("#itemForm")[0].reset(); 
    });

    $(document).on("click", ".delete-row", function () {
        $(this).closest("tr").remove();
        updateRowNumbers();
    });

    $("#move-up").on("click", function () {
        var selectedRow = $("#columnList tr.selected");
        if (selectedRow.length && selectedRow.prev().length) {
            selectedRow.prev().before(selectedRow);
            updateRowNumbers();
        }
    });

    $("#move-down").on("click", function () {
        var selectedRow = $("#columnList tr.selected");
        if (selectedRow.length && selectedRow.next().length) {
            selectedRow.next().after(selectedRow);
            updateRowNumbers();
        }
    });

    $(document).on("click", "#columnList tr", function () {
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

    function updateRowNumbers() {
        $("#columnList tr").each(function (index) {
            $(this).find("td:first").text(index + 1);
        });
    }
    
    $(".btn-update").on("click", function () {
        var selectedRow = $("#columnList tr.selected");
        if (selectedRow.length) {
            var colNm = $("#colNm").val();
            var colId = $("#colId").val();
            var dataType = $("#dataType").val();
            var colLength =$("#dataLength").val();
            var colNullable = $("#nullable").val();
            var colPk = $("#isUse").val();

            if (colNm === "" || colId === "" || colLength === "") {
                Swal.fire({
                    icon: 'warning',
                    title: '수정할 내용을 <br/>전부 입력해주세요.'
                });
            } else {
                selectedRow.find("td:eq(1)").text(colNm);
                selectedRow.find("td:eq(2)").text(colId);
                selectedRow.find("td:eq(3)").text(dataType);
                selectedRow.find("td:eq(4)").text(colLength);
                selectedRow.find("td:eq(5)").text(colNullable);
                selectedRow.find("td:eq(6)").text(colPk);

                $("#itemForm")[0].reset();
                selectedRow.removeClass("selected"); 
            }
        } else {
            Swal.fire({
                icon: 'warning',
                title: '수정할 행을<br/> 선택해주세요.'
            });
        }
    });
    
    $(".btn-apply").on("click", function() {
    	var schemaName = $("#schemaSelect option:selected").data("name");
        var tableNm = $("#tableNm").val();
        var tableId = $("#tableId").val();
        var applyReason = $("#applyReason").val();
        var tableContent = $("#tableContent").val();
        var columns = [];
        
        var applyType = "CREATE";
        

        $("#columnList tr").each(function() {
            var column = {
                colNm: $(this).find("td:eq(1)").text(),
                colId: $(this).find("td:eq(2)").text(),
                dataType: $(this).find("td:eq(3)").text(),
                colLength: $(this).find("td:eq(4)").text(),
                colNullable: $(this).find("td:eq(5)").text(),
                colPk: $(this).find("td:eq(6)").text()
            };
            columns.push(column);
        });

        if (tableNm === "" || tableId === "" || applyReason === "") {
            Swal.fire({
                icon: 'warning',
                title: '테이블에 관한 내용을 전부 입력해주세요'
            });
        } else if (columns.length === 0) {
            Swal.fire({
                icon: 'warning',
                title: '컬럼을 추가해주세요'
            });
        } else {
        	var tableInfo={
        		schemaName:schemaName,
        		tableNm:tableNm,
        		tableId:tableId,
        		applyReason:applyReason,
        		tableContent:tableContent,
        		columns:columns,
        		applyType:applyType	
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
                        title: '테이블 생성 신청이<br/>완료되었습니다.',
                        text: '신청 승인 후, 테이블이 반영됩니다.'
                    }).then(result => {
                        location.href = "/Metamong/table/tableApplyList";
                    });
                }
            });
        }
    });


});
