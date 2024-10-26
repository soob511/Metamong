$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:eq(2)').addClass('active');
    $('.sub-menu:eq(1)').addClass('active');
    $('.sub-menu:eq(1) .sub-item').removeClass('active');
    $('.sub-menu:eq(1) .sub-item:eq(2)').addClass('active');
    
	$(document).on('click', '#biSearch', function() {

		const schemaName = $('#schemaSelect').val();
		const indexName = $('#indexNameSearch').val();
		console.log(schemaName);
		console.log(typeof schemaName);
		console.log(indexName);
		console.log(typeof indexName);

		$.ajax({
			type : 'GET',
			url : 'searchIndex',
			data : {
				schemaName : schemaName,
				indexName : indexName
			},
			success : function(data) {
				console.log('성공?: ');
				 let html = '';
				 let count = 1;
		            data.forEach(function(index) {
		                html += `
		                    <tr>
		                        <th>${count++}</th>
		                        <td>${index.indexName}</td>
		                        <td>${index.schemaName}</td>
		                        <td>${index.tableName}</td>
		                        <td>${index.columnName}</td>
		                        <td>${index.uniqueness}</td>
		                    </tr>`;
		            });
	            $('#indexTableBody').html(html);
			},
			error : function(xhr, status, error) {
				console.log('오류: ' + xhr.responseText);
			}
		});
	});
});
