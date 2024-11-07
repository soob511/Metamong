$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');
});

$("#memberTable").on("click", ".table-row", function() {
    $(".table-row").removeClass("table-active");
    $(this).addClass("table-active");
});

$("#memberSearch").off("keydown").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        accountSearch(1);
    }
});

$('.bi-search').off('click').on('click', function() {
    accountSearch(1);
});

function accountSearch(pageNo){
	
	var option = $('#searchSelect').val();
	console.log(option);
	var keyword = $('#memberSearch').val();
	console.log(keyword);
	
	$.ajax({
		url:"/Metamong/account/accountSearch",
		type:"GET",	
		data:{option : option, keyword : keyword , pageNo : pageNo},
		success : function(data) {
			$('#memberList').html(data);
			}		
	});
}

$(".btn-approve").on("click", function() {
	var mId = $(this).data('m-id');
	var mRole = $(`#mRole-${mId}`).val();
	var teamName = $(`#teamName-${mId}`).val();
    var mEmpId = $(`#mEmpId-${mId}`).val();
    var mTel = $(`#mTel-${mId}`).val();
    var mIsactive = $(`#mIsactive-${mId} option:selected`).val();
   
	var formData = new FormData();
	formData.append("mId", mId);
	formData.append("mRole", mRole);
	formData.append("teamName", teamName);
	formData.append("mEmpId", mEmpId);
	formData.append("mTel", mTel);
	formData.append("mIsactive", mIsactive);

	if(!mEmpId || !mTel) {
		Swal.fire({
			icon: "warning",
			title: "필수내역을 공란없이<br/>입력해 주세요.",
			text: "필수입력사항: 사번, 연락처",
		});
		return;
	}
	const params = new URLSearchParams(window.location.search);
    const pageNo = params.get('pageNo') ;
    
    $.ajax({
		url:"/Metamong/account/updateAccount",
		type: "POST",
		data: formData,
		processData: false,
        contentType: false,
        success:function(data){
        	Swal.fire({
        		icon: 'success',
        		title: '회원정보 수정이 완료되었습니다.',
        		text: '수정된 사항을 확인해주세요.'
        	}).then(result=>{
        		if(pageNo) {
        			location.href = `/Metamong/account/accountList?pageNo=${pageNo}`;
        		} else {
        			location.href = `/Metamong/account/accountList`;
        		}
        	})
        }
	})
}) 