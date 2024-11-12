$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(1)').addClass('active');
    
    var myModal = new bootstrap.Modal($('#sequenceApplyModal')[0]);
    myModal.show();
    
    $(".bi-search").on("click", function() {
        searchSequence();
    });

    $("#sequenceNameSearch").on("keydown", function(event) {
        if (event.keyCode === 13) { 
            event.preventDefault();
            searchSequence();
        }
    });
    
    $("#schemaSelect").on("change", function() {
        searchSequence();
    });
    $("#sequenceApply").on("click", function(event) {
        const sequenceName = $("#seqName").val().trim();
        const schemaName = $("#schemaInput").val();
        const Type = $("#typeInput").val();
        const applyReason = $("#seqReason").val().trim();
        const fileInput = $("#inputGroupFile")[0].files[0]; 
        console.log(Type);
   
        if (!seqName || !seqReason || !fileInput) {
            Swal.fire({
                icon: 'warning',
                title: '모든 내용을 입력해 주세요',
            });
        } else {
        
            const formData = new FormData();
            formData.append("sequenceName", sequenceName);
            formData.append("schemaName", schemaName);
            formData.append("Type", Type);
            formData.append("applyReason", applyReason);
            formData.append("file", fileInput);

      
            $.ajax({
                url: '/Metamong/sequence/applySequence',
                type: 'POST',
                data: formData,
                contentType: false, 
                processData: false, 
                success: function(response) {
                    Swal.fire({
                        icon: 'success',
                        title: '시퀀스신청이<br/> 완료되었습니다'
                    }).then(() => {

                        $('#sequenceApplyModal').modal('hide');
                        location.href = response;
                    });
                }
            });
        }
    });
});

function searchSequence() {
    const schema = document.getElementById("schemaSelect").value;
    const keyword = document.getElementById("sequenceNameSearch").value.toUpperCase();

    $.ajax({
        url: '/Metamong/sequence/searchSequence',
        type: 'GET',
        dataType: 'json', 
        data: {
            schema: schema,
            keyword: keyword
        },
        success: function(response) {
            let html = "";
            response.forEach((sequence, index) => {
                html += `
                    <tr>
                        <th>${index + 1}</th>
                        <td>${sequence.sequenceName}</td>
                        <td>${sequence.schemaName}</td>
                        <td>${sequence.minValue}</td>
                        <td>${sequence.maxValue}</td>
                        <td>${sequence.incrementBy}</td>
                        <td>${sequence.lastNumber}</td>
                    </tr>
                `;
            });
            $("#searchSequenceList").html(html);
        }
    });
}
function cancelFile() {
    // 파일 링크 숨기기
    document.getElementById("fileLink").style.display = "none";
    
    // 파일 input 표시
    document.getElementById("inputGroupFile").style.display = "block";
}