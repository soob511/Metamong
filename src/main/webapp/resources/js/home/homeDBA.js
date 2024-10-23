$(document).ready(function() {
    $('.menu-item').removeClass('active');
    $('.menu-item:first').addClass('active');
    
	let ctx = document.getElementById('chart').getContext('2d');
	let myChart = new Chart(ctx, {
	    type: 'doughnut',
	    data: {
	    	labels: ['코드/항목', '테이블', '시퀀스', '인덱스'],
	        datasets: [{
	            data: [10, 2, 3, 5],
	            backgroundColor: [
	                'rgba(255, 175, 163)',
	                'rgba(128, 202, 255)',
	                'rgba(133, 224, 163)',
	                'rgba(255, 217, 102)'
	            ],
	            hoverOffset: 4,
	            spacing: 0
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        },
	        plugins: {
	            legend: {
	              position: 'top',
	            },
	            title: {
	              display: true,
	              text: '전체 30건'
	            }
	          }
	    }
	});
});