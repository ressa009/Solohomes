

$(document).ready(function(){
	// 첫 페이지 로딩
	$("input#goodsPage").val(1);
	loadGoodsData(1);
	
	loadSeriesData()
	
	// pagination
	// prevPage
	$("button#goodsPrevPage").click(function(){
		var curPage = parseInt($("input#goodsPage").val());
		if (curPage == 1) {
			alert("첫 페이지 입니다.");
			return;
		}
		loadGoodsData(curPage - 1);
	});
	// nextPage
	$("button#goodsNextPage").click(function(){
		var curPage = parseInt($("input#goodsPage").val());
		loadGoodsData(curPage + 1);
	});
	
	
	// sort
	$("#typeSelect").change(function(){
		loadGoodsData(1);
	});
	$("#sortSelect").change(function(){
		loadGoodsData(1);
	});
	
	// delete checkBox toggle
	$("button#goodsCheckBoxToggle").click(function(){
		$("td.goods.ColumnOfCheckBox").toggle();
		$("th.goods.ColumnOfCheckBox").toggle();
		$("button#goodsDeleteOk").toggle();
		
		if ($(this).html() == "선택삭제") {
			$(this).html("선택취소");
		} else {
			$(this).html("선택삭제");
		}
	});
	$("button#seriesCheckBoxToggle").click(function(){
		$("td.series.ColumnOfCheckBox").toggle();
		$("th.series.ColumnOfCheckBox").toggle();
		$("button#seriesDeleteOk").toggle();
		
		if ($(this).html() == "선택삭제") {
			$(this).html("선택취소");
		} else {
			$(this).html("선택삭제");
		}
	});
	
});

function loadGoodsData(page) {
	var type = parseInt($("#typeSelect").val());
	var stype = parseInt($("#sortSelect").val());
	
	$.ajax({
		url : "../managerAjax/goods.ajax/" + type + "/" + stype + "/10/" + page
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status == "success") {
				if(updateTable(data)) {
					$("input#goodsPage").val(page)
				}
			}
		}
	});
}

function updateTable(jsonObj) {
	var result = "";
	
	if (jsonObj.status == "SUCCESS") {
		var count = jsonObj.count;
		var list = jsonObj.list;
		
		for (var i = 0; i < count; i++) {
			result += "<tr>";
			result += "<td class='goods ColumnOfCheckBox'><input type='checkbox' name='uid' value='" + list[i].g_uid + "'></td>\n";
			result += "<td><a class='popup' onmouseover='popupImg(" + list[i].g_uid + ")' href='../user/productInfo.do/" + list[i].g_uid + "' target='_blank'>" + list[i].g_name + "</a></td>";
			result += "<td>" + parseType(list[i].g_type) + "</td>";
			result += "<td>" + list[i].g_price + "</td>";
			result += "<td>" + list[i].g_likecnt + "</td>";
			result += "<td>" + list[i].salNum + "</td>";
			result += "<td><button type='button' class='btn btn-danger btn-rounded' onclick='moveToUpdate(" + list[i].g_uid + ")'>수정</button></td>";
			result += "</tr>";
		}
		
		$("table#goodsTable tbody").html("");
		$("table#goodsTable tbody").html(result);
		return true;
	} else {
		alert("마지막 페이지 입니다.");
		return false;
	}
	return false;
}

function popupImg(uid) {
	var x;
	var y;
	document.onmousemove = function(e){
	    x = e.pageX;
	    y= e.pageY;
	}
	
	$.ajax({
		url : "../managerAjax/goods.ajax/" + uid
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status == "success") {
				var imgsrc = "../img/goods/" + data.g_img;
				$("#goodsImg").attr('src', imgsrc);
				$("#popupImg").css({
					"top" : y - 5
					, "left" : x
					, "z-index" : 10
				});
				$("#popupImg").show();
			}
		}
	});
	
	$("a.popup").mouseout(function(){
		$("#popupImg").hide();
	});
}

