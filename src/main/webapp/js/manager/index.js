
$(document).ready(function(){
	
	// 처음 페이지 로딩
	loadDailyTable();
	
	$("#selectMonth").change(function(){
		loadDailyTable();
	});
	
});

function loadDailyTable() {
	var month = $("select#selectMonth").val();
	$.ajax({
		url : "../managerAjax/index.ajax/dailySales/" + month
		, type : "GET"
		, cache : false
		, success : function(data, status){
			if (status == "success") {
				updateDailyTable(data);
			}
		}
	});
}

function updateDailyTable(jsonObj) {
	var result = "";
	var list = jsonObj;
	
	if (list != null && list.length > 0) {
		for (var i = 0; i < list.length; i++) {
			result += "<tr>";
			result += "<td>" + list[i].day + "</td>";
			result += "<td>" + list[i].quantity + "건</td>";
			result += "<td>" + list[i].amount + "&#8361</td>";
			result += "<td>" + list[i].stack_amount + "&#8361</td>";
			result += "</tr>";
		}
	} else {
		result += "<tr><td colspan='4'>판매 정보가 없습니다.</td></tr>"
	}
	
	$("table#dailySalesTable tbody").html("");
	$("table#dailySalesTable tbody").html(result);
}