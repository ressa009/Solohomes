
// for make morrisChart
$(document).ready(function(){
	
	$.ajax({
		url : "../managerAjax/index.ajax/monthlySales"
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status = "success") {
				morrisData = data;
				new Morris.Area({
				    element: 'salesChart',
				    data: morrisData,
				    xkey: 'year_month',
				    ykeys: ['amount'],
				    labels: ['Amount'],
				    pointSize: 0,
				    fillOpacity: 0.5,
				    lineWidth : 0,
				    pointStrokeColors: ['#e60012'],
				    behaveLikeLine: true,
				    smooth: false,
				    hideHover: 'auto',
				    lineColors: ['#e60012'],
				    resize: true,
				    parseTime : false
				});
			}
		}
	});
});

