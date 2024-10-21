$(document).ready(function() {
    $('.toggle-menu').on('click', function(e) {
        e.preventDefault();
        $(this).next('.sub-menu').toggleClass('active');
    });
});
