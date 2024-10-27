$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');
    
    $('#itemTable tbody tr').hide();
    $('#itemTable tbody tr').filter(function() {
        return $(this).find('th').text() == 1;
    }).show();
    
    $('.code-row').click(function() {
        let clickedCode = $(this).data('code-no'); 
        
        $('#itemTable tbody tr').hide();
        $('#itemTable tbody tr').filter(function() {
            return $(this).find('th').text() == clickedCode;
        }).show();
    });
});