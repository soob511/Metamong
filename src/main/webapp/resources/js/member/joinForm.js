$(".btn-join").on("click", function () {
  var MId = $("#MId").val();
  var MPassword = $("#MPassword").val();
  var MName = $("#MName").val();
  var TeamId = parseInt($("#teamId").val());
  var MEmpId = $("#MEmpId").val();
  var MTel = $("#MTel").val();
  var MRole = $("input[name='MRole']:checked").val();

  var joinData = {
    MId: MId,
    MPassword: MPassword,
    MName: MName,
    TeamId: TeamId,
    MEmpId: MEmpId,
    MTel: MTel,
    MRole: MRole,
  };

  console.log(joinData);
  console.log(JSON.stringify(joinData));
  $.ajax({
    url: "/Metamong/member/join",
    type: "POST",
    contentType: "application/json; charset=UTF-8",
    data: JSON.stringify(joinData),
    success: function (response) {
      if (response > 0) {
        console.log("성공");
      } else {
        console.log("실패");
      }
    },
  });
});
