
$(document).ready(function(){
	
	// 최초 로딩
	$("input#reviewPage").val(1);
	loadReviewTable(1);
	
	// checkbox toggle
	$("button#reviewCheckBoxToggle").click(function(){
		$("td.review.ColumnOfCheckBox").toggle();
		$("th.review.ColumnOfCheckBox").toggle();
		$("button#reviewDeleteOk").toggle();
		
		if ($(this).html() == "선택삭제") {
			$(this).html("선택취소");
		} else {
			$(this).html("선택삭제");
		}
	});
	
	// pagination
	// prevPage
	$("button#reviewPrevPage").click(function(){
		var curreviewPage = parseInt($("input#reviewPage").val());
		if (curreviewPage == 1) {
			alert("첫 페이지 입니다.");
			return;
		}
		loadReviewTable(curreviewPage - 1);
	});
	// nextPage
	$("button#reviewNextPage").click(function(){
		var curreviewPage = parseInt($("input#reviewPage").val());
		loadReviewTable(curreviewPage + 1);
	});
	
	// sortSelect
	$("select#sortSelect").change(function(){
		$("input#reviewPage").val(1);
		loadReviewTable(1);
	});

	// reviewModalView

});

function loadReviewTable(page) {
	var sortType = parseInt($("select#sortSelect").val());
	
	$.ajax({
		url : "../managerAjax/comment.ajax/" + sortType + "/10/" + page
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status == "success") {
				//alert("성공");
				if (updateReviewTable(data)) {
					$("input#reviewPage").val(page);
				}
			}
		}
	});
};

function updateReviewTable(jsonObj) {
	result = "";
	if (jsonObj.status == "SUCCESS") {
		var count = jsonObj.count;
		var i;
		var items = jsonObj.list;
		
		for (i = 0; i < count; i++) {
			result += "<tr>\n";
			result += "<td class='review ColumnOfCheckBox'><input type='checkbox' name='uid' value='" + items[i].co_uid + "'></td>\n";
			result += "<td>" + items[i].mb_id + "</td>";
			result += "<td>" + items[i].g_name + "</td>";
			result += "<td>" + items[i].subject + "</td>";
			result += "<td>" + items[i].reportedNum + "</td>";
			var regdate = new Date(items[i].regdate);
			var strdate = regdate.getFullYear() + "/"
				+ (regdate.getMonth() + 1) + "/"
				+ regdate.getDate();
			result += "<td>" + strdate + "</td>";
			result += "<td><button type='button' class='btn btn-danger btn-sm modalReview' id='modalReview" + items[i].co_uid + "' onclick='modalOpen(" + items[i].co_uid + ")'>내용보기</button></td>";
			result += "</tr>\n";
		}
		$("table#reviewTable tbody").html("");
		$("table#reviewTable tbody").html(result);
		return true;
	} else {
		alert("마지막 페이지 입니다.");
		return false;
	}
	return false;
}

function modalOpen(uid) {
	$.ajax({
		url : "../managerAjax/comment.ajax/" + uid
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status == "success") {
				if (updateReviewModalView(data)) {
					$("#reviewModal").modal();
				}
			}
		}
		
	});
}

function updateReviewModalView(jsonObj) {
	result = "";
	if (jsonObj.status == "SUCCESS") {
		var review = jsonObj.list[0];
		
		$("div#reviewModal h4.modal-title").html("");
		$("div#reviewModal h4.modal-title").html(review.subject);
		
		$("div#reviewModal div.reviewModalProduct p").html("");
		$("div#reviewModal div.reviewModalProduct p").html(review.g_name);
		
		$("div#reviewModal div.reviewModalContent p").html("");
		$("div#reviewModal div.reviewModalContent p").html(review.content);
		
		$("div#reviewModal div.reviewModalInfo p").html("");
		$("div#reviewModal div.reviewModalInfo p").html("신고횟수 : " + review.reportedNum + " 회");
		
		return true;
	} else {
		alert("한줄평이 삭제되거나 없습니다.")
		return false;
	}
	return false;
}

function chkDelete() {
	var curPage = parseInt($("input#reviewPage").val());
	var uids = [];
	$("#frmDelete input[name=uid]").each(function(){
		if ($(this).is(":checked")) {
			uids.push(parseInt($(this).val()));
		}
	});

	
	if (uids.length == 0) {
		alert("한줄 평을 하나 이상 선택해 주세요");
	} else {
		var confirmResult = confirm("정말 삭제하겠습니까??");
		if (confirmResult) {
			$.ajax({
				url : "../managerAjax/comment/deleteOk.do"
				, type : "POST"
				, cache : false
				, data : {
					uids : JSON.stringify(uids).slice(1).slice(0, -1)
				}
				, success : function(data, status) {
					if (status == "success") {
						alert(data.count + "개의 한줄 평 삭제 성공");
						loadReviewTable(curPage);
					}
				}
			});
		}
	}
}