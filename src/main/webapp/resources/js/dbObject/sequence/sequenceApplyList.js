$(document).ready(function() {
	$('.nav-link').removeClass('active');
	$('.nav-link:eq(1)').addClass('active');
	$('.menu-item').removeClass('active');
	$('.menu-item:eq(2)').addClass('active');
	$('.sub-menu:eq(1)').addClass('active');
	$('.sub-menu:eq(1) .sub-item').removeClass('active');
	$('.sub-menu:eq(1) .sub-item:eq(3)').addClass('active');

	$(".bi-search").on("click", function() {
		sequenceApplySearch(1);
	})

	$("#tableNameSearch").on("keydown", function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			sequenceApplySearch(1);
		}
	});

	$("#statusSelect").on("change", function() {
		sequenceApplySearch(1);
	});

	$("#schemaSelect").on("change", function() {
		sequenceApplySearch(1);
	});

});

function sequenceApplySearch(pageNo) {
	console.log("실행");
	var keyword = $("#tableNameSearch").val().toUpperCase();
	var schema = $("#schemaSelect").val();
	var status = $("#statusSelect option:selected").data("name");
	console.log(pageNo);
	var searchData = {
		keyword : keyword,
		schema : schema,
		status : status,
		pageNo : pageNo
	};
	console.log(searchData);
	$.ajax({
		url : "/Metamong/sequence/sequenceApplySearch",
		type : "GET",
		data : searchData,
		success : function(data) {
			$('#searchSequenceList').html(data);
		}
	})
}
