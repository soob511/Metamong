$(document).ready(function() {
	$('.toggle-menu').click(function(e) {
        e.preventDefault();
        $(this).siblings('.sub-menu').toggleClass('active');
    });
});
