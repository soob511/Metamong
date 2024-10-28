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
});
