$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(1)').addClass('active');
    
    $(".bi-search").on("click", function() {
    	searchSequence();
    });


    $("#sequenceNameSearch").on("keydown", function(event) {
        if (event.keyCode === 13) { 
        	 event.preventDefault()
            searchSequence();
        }
    });
    
    $("#schemaSelect").on("change", function() {
    	searchSequence();
    });
});

/*function searchSequence() {
    const schema = document.getElementById("schemaSelect").value;
    const keyword = document.getElementById("sequenceNameSearch").value;

    // AJAX 요청을 통해 서버로 데이터 전송
    $.ajax({
        url: '/Metamong/sequence/searchSequnce',
        type: 'GET',
        data: {
            schema: schema,
            keyword: keyword
        },
        success: function(response) {
            // 서버 응답 처리 (필요 시 테이블 갱신 등 추가 로직 작성)
            console.log("검색 결과:", response);
            // 예: 테이블 내용 업데이트 함수 호출
        },
        error: function(error) {
            console.error("검색 중 오류 발생:", error);
        }
    });
}*/