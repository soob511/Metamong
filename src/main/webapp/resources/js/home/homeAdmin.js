$(document).ready(function() {
	$('.menu-item').removeClass('active');
	$('.menu-item:first').addClass('active');

	// pie-chart
	let ctx = document.getElementById('chart').getContext('2d');
	let adminPieChart = new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : [ '접수', '승인', '반려' ],
			datasets : [ {
				data : [ 10, 2, 3 ],
				backgroundColor : [ 'rgba(255, 175, 163)',
						'rgba(128, 202, 255)', 'rgba(255, 217, 102)' ],
				hoverOffset : 4,
				spacing : 0
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			},
			plugins: {
	            legend: {
		              position: 'top',
		            },
		            title: {
		              display: true,
		              text: '전체 15건'
		            }
		          }
		}
	});

	// line-chart
	let ctxLline = document.getElementById('line-chart').getContext('2d');
	let adminLineChart = new Chart(ctxLline, {
		type : 'line',
		data : {
			labels : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
					'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ],
			datasets : [ {
				data : [ 10, 12, 23, 14, 5, 26, 2, 8, 2, 10, 5, 3 ],
				label : "USER",
				borderColor : "#FF6384",
				fill : false
			}, {
				data : [ 5, 12, 7, 1, 7, 6, 3, 5, 8, 1, 6, 12 ],
				label : "DBA",
				borderColor : "#36A2EB",
				fill : false
			} ]
		}
	});

});