function moveToUpdate(uid) {
	location.href="../manager/goodsUpdate.do?g_uid=" + uid;
}

function parseType(num) {
	var result = "";
	switch(num) {
	case 1: result = "침대"; break;
	case 2: result = "화장대"; break;
	case 3: result = "서랍장"; break;
	case 4: result = "소파"; break;
	case 5: result = "거실장"; break;
	case 6: result = "옷장"; break;
	case 7: result = "테이블"; break;
	case 8: result = "의자"; break;
	case 9: result = "책상"; break;
	case 10: result = "책장"; break;
	default: break;
	}
	return result;
}

//delete ajax
function chkDelete() {
	var curPage = parseInt($("input#goodsPage").val());
	var uids = [];
	$("#frmDelete input[name=uid]").each(function(){
		if ($(this).is(":checked")) {
			uids.push(parseInt($(this).val()));
		}
	});
	
	if (uids.length == 0) {
		alert("상품을 하나 이상 선택해 주세요");
	} else {
		var confirmResult = confirm("정말 삭제하겠습니까?");
		if (confirmResult) {
			$.ajax({
				url : "../managerAjax/goods/deleteOk.do"
				, type : "POST"
				, cache : false
				, data : {
					uids : JSON.stringify(uids).slice(1).slice(0, -1)
				}
				, success : function(data, status) {
					if (status == "success") {
						alert(data.count + "개의 상품 삭제 성공");
						loadGoodsData(curPage);
					}
				}
			});
		}
	}
}
function chkSeriesDelete() {
	var uids = [];
	$("#frmSeriesDelete input[name=uid]").each(function(){
		if ($(this).is(":checked")) {
			uids.push(parseInt($(this).val()));
		}
	});
	
	if (uids.length == 0) {
		alert("시리즈를 하나 이상 선택해 주세요");
	} else {
		var confirmResult = confirm("정말 삭제하겠습니까?");
		if (confirmResult) {
			$.ajax({
				url : "../managerAjax/series/deleteOk.do"
				, type : "POST"
				, cache : false
				, data : {
					uids : JSON.stringify(uids).slice(1).slice(0, -1)
				}
				, success : function(data, status) {
					if (status == "success") {
						alert(data.count + "개의 상품 삭제 성공");
						loadSeriesData();
					}
				}
			});
		}
	}
}
// series table
function loadSeriesData() {
	$.ajax({
		url : "../managerAjax/goods.ajax/series"
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status == "success") {
				makeSeriesTable(data);
			}
		}
	});
}

function makeSeriesTable(jsonObj) {
	var result = "";
	
	if (jsonObj.status == "SUCCESS") {
		var list = jsonObj.list
		var cnt = jsonObj.count
		
		for (var i = 0; i < cnt; i++) {
			result += "<tr>";
			result += "<td class='series ColumnOfCheckBox'><input type='checkbox' name='uid' value='" + list[i].sr_uid + "'></td>\n";
			result += "<td>" + (i + 1) + ".</td>";
			result += "<td>" + list[i].sr_subject + "</td>";
			var regdate = new Date(list[i].sr_regdate);
			var strdate = regdate.getFullYear() + "/"
				+ (regdate.getMonth() + 1) + "/"
				+ regdate.getDate();
			result += "<td>" + strdate + "</td>";
			result += "<td>" + "<a href='../series/detail.do?sr_uid=" + list[i].sr_uid + "' target='_blank'>자세히보기</a>" + "</td>";
			result += "<td><button type='button' class='btn btn-danger btn-rounded' onclick='moveToUpdateSeries(" + list[i].sr_uid + ")'>수정</button></td>";
			result += "</tr>";
		}
		
		$("table#seriesTable tbody").html("");
		$("table#seriesTable tbody").html(result);
	}
}

function moveToUpdateSeries(uid) {
	location.href="../manager/seriesUpdate.do?sr_uid=" + uid;
}