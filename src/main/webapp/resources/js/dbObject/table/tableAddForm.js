$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:first').addClass('active');
    
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
                    html += `<tr class="code-row" data-code-nm="${code.codeNm}" data-code-id="${code.codeId}">
                                <td>${++count}</td>
                                <td>${code.codeNm}</td>
                                <td>${code.codeId}</td>
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
        
        $("#colNm").val(codeNm);
        $("#colId").val(codeId);
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
                        html += `<tr class="code-row" data-code-nm="${code.codeNm}" data-code-id="${code.codeId}">
                                    <td>${++count}</td>
                                    <td>${code.codeNm}</td>
                                    <td>${code.codeId}</td>
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
        var colLength = parseInt($("#dataLength").val());
        var colNullable = $("#nullable").val();
        var colPk = $("#isUse").val();
        
        if (colNm === "" || colId === "" || colLength === "") {
        	Swal.fire({
        		  icon: 'warning',                  
        		  title: '내용을 전부 입력해주세요.',    
        		});
        }else{
            var rowCount = $("#columnList tr").length + 1;

            var newRow = `
                <tr>
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
        $("#columnList").append(newRow); // id 선택자 # 추가

        $("#itemForm")[0].reset(); // 입력 필드 초기화
    });

    $(document).on("click", ".delete-row", function() {
        $(this).closest("tr").remove();
    });

});
