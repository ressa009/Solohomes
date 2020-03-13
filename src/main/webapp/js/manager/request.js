/**
 * 
 */

$(document).ready(function(){
	
	// 최초 로딩
	$("input#requestPage").val(1);
	loadRequestTable(1);
	
	// checkbox toggle
	$("button#requestCheckBoxToggle").click(function(){
		$("td.request.ColumnOfCheckBox").toggle();
		$("th.request.ColumnOfCheckBox").toggle();
		$("button#requestDeleteOk").toggle();
		
		if ($(this).html() == "선택삭제") {
			$(this).html("선택취소");
		} else {
			$(this).html("선택삭제");
		}
	});
	
	// pagination
	// prevPage
	$("button#requestPrevPage").click(function(){
		var currequestPage = parseInt($("input#requestPage").val());
		if (currequestPage == 1) {
			alert("첫 페이지 입니다.");
			return;
		}
		loadRequestTable(currequestPage - 1);
	});
	// nextPage
	$("button#requestNextPage").click(function(){
		var currequestPage = parseInt($("input#requestPage").val());
		loadRequestTable(currequestPage + 1);
	});
	
	// sortSelect
	$("select#sortSelect").change(function(){
		$("input#requestPage").val(1);
		loadRequestTable(1);
	});

	// responseModalWrite
	$("form#writeResponse").submit(function(event){
		event.preventDefault();
		var res = $("form#writeResponse [name='response']").val();
		var rq_uid = $("form#writeResponse [name='uid']").val();
		
		if (res == null || res.trim() == "") {
			alert("답변을 입력해 주세요.");
			$("form#writeResponse [name='response']").focus();
			return;
		}
		
		// update 
		$.ajax({
			url : "../managerAjax/responseWriteOk.do"
			, type : "POST"
			, cache : false 
			, data : {
				uid : rq_uid
				, response : res
			}
			, success : function(data, status) {
				if (status == "success") {
					alert("답변 작성 완료");
					loadRequestTable(1);
					$("#responseModalWrite").modal("hide");
				}
			}
		});
	});
	
	// responseModalView -> responseModalWrite (for update)
	$("button#responseUpdate").click(function(){
		$("#responseModalView").modal("hide");
		var uid = $("input.uid").val();
		modalOpen(uid, 1);
	});
	
});

// modalBox start function
function modalOpen(uid, type) {
	$.ajax({
		url : "../managerAjax/request.ajax/" + uid
		, type : "GET"
		, cache : false
		, success : function(data,status) {
			if (status == "success") {
				if (type == 1) {
					if (updateResponseModalWrite(data)) {
						$("#responseModalWrite").modal();
					}
				} else if (type == 2) {
					if (updateResponseModalView(data)) {
						$("#responseModalView").modal();
					}
				}
			}
		}
	});
}

// update data in responseModalWrite function
function updateResponseModalWrite(jsonObj) {
	result = "";
	if (jsonObj.status == "SUCCESS") {
		var item = jsonObj.list[0];
		var subject = item.subject;
		var content = item.content;
		var response = item.response;
		
		$("input.uid").val(item.uid);
		
		$("div#responseModalWrite h4.modal-title").html("");
		$("div#responseModalWrite h4.modal-title").html(subject);
		
		$("div#responseModalWrite div.requestModalContent p").html("");
		$("div#responseModalWrite div.requestModalContent p").html(content);
		
		if (response != null) {
			$("div#responseModalWrite div.requestModalResponse textarea").val(response);
		}
		return true;
	} else {
		alert("문의가 삭제되거나 없습니다.");
		return false;
	}
	return false;
}

// update data in responseModalView function
function updateResponseModalView(jsonObj) {
	result = "";
	if (jsonObj.status == "SUCCESS") {
		var item = jsonObj.list[0];
		var subject = item.subject;
		var content = item.content;
		var response = item.response;
		
		$("input.uid").val(item.uid);
		
		$("div#responseModalView h4.modal-title").html("");
		$("div#responseModalView h4.modal-title").html(subject);
		
		$("div#responseModalView div.requestModalContent p").html("");
		$("div#responseModalView div.requestModalContent p").html(content);
		
		$("div#responseModalView div.requestModalResponse p").html("");
		$("div#responseModalView div.requestModalResponse p").html(response);
		return true;
	} else {
		alert("문의가 삭제되거나 없습니다.");
		return false;
	}
	
	return false;
}

// ajax function (get request json data)
function loadRequestTable(page){
	var sortType = parseInt($("select#sortSelect").val());
	
	$.ajax({
		url : "../managerAjax/request.ajax/" + sortType + "/10/" + page
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status == "success") {
				//alert("성공");
				if (updateRequestTable(data)) {
					$("input#requestPage").val(page);
				}
			}
		}
	});
}

// update data in requestTable
function updateRequestTable(jsonObj) {
	result = "";
	if (jsonObj.status == "SUCCESS") {
		var count = jsonObj.count;
		var i;
		var items = jsonObj.list;
		var write = 1;
		var view = 2;
		
		for (i = 0; i < count; i++) {
			result += "<tr>\n";
			result += "<td class='request ColumnOfCheckBox'><input type='checkbox' name='uid' value='" + items[i].uid + "'></td>\n";
			result += "<td>" + items[i].id + "</td>";
			result += "<td>" + items[i].type + "</td>";
			result += "<td>" + items[i].subject + "</td>";
			var regdate = new Date(items[i].regdate);
			var strdate = regdate.getFullYear() + "/"
				+ (regdate.getMonth() + 1) + "/"
				+ regdate.getDate();
			result += "<td>" + strdate + "</td>";
			if (items[i].response == null) {
				result += "<td><button type='button' class='btn btn-danger btn-sm modalResponse' id='modalResponse" + items[i].uid + "' onclick='modalOpen(" + items[i].uid + ", " + write + ")'>답변하기</button></td>";
			} else {
				result += "<td><button type='button' class='btn btn-info btn-sm modalResponse' id='modalResponse" + items[i].uid + "' onclick='modalOpen(" + items[i].uid + ", " + view + ")'>답변확인</button></td>";
			}
			result += "</tr>\n";
		}
		$("table#requestTable tbody").html("");
		$("table#requestTable tbody").html(result);
		return true;
	} else {
		alert("마지막 페이지 입니다.");
		return false;
	}
	return false;
}

//delete ajax
function chkDelete() {
	var curPage = parseInt($("input#requestPage").val());
	var uids = [];
	$("#frmDelete input[name=uid]").each(function(){
		if ($(this).is(":checked")) {
			uids.push(parseInt($(this).val()));
		}
	});
	
	if (uids.length == 0) {
		alert("문의를 하나 이상 선택해 주세요");
	} else {
		var confirmResult = confirm("정말 삭제하겠습니까?");
		if (confirmResult) {
			$.ajax({
				url : "../managerAjax/request/deleteOk.do"
				, type : "POST"
				, cache : false
				, data : {
					uids : JSON.stringify(uids).slice(1).slice(0, -1)
				}
				, success : function(data, status) {
					if (status == "success") {
						alert(data.count + "개의 문의 삭제 성공");
						loadRequestTable(curPage);
					}
				}
			});
		}
	}
}
