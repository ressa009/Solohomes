$(document).ready(function(){
	
	$("#sr_img").change(function() {
	    readURL(this);
	});
	
	//modal open... 시리즈에 상품 추가
	$("button#plusCompo").click(function(){
		loadGoodsData();
		$("#goodsModal").modal();
	})
	
	//modal ajax
	$("#typeSelect").change(function(){
		loadGoodsData();
	});
	
	$("input[type='file']").change(function(){
		
		if ($(this).val() != "") {
			var ext = $(this).val().split(".").pop().toLowerCase();
			if ($.inArray(ext, ["gif", "jpg", "jpeg", "png"]) == -1) {
				alert(".gif, .jpg, .jpeg, .png 파일만 업로드 가능합니다.");
				$(this).val("");
				return;
			}
		}
	});
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#goodsImg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function loadGoodsData() {
	var type = parseInt($("#typeSelect").val());
	
	$.ajax({
		url : "../managerAjax/goods.ajax/" + type + "/" + "0" + "/20/1" 
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status == "success") {
				updateTable(data);
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
			result += "<td>" + list[i].g_name + "</td>";
			result += "<td>" + parseType(list[i].g_type) + "</td>";
			result += "<td>" + "<button  onclick='plusToCompoTable(" + list[i].g_uid + ', "' + list[i].g_name + '", "' + parseType(list[i].g_type) + '", ' + list[i].g_price + ")' ";
			result += "class='btn btn-danger m-l-20 btn-circle btn-outline waves-effect waves-light'><i class='fa fa-plus' aria-hidden='true'></i></button>" + "</td>";
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

function plusToCompoTable(uid, name, type, price) {
	rowHTML = "";
	rowHTML += "<tr id='compo" + uid + "'>";
	rowHTML += "<td>" + name + "</td>";
	rowHTML += "<td>" + type + "</td>";
	rowHTML += "<td>" + price + "</td>";
	rowHTML += "<td>" + "<button onclick='minusToCompoTable(" + uid + ")' class='btn btn-danger m-l-20 btn-circle btn-outline waves-effect waves-light'><i class='fa fa-minus' aria-hidden='true'></i></button>" + "</td>";
	rowHTML += "<td>" + "<input type='hidden' name='uid' value='" + uid + "'>" + "</td>";
	rowHTML += "</tr>";
	$("table#compoTable tbody").append(rowHTML);
}

function minusToCompoTable(uid) {
	target = "tr#compo" + uid;
	$(target).remove();
}