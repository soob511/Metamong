$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');
    
    const codes = $('#codeTable tbody tr');
    const items = $('#itemTable tbody tr');
    
    items.hide();    
    $('.no-code').show();
    $('.no-match').hide();
    
    // codeNo에 따른 항목 내역 출력
    $('.code-row').click(function() {
        let clickedCode = $(this).data('code-no'); 
        
        items.hide();
        items.filter(function() {
            return $(this).find('th').text() == clickedCode;
        }).show();
    });
    
    // 사용여부(Y/N) 필터값에 따른 코드 내역 출력
    $('#useSelect').change(function() {
        const useYn = $(this).val();
        items.hide();    
        $('.no-code').show();
        
        filterCodes();
    });

    // 검색어에 따른 코드 내역 출력
    $('#codeNameSearch').on('input', function() {
    	items.hide();    
        $('.no-code').show();
        
        filterCodes();
    });

    function filterCodes() {
        const keyword = $('#codeNameSearch').val().toLowerCase();
        const useYn = $('#useSelect').val();
        let result = false;
        
        codes.each(function() {
            const codeNm = $(this).find('td:eq(0)').text().toLowerCase();
            const codeId = $(this).find('td:eq(1)').text().toLowerCase();
            const isActive = $(this).data('is-active');

            const isKeyword = codeNm.includes(keyword) || codeId.includes(keyword);
            const isUseYn = (useYn === '2' || isActive == useYn);
            
            if (isKeyword && isUseYn) {
                $(this).show();
                result = true;
            } else {
                $(this).hide();
            }
          
           !result ? $('.no-match').show(): $('.no-match').hide();
        });
    }
});