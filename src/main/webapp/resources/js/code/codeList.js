$(document).ready(function () {
    $(".menu-item").removeClass("active");
    $(".menu-item:eq(1)").addClass("active");
    $(".sub-menu:eq(0)").addClass("active");
    $(".sub-menu:eq(0) .sub-item").removeClass("active");
    $(".sub-menu:eq(0) .sub-item:first").addClass("active");

    $(".bi-search").on("click", function () {
        searchCode();
    });

    $("#codeNameSearch").on("keydown", function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            searchCode();
        }
    });

    $("#useSelect").on("change", function () {
        searchCode();
    });

    $("#codeList").on("click", ".code-row", function () {
        $(".code-row").removeClass("table-active");
        $(this).addClass("table-active");
    });

    $(".btn-edit").on('click', function () {
        let codeNo = $('.table-active').data('code-no');
        if (!codeNo) {
            Swal.fire({
                icon: 'warning',
                title: '수정할 코드를<br/>선택해 주세요.'
            });
        } else {
            $.ajax({
                url: "/Metamong/code/codeUpdateForm",
                type: "GET",
                data: { codeNo: codeNo, isUpdated: 0 },
                success: function (data) {
                    location.href = "/Metamong/code/codeUpdateForm?codeNo=" + codeNo + "&isUpdated=0";
                }
            });
        }
    });

    /* EXCEL 업로드 */
    $('#fileInput').change(function () {
        let file = $('#fileInput')[0].files[0];

        let formData = new FormData();
        formData.append('file', file);

        $.ajax({
            url: "/Metamong/code/codeApplyExcel",
            type: "POST",
            data: formData,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            success: function (data) {
                let cHtml = "";
                let iHtml = `<tr class="no-file"><th colspan="5">코드를 선택해 주세요.</th></tr>`;

                data.codeList.forEach((code) => {
                    cHtml += `<tr class="code-row" onclick="getExcelItems(${code.id})">
                        <th>${code.id}</th>
                        <td>${code.codeNm}</td>
                        <td>${code.codeId}</td>
                        <td>${code.codeLength}</td>
                        <td>${code.codeContent}</td>
                    </tr>`;
                });

                data.itemList.forEach((item) => {
                    iHtml += `<tr class="code-row" style="display: none;">
                        <th>${item.id}</th>
                        <td>${item.itemId}</td>
                        <td>${item.itemNm}</td>
                        <td>${item.itemContent}</td>
                    </tr>`;
                });

                $('.excel-codes').html(cHtml);
                $('.excel-items').html(iHtml);
            },
            error: function (error) {
                Swal.fire({
                    icon: 'error',
                    title: '파일 업로드에<br/>실패했습니다.'
                });
            }
        });
    });
});

function getExcelItems(id) {
    $('.no-file').hide();
    $('.excel-items .code-row').each(function () {
        let clickId = $(this).find('th').text();
        (clickId == id) ? $(this).show() : $(this).hide();
    });
}

function searchCode() {
    let keyword = $("#codeNameSearch").val().trim();
    let option = $("#useSelect option:selected").val();

    $.ajax({
        url: "/Metamong/code/codeSearch",
        type: "GET",
        data: { keyword: keyword, option: option },
        success: function (data) {
            let cHtml = "";
            let iHtml = `<tr class="no-item"><td colspan="5">코드를 선택해 주세요.</td></tr>`;
            if (data.length > 0) {
                let count = 0;
                data.forEach((code) => {
                    cHtml += `<tr class="code-row" onclick="showItemList(${code.codeNo})">
                        <th>${code.codeNo}</th>
                        <td>${code.codeNm}</td>
                        <td>${code.codeId}</td>
                        <td>${code.codeIsActive == 1 ? "Y" : "N"}</td>
                        <td>${code.codeContent}</td>
                    </tr>`;
                });
            } else {
                cHtml += `<tr class="no-code"><th colspan="6">조건에 맞는 코드가 없습니다.</th></tr>`;
            }
            $("#codeList").html(cHtml);
            $("#itemList").html(iHtml);
        },
    });
}

function showItemList(codeNo) {
    $.ajax({
        url: "/Metamong/item/itemList",
        type: "GET",
        data: { codeNo: codeNo },
        success: function (data) {
            let html = " ";
            let count = 0;
            data.forEach((item) => {
                html += `<tr>
                    <td>${++count}</td>
                    <td>${item.itemId}</td>
                    <td>${item.itemNm}</td>
                    <td>${item.itemIsActive == 1 ? "Y" : "N"}</td>
                    <td>${item.itemContent}</td>
                </tr>`;
            });
            $("#itemList").html(html);
        },
    });
}