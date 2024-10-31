$(document).ready(function () {
  $(".menu-item").removeClass("active");
  $(".menu-item:eq(1)").addClass("active");
  $(".sub-menu:eq(0)").addClass("active");
  $(".sub-menu:eq(0) .sub-item").removeClass("active");
  $(".sub-menu:eq(0) .sub-item:first").addClass("active");

  const items = [];

  /* 항목 추가 */
  $("#item-add").click(function () {
    const itemId = $("#itemId").val().trim();
    const itemNm = $("#itemNm").val().trim();
    const itemContent = $("#itemContent").val().trim();

    if (itemCheck(0) != 0) {
      items.push({ itemId: itemId, itemNm: itemNm, itemContent: itemContent });
      itemList();
    }
  });

  /* 항목 수정 */
  let itemIndex, updateItem;

  $(".item-list").on("click", ".item", function () {
    const itemId = $(this).find(".itemId").text();
    const itemNm = $(this).find(".itemNm").text();
    const itemContent = $(this).find(".itemContent").text();

    $("#itemId").val(itemId);
    $("#itemNm").val(itemNm);
    $("#itemContent").val(itemContent);

    itemIndex = items.findIndex((item) => item.itemId === itemId);
    $(".btn-edit").prop("disabled", false);
  });

  $(".btn-edit").on("click", function () {
    const itemId = $("#itemId").val().trim();
    const itemNm = $("#itemNm").val().trim();
    const itemContent = $("#itemContent").val().trim();

    if (itemCheck(1) != 0) {
      updateItem = { itemId: itemId, itemNm: itemNm, itemContent: itemContent };
      items.splice(itemIndex, 1, updateItem);
      itemList();
    }
  });

  /* 항목 삭제 */
  $(".item-list").on("click", ".bi-trash3", function (e) {
    e.stopPropagation();
    const itemId = $(this).closest("tr").find(".itemId").text();
    const index = items.findIndex((item) => item.itemId === itemId);
    items.splice(index, 1);
    itemList();
  });

  /* 항목 초기화 */
  $(".btn-init").click(function () {
    refresh();
  });

  /* 코드, 항목 생성 신청 */
  $("#code-apply").click(function () {
    const codeNm = $("#codeNm").val().trim();
    const codeId = $("#codeId").val().trim();
    const codeLength = $("#codeLength").val().trim();
    const codeContent = $("#codeContent").val().trim();
    const applyReason = $("#applyReason").val().trim();

    let codeData = {
      codeNm: codeNm,
      codeId: codeId,
      codeLength: codeLength,
      codeContent: codeContent,
      applyReason: applyReason,
      items: items,
    };

    if (!codeNm || !codeId || !codeLength || !applyReason) {
      Swal.fire({
        icon: "warning",
        title: "필수내역을 공란없이<br/>입력해 주세요.",
        text: "필수입력사항: 코드명(논리/물리), 코드길이, 신청사유",
      });
      return;
    }

    $.ajax({
      url: "/Metamong/code/addApplyCode",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(codeData),
      traditional: true,
      success: function (data) {
        console.log(data);
        Swal.fire({
          icon: "success",
          title: "코드/항목 생성 신청이<br/>완료되었습니다.",
          text: "신청 승인 후, 코드 사용이 가능합니다.",
        }).then((result) => {
          location.href = "/Metamong/code/codeApplyList";
        });
      },
    });
  });

  function itemCheck(isEdit) {
    const itemId = $("#itemId").val().trim();
    const itemNm = $("#itemNm").val().trim();

    let isExist = false;
    for (let i = 0; i < items.length; i++) {
      if (isEdit == 0) {
        if (itemId == items[i].itemId) isExist = true;
      } else {
        if (itemId == items[i].itemId && i != itemIndex) isExist = true;
      }
    }

    if (!itemId || !itemNm) {
      Swal.fire({
        icon: "warning",
        title: "항목코드 또는 항목명을<br/>입력해주세요.",
      });
      return 0;
    }

    if (isExist) {
      Swal.fire({
        icon: "warning",
        title: "동일한 이름의 항목코드가<br/>존재합니다.",
      });
      return 0;
    }
  }

  function refresh() {
    $("#itemId").val("");
    $("#itemNm").val("");
    $("#itemContent").val("");
    $(".btn-edit").prop("disabled", true);
    itemIndex = null;
  }

  function itemList() {
    $(".item-list").empty();

    items.forEach((item, index) => {
      $(".item-list").append(
        `<tr class="item">
                    <th>${index + 1}</th>
                    <td class="itemId">${item.itemId}</td>
                    <td class="itemNm">${item.itemNm}</td>
                    <td>Y</td>
                    <td class="itemContent">${
                      item.itemContent ? item.itemContent : "-"
                    }</td>
                    <td><i class="bi bi-trash3"></i></td>
                </tr>`
      );
    });
    refresh();
  }
});
