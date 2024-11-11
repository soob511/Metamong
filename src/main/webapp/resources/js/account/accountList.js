let teams = [];

$(document).ready(function() {
    $('.menu-team').removeClass('active');
    $('.menu-team:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-team').removeClass('active');
    $('.sub-menu:eq(0) .sub-team:first').addClass('active');

    // 팀 목록 가져오기
 $('.btn-team').click(function() {
        $.ajax({
            url: "/Metamong/team/getTeamList",
            type: "GET",
            success: function(data) {
                let tHtml = "";
                data.forEach((team) => {
                    tHtml += `<tr class="team">
                        <th class="teamId">${team.teamId}</th>
                        <td class="teamName">${team.teamName}</td>
                        <td class="teamIsactive">${team.teamIsactive == 1 ? 'Y' : 'N'}</td>
                    </tr>`;
                });
                $('#teamName').val(teamName);           
                (teamIsActive == 'Y') ? $('#teamIsActive option:first').prop("selected", true) : $('#teamIsActive option:last').prop("selected", true);   
               
                $('#teamList').html(tHtml);
                
                

                $('#teamList .team').each(function() {
                    teams.push({
                        teamId: $(this).find('.teamId').text(),
                        teamName: $(this).find('.teamName').text(),
                        teamIsactive: $(this).find('.teamIsactive').text() === 'Y' ? 1 : 0
                    });
                });
            }
        });
    });
});

    // 팀 항목 클릭 시 오른쪽 폼에 정보 로드
    $('#teamList').on('click', '.team', function() {
        $(".team").removeClass("table-active");
        $(this).addClass("table-active");

        const teamName = $(this).find('.teamName').text();
        const teamIsActive = $(this).find('.teamIsactive').text();

        $('#teamName').val(teamName);
        if (teamIsActive === 'Y') {
            $('#teamIsActive option:first').prop("selected", true);
        } else {
            $('#teamIsActive option:last').prop("selected", true);
        }

        // 버튼 활성화
        $(".team-edit").prop("disabled", false);
    });
    

    // 초기화 시 공백으로 설정
    $('.btn-init').click(function() {
        $('#teamName').val('1'); // 소속명 초기화
        $('#teamIsActive').val('1'); // 사용여부 초기화 (Y 선택)
        $(".team-edit").prop("disabled", true); // 수정 버튼 비활성화
        $(".team").removeClass("table-active");
    });


$('.team-edit').on('click', function() {
	const teamName = $('#teamName').val();
    const teamIsActive = $("#teamIsActive option:selected").val();
    
  
});










  
// 회원 검색
$("#memberTable").on("click", ".table-row", function() {
    $(".table-row").removeClass("table-active");
    $(this).addClass("table-active");
});

$("#memberSearch").off("keydown").on("keydown", function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        accountSearch(1);
    }
});

$('.bi-search').off('click').on('click', function() {
    accountSearch(1);
});

// 계정 검색 함수
function accountSearch(pageNo) {
    var option = $('#searchSelect').val();
    console.log(option);
    var keyword = $('#memberSearch').val();
    console.log(keyword);

    $.ajax({
        url: "/Metamong/account/accountSearch",
        type: "GET",
        data: { option: option, keyword: keyword, pageNo: pageNo },
        success: function(data) {
            $('#memberList').html(data);
        }
    });
}

// 회원 정보 승인
$(".btn-approve").on("click", function() {
    var mId = $(this).data('m-id');
    var mRole = $(`#mRole-${mId}`).val();
    var teamName = $(`#teamName-${mId}`).val();
    var mEmpId = $(`#mEmpId-${mId}`).val();
    var mTel = $(`#mTel-${mId}`).val();
    var mIsactive = $(`#mIsactive-${mId} option:selected`).val();

    var formData = new FormData();
    formData.append("mId", mId);
    formData.append("mRole", mRole);
    formData.append("teamName", teamName);
    formData.append("mEmpId", mEmpId);
    formData.append("mTel", mTel);
    formData.append("mIsactive", mIsactive);

    if (!mEmpId || !mTel) {
        Swal.fire({
            icon: "warning",
            title: "필수내역을 공란없이<br/>입력해 주세요.",
            text: "필수입력사항: 사번, 연락처",
        });
        return;
    }

    const params = new URLSearchParams(window.location.search);
    const pageNo = params.get('pageNo');

    $.ajax({
        url: "/Metamong/account/updateAccount",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(data) {
            Swal.fire({
                icon: 'success',
                title: '회원정보 수정이 완료되었습니다.',
                text: '수정된 사항을 확인해주세요.'
            }).then(result => {
                if (pageNo) {
                    location.href = `/Metamong/account/accountList?pageNo=${pageNo}`;
                } else {
                    location.href = `/Metamong/account/accountList`;
                }
            });
        }
    });
});
