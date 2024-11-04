
$(document).ready(function() {
	var status = parseInt($('#approvalStatus').text());
	var statusText = getStatusText(status);
	$('#approvalStatus').html(statusText);
	
	var isUnique = parseInt($('#isUnique').text());
	var isUniqueText = getUniqueText(isUnique);
	$('#isUnique').html(isUniqueText);
	
	var rejectReason = $('#rejectReason').text().trim();
	console.log(rejectReason);
	console.log(typeof rejectReason);
	var rejectReasonStatus = getRejectReasonStatus(rejectReason);
	$('#rejectReason').html(rejectReasonStatus);
})
    
function getStatusText(approvalStatus) {
    switch (approvalStatus) {
        case 0: return '승인대기';
        case 1: return '승인';
        case 2: return '반려';
        case 3: return '반영';
        default: return '-';
    }
}
    
function getUniqueText(isUnique) {
    switch (isUnique) {
        case 0: return 'N';
        case 1: return 'Y';
        default: return '-';
    }
}

function getRejectReasonStatus(rejectReason) {
    if (rejectReason == '') {
    	return '-';
    } else {
    	return rejectReason;
    }
}