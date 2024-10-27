$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');
    
    const codes = $('#codeTable tbody tr');
    const items = $('#itemTable tbody tr');
    
    // codeNo에 따른 항목 내역 출력
    items.hide();    
    $('.no-code').show();
    
    $('.code-row').click(function() {
        let clickedCode = $(this).data('code-no'); 
        
        items.hide();
        items.filter(function() {
            return $(this).find('th').text() == clickedCode;
        }).show();
    });
    
    // 사용여부(Y/N) 필터값에 따른 코드 내역 출력
    $('#useSelect').change(function() {
        items.hide();    
        $('.no-code').show();
        
        const useYn = $(this).val();
        codes.each(function() {
            const isActive = $(this).data('is-active');
            if(useYn == '2') codes.show();
            else {isActive == useYn ? $(this).show() : $(this).hide();}
            
        });
    });
});