$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');
    
    $(".bi-search").on("click", function() {
        searchCode();
    });

    $("#codeNameSearch").on("keydown", function(e) {
        if (e.keyCode === 13) { 
        	e.preventDefault()
            searchCode();
        }
    });
    
    $("#useSelect").on("change", function() {
    	searchCode();
    });
});

function searchCode() {
	let keyword = $("#codeNameSearch").val().trim();
    let option = $("#useSelect option:selected").val();

    $.ajax({
        url: "/Metamong/code/codeSearch",
        type: "GET",
        data: { keyword: keyword, option: option},
        success: function(data) {
        	console.log(keyword, option);
        	console.log(data);
        	
        	let cHtml = "";
        	let iHtml=`<tr class="no-item"><th colspan="5">코드를 선택해 주세요.</th></tr>`; 
        	if(data.length>0){
        		let count = 0;
        		data.forEach(code => {
        			cHtml += `<tr onclick="showItemList(${code.codeNo})">
        			    <th>${code.codeNo}</th>
        			    <td>${code.codeNm}</td>
        			    <td>${code.codeId}</td>
        			    <td>${code.codeIsActive == 1 ? 'Y' : 'N'}</td>
        			    <td>${code.codeContent}</td>
        			    <td>
        			        <a href="codeUpdateForm">
        			            <button class="btn-edit">수정</button>
        			        </a>
        			    </td>
        			</tr>`;
        		});
        	} else{
        		cHtml += `<tr class="no-code"><th colspan="6">조건에 맞는 코드가 없습니다.</th></tr>`;
        	}
            $('#codeList').html(cHtml);
            $('#itemList').html(iHtml);
        }
    });
}

function showItemList(codeNo) {
    $.ajax({
        url: "/Metamong/item/itemList",      
        type: "GET",
        data: {codeNo: codeNo},   
        success: function(data) {
        	console.log(data);
        	let html=" ";
        	let count = 0;
            data.forEach(item => {
                html += `<tr>
				            <td>${++count}</td>
				            <td>${item.itemId}</td>
				            <td>${item.itemNm}</td>
				            <td>${item.itemIsActive == 1 ? 'Y' : 'N'}</td>
				            <td>${item.itemContent}</td>
                        </tr>`;
            });
            $('#itemList').html(html);
        }
    });
}