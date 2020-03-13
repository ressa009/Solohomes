
$(document).ready(function(){
	
	// firts time page loading
	$("input#userPage").val(1);
	loadMemberTable(1, "user");
	$("input#adminPage").val(1);
	loadMemberTable(1, "admin");
	
	// checkbox toggle
	$("button#userCheckBoxToggle").click(function(){
		$("td.user.ColumnOfCheckBox").toggle();
		$("th.user.ColumnOfCheckBox").toggle();
		$("button#userDeleteOk").toggle();
		
		if ($(this).html() == "선택탈퇴") {
			$(this).html("선택취소");
		} else {
			$(this).html("선택탈퇴");
		}
	});
	$("button#adminCheckBoxToggle").click(function(){
		$("td.admin.ColumnOfCheckBox").toggle();
		$("th.admin.ColumnOfCheckBox").toggle();
		$("button#adminDeleteOk").toggle();
		
		if ($(this).html() == "선택탈퇴") {
			$(this).html("선택취소");
		} else {
			$(this).html("선택탈퇴");
		}
	});
	
	// pagination
	// prevPage
	$("button#userPrevPage").click(function(){
		var curUserPage = parseInt($("input#userPage").val());
		if (curUserPage == 1) {
			alert("첫 페이지 입니다.");
			return;
		}
		loadMemberTable(curUserPage - 1, "user");
	});
	$("button#adminPrevPage").click(function(){
		var curAdminPage = parseInt($("input#adminPage").val());
		if (curAdminPage == 1) {
			alert("첫 페이지 입니다.");
			return;
		}
		loadMemberTable(curadminPage - 1, "admin");
	});
	
	// nextPage
	$("button#userNextPage").click(function(){
		var curUserPage = parseInt($("input#userPage").val());
		loadMemberTable(curUserPage + 1, "user");
	});
	$("button#adminNextPage").click(function(){
		var curAdminPage = parseInt($("input#adminPage").val());
		loadMemberTable(curUserPage + 1, "admin");
	});
	
	// sortSelect
	$("select#sortSelect").change(function(){
		$("input#userPage").val(1);
		loadMemberTable(1, "user");
	});
});

// ajax memberTable
function loadMemberTable(page, type) {
	var sortType = parseInt($("select#sortSelect").val());
	
	$.ajax({
		url : "../managerAjax/member.ajax/" + type + "/" + sortType + "/10/" + page
		, type : "GET"
		, cache : false
		, success : function(data, status){
			if (status == "success") {
				if (type == "user") {
					if (updateUserTable(data)) {
						$("input#userPage").val(page);
					}
				} else if (type == "admin") {
					if (updateAdminTable(data)) {
						$("input#adminPage").val(page);
					}
				}
			}
		}
	});
};
// insert html to userTable
function updateUserTable(jsonObj) {
	result = "";
	
	if (jsonObj.status == "SUCCESS") {
		var count = jsonObj.count;
		var i;
		var items = jsonObj.list;
		for (i = 0; i < count; i++) {
			result += "<tr>\n";
			result += "<td class='user ColumnOfCheckBox'><input type='checkbox' name='uid' value='" + items[i].uid + "'></td>\n";
			result += "<td>" + items[i].id + "</td>\n";
			result += "<td>" + items[i].nn + "</td>\n";
			result += "<td>" + items[i].email + "</td>\n";
			result += "<td>" + items[i].reportedNum + "</td>\n";
			var regdate = new Date(items[i].regdate);
			var strdate = regdate.getFullYear() + "/"
				+ (regdate.getMonth() + 1) + "/"
				+ regdate.getDate();
			result += "<td>" + strdate + "</td>\n";
			result += "</tr>\n";
		}
		$("table#userTable tbody").html("");
		$("table#userTable tbody").html(result);
		return true;
	} else {
		alert("마지막 페이지 입니다.");
		return false;
	}
	return false;
}
//insert html to adminTable
function updateAdminTable(jsonObj) {
	result = "";
	
	if (jsonObj.status == "SUCCESS") {
		var count = jsonObj.count;
		var i;
		var items = jsonObj.list;
		for (i = 0; i < count; i ++) {
			result += "<tr>\n";
			result += "<td class='admin ColumnOfCheckBox'><input type='checkbox' name='uid' value='" + items[i].uid + "'></td>\n";
			result += "<td>" + items[i].id + "</td>\n";
			result += "<td>" + items[i].nn + "</td>\n";
			result += "<td>" + items[i].email + "</td>\n";
			var regdate = new Date(items[i].regdate);
			var strdate = regdate.getFullYear() + "/"
				+ (regdate.getMonth() + 1) + "/"
				+ regdate.getDate();
			result += "<td>" + strdate + "</td>\n";
			result += "</tr>\n";
		}
		$("table#adminTable tbody").html("");
		$("table#adminTable tbody").html(result);
		return true;
	} else {
		alert("내용이 없습니다.");
		return false;
	}
	return false;
}

// delete ajax
function chkDelete(type) {
	var curUserPage = parseInt($("input#userPage").val());
	var curAdminPage = parseInt($("input#adminPage").val());
	var uids = [];
	if (type == "user") {
		$("#frmUserDelete input[name=uid]").each(function(){
			if ($(this).is(":checked")) {
				uids.push(parseInt($(this).val()));
			}
		});
	} else if (type == "admin") {
		$("#frmAdminDelete input[name=uid]").each(function(){
			if ($(this).is(":checked")) {
				uids.push(parseInt($(this).val()));
			}
		});
	}
	
	if (uids.length == 0) {
		alert("회원을 하나 이상 선택해 주세요");
	} else {
		var confirmResult = confirm("정말 탈퇴시키겠습니까?");
		if (confirmResult) {
			$.ajax({
				url : "../managerAjax/deleteOk.do"
				, type : "POST"
				, cache : false
				, data : {
					uids : JSON.stringify(uids).slice(1).slice(0, -1)
				}
				, success : function(data, status) {
					if (status == "success") {
						alert(data.count + "명의 회원 탈퇴 성공");
						loadMemberTable(curUesrPage, "user");
						loadMemberTable(curAdminPage, "admin");
					}
				}
			});
		}
	}
}
