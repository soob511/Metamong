$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(1)').addClass('active');
    
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
