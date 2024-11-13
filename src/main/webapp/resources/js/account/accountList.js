let num = $(".btn-team").data("team-length");
let teams = [];
let teamIndex, updateTeam, teamId;

$(document).ready(function () {
  $(".menu-item").removeClass("active");
  $(".menu-item:eq(1)").addClass("active");
  $(".sub-menu:eq(0)").addClass("active");
  $(".sub-menu:eq(0) .sub-item").removeClass("active");
  $(".sub-menu:eq(0) .sub-item:first").addClass("active");

  // 팀 목록 가져오기
  $(".btn-team").click(function () {
    $.ajax({
      url: "/Metamong/team/getTeamList",
      type: "GET",
      success: function (data) {
        let tHtml = "";
        data.forEach((team) => {
          tHtml += `<tr class="team" data-isupdate="0">
                    <th class="teamId">${team.teamId}</th>
                    <td class="teamName">${team.teamName}</td>
                    <td class="teamIsactive">${
                      team.teamIsactive == 1 ? "Y" : "N"
                    }</td>
                </tr>`;
        });
        $("#teamList").html(tHtml);

        $("#teamList .team").each(function () {
          teams.push({
            teamId: $(this).find(".teamId").text(),
            teamName: $(this).find(".teamName").text(),
            teamIsactive: $(this).find(".teamIsactive").text() === "Y" ? 1 : 0,
            teamIsupdate: 0,
          });
        });
      },
    });
  });

  /* 팀 추가 */
  $(".team-add").click(function () {
    const teamId = Math.max(...teams.map((team) => team.teamId), 0) + 1;
    const teamName = $("#teamName").val();
    const teamIsactive = $("#teamIsactive option:selected").val();

    if (teamCheck(0) != 0) {
      teams.push({
        teamId: teamId,
        teamName: teamName,
        teamIsactive: teamIsactive,
        teamIsupdate: 1,
      });
      console.log("추가", teams);
      teamList();
    }
  });

  $(".btn-search")
    .off("click")
    .on("click", function () {
      accountSearch(1);
    });
  //팀 수정

  $("#teamList").on("click", ".team", function () {
    $(".team").removeClass("table-active");
    $(this).addClass("table-active");
    teamId = $(this).find(".teamId").text();
    const teamName = $(this).find(".teamName").text();
    const teamIsactive = $(this).find(".teamIsactive").text();

    $("#teamName").val(teamName);
    if (teamIsactive === "Y") {
      $("#teamIsactive option:first").prop("selected", true);
    } else {
      $("#teamIsactive option:last").prop("selected", true);
    }

    teamIndex = teams.findIndex((team) => team.teamId === teamId);
    $(".team-edit").prop("disabled", false);
  });

  $(".team-edit").on("click", function () {
    const teamName = $("#teamName").val();
    const teamIsactive = $("#teamIsactive option:selected").val();

    console.log(teamId);
    if (teamCheck(1) != 0) {
      updateTeam = {
        teamId: teamId,
        teamName: teamName,
        teamIsactive: teamIsactive,
        teamIsupdate: 2,
      };
      teams.splice(teamIndex, 1, updateTeam);
      console.log("수정", teams);
      teamList();
    }
  });
});
//수정여부체크
function teamCheck(isEdit) {
  const teamName = $("#teamName").val().trim();
  const teamIsactive = $("#teamIsactive option:selected").val();
  console.log(teamId);
  console.log(teamIsactive);

  let isExist = false;
  for (let i = 0; i < teams.length; i++) {
    if (isEdit == 0) {
      if (teamName == teams[i].teamName) isExist = true;
    } else {
      if (teamName == teams[i].teamName && i != teamIndex) isExist = true;
    }
  }

  if (!teamName) {
    Swal.fire({
      icon: "warning",
      title: "소속명을 입력해주세요.",
    });
    return 0;
  }

  if (isExist) {
    Swal.fire({
      icon: "warning",
      title: "동일한 이름의 팀명이 존재합니다.",
    });
    return 0;
  }
  return 1;
}

function refresh() {
  teamIndex = null;

  $("#teamName").val("");
  $(".team-edit").prop("disabled", true);
  $(".team").removeClass("table-active");
  $("#teamIsactive option:first").prop("selected", true);
}

function teamList() {
  console.log("실행");
  $("#teamList").empty();
  console.log(teams);
  for (let i = 0; i < teams.length; i++) {
    $("#teamList").append(
      `<tr class="team">
                        <th class="teamId">${teams[i].teamId}</th>
                        <td class="teamName">${teams[i].teamName}</td>
                        <td class="teamIsactive">${
                          teams[i].teamIsactive == 1 ? "Y" : "N"
                        }</td>
                    </tr>`
    );
  }
  refresh();
}

$(document).ready(function () {
  $("#submit").click(function () {
    const updatedTeams = teams
      .filter((team) => team.teamIsupdate !== 0)
      .map((team) => ({
        teamId: team.teamId,
        teamName: team.teamName,
        teamIsactive: team.teamIsactive,
        teamIsupdate: team.teamIsupdate,
      }));

    if (updatedTeams.length != 0) {
      $.ajax({
        url: "/Metamong/team/updateTeam",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(updatedTeams),
        success: function (data) {
          Swal.fire({
            icon: "success",
            title: "소속 수정신청이<br/> 완료되었습니다.",
          }).then((result) => {
            $("#teamModal").modal("hide");
          });
        },
      });
    } else {
      console.log("수정되거나 추가된 내용이 없습니다.");
    }
  });

  // 회원 검색
  $("#memberTable").on("click", ".table-row", function () {
    $(".table-row").removeClass("table-active");
    $(this).addClass("table-active");
  });

  $("#memberSearch")
    .off("keydown")
    .on("keydown", function (event) {
      if (event.keyCode === 13) {
        event.preventDefault();
        accountSearch(1);
      }
    });

  $(".bi-search")
    .off("click")
    .on("click", function () {
      accountSearch(1);
    });
});

// 계정 검색 함수
function accountSearch(pageNo) {
  var option = $("#searchSelect").val();
  console.log(option);
  var keyword = $("#memberSearch").val();
  console.log(keyword);

  $.ajax({
    url: "/Metamong/account/accountSearch",
    type: "GET",
    data: { option: option, keyword: keyword, pageNo: pageNo },
    success: function (data) {
      $("#memberList").html(data);
    },
  });
}

// 회원 정보 승인
$(document).ready(function () {
  $(".btn-approve").on("click", function () {
    var mId = $(this).data("m-id");
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
    const pageNo = params.get("pageNo");

    $.ajax({
      url: "/Metamong/account/updateAccount",
      type: "POST",
      data: formData,
      processData: false,
      contentType: false,
      success: function (data) {
        Swal.fire({
          icon: "success",
          title: "회원정보 수정이 완료되었습니다.",
          text: "수정된 사항을 확인해주세요.",
        }).then((result) => {
          if (pageNo) {
            location.href = `/Metamong/account/accountList?pageNo=${pageNo}`;
          } else {
            location.href = `/Metamong/account/accountList`;
          }
        });
      },
    });
  });
});
