$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(1)').addClass('active');
    $('.sub-menu:eq(0)').addClass('active');
    $('.sub-menu:eq(0) .sub-item').removeClass('active');
    $('.sub-menu:eq(0) .sub-item:first').addClass('active');

    const items = [];

    /* 항목 추가 */
    $('#item-add').click(function() {
        const itemId = $('#itemId').val();
        const itemNm = $('#itemNm').val();
        const itemContent = $('#itemContent').val();
        let isExist = false;

        for (let item of items) {
            itemId == item.itemId && (isExist = true);
        }

        if (!itemId || !itemNm) {
            Swal.fire({
                icon: 'warning',
                title: '항목코드 또는 항목명을<br/>입력해주세요.'
            });
            return;
        }

        if (isExist) {
            Swal.fire({
                icon: 'warning',
                title: '동일한 항목코드는<br/>추가할 수 없습니다.'
            });
        } else {
            items.push({ itemId: itemId, itemNm: itemNm, itemContent: itemContent });
            $('#itemId').val('');
            $('#itemNm').val('');
            $('#itemContent').val('');
            itemList();
        }
    });

    /* 항목 삭제 */
    $('.item-list').on('click', '.bi-trash3', function() {
        const itemId = $(this).closest('tr').find('.itemId').text();
        const index = items.findIndex(item => item.itemId === itemId);
        items.splice(index, 1);
        itemList();
    });

    /* 항목 초기화 */
    $('.btn-init').click(function() {
        $('#itemId').val('');
        $('#itemNm').val('');
        $('#itemContent').val('');
    });

    /* 코드, 항목 생성 신청 */
    $('#code-apply').click(function() {
        const codeNm = $('#codeNm').val();
        const codeId = $('#codeId').val();
        const codeContent = $('#codeContent').val();
        const applyReason = $('#applyReason').val();

        let codeData = {
            codeNm: codeNm,
            codeId: codeId,
            codeContent: codeContent,
            applyReason: applyReason,
            items: items
        };

        $.ajax({
            url: "/Metamong/code/addApplyCode",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(codeData),
            traditional: true,
            success: function(data) {
                console.log(data);
                Swal.fire({
                    icon: 'success',
                    title: '코드 생성 신청이<br/>완료되었습니다.',
                    text: '신청 승인 후, 코드 사용가능합니다.'
                }).then(result => {
                    location.href = "/Metamong/code/codeApplyList";
                });
            }
        });
    });

    function itemList() {
        $('.item-list').empty();

        items.forEach((item, index) => {
            $('.item-list').append(
                `<tr class="item">
                    <th>${index + 1}</th>
                    <td class="itemId">${item.itemId}</td>
                    <td class="itemNm">${item.itemNm}</td>
                    <td>Y</td>
                    <td class="itemContent">${item.itemContent ? item.itemContent : '-'}</td>
                    <td><i class="bi bi-trash3"></i></td>
                </tr>`
            );
        });
    }
});