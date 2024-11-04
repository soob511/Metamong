$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(4)').addClass('active');
});

$("#memberSearch").on("keydown", function(event) {
    if (event.keyCode === 13) { 
        event.preventDefault();
        memberSearch();
    }
});


$('.bi-search').on('click', function() {
	memberSearch();
});

function memberSearch(){
	var option = $('#schemaSelect').val();
	console.log(option);
	var keyword = $('#memberSearch').val();
	console.log(keyword);
	
	$.ajax({
		url:"/Metamong/member/memberSearch",
		type:"GET",		
		data:{option : option, keyword : keyword},
		success : function(data) {
			console.log(data);
			var html = "";
			
			if(Object.keys(data).length>0){
				var count=0;
				data.forEach(member => {
					html += `<tr>
						<td>${++count}</td>
						<td>${member.MId}</td>
						<td>${member.MName}</td>
						<td>${member.MRole}</td>
						<td>${member.teamName}</td>
						<td>${member.MEmpId}</td>
						<td>${member.MTel}</td>
						</tr>`;
				});
			}else{
				html+=`<tr>
						<th colspan="8">검색 결과가 없습니다.</th>
					   </tr>`;
			}	
			$('#memberList').html(html);			
			$('#memberCount').text(count);
			}		
	});
}