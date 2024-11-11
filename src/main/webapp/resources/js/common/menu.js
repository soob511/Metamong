$(document).ready(function() {
	$('.toggle-menu').click(function(e) {
        e.preventDefault();
        $(this).siblings('.sub-menu').toggleClass('active');
    });
});

function handleFileUpload(event) {
	
	const mid = $('#fileInputProf').data('m-id');
    const file = event.target.files[0]; // 선택된 파일
    if(!file) return;
    
    const formData = new FormData();
    formData.append("MId", mid); 
    formData.append("profFile", file);
    
    $.ajax({
        url: "/Metamong/member/updateProf",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            if (data > 0) { 
                Swal.fire({
                    icon: 'success',
                    title: '프로필이 성공적으로 변경되었습니다.',
                }).then(() => {
                    location.reload(); 
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '업데이트 실패',
                    text: '다시 시도해 주세요.',
                });
            }
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                title: '오류 발생',
                text: '프로필 업데이트 중 오류가 발생했습니다. 다시 시도해 주세요.',
            });
        }
    });
}

$(document).ready(function() {
    $('#deleteProfile').on('click', function() {
        $('#deleteProf').val("1");  
        $('#existingProf').hide();  
        Swal.fire({
            icon: 'warning',
            title: '기본 이미지로 변경됩니다.',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                
            	const mid = $('#fileInput').data('m-id');
               const deleteProf = $("#deleteProf").val();

                const formData = new FormData();
                formData.append("MId", mid); 
                formData.append("deleteProf", deleteProf);

                
                $.ajax({
                    url: "/Metamong/member/deleteProf",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data > 0) { 
                            Swal.fire({
                                icon: 'success',
                                title: '기본이미지로 변경되었습니다.',
                            }).then(() => {
                                location.reload(); 
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: '업데이트 실패',
                                text: '다시 시도해 주세요.',
                            });
                        }
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: '오류 발생',
                            text: '프로필 업데이트 중 오류가 발생했습니다. 다시 시도해 주세요.',
                        });
                    }
                });
            }
        });
    });
});
