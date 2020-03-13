$(document).ready(function(){
	// img 미리보기
	$("#g_img").change(function() {
	    readURL(this);
	});
	
	// 상세정보 폼 추가 제거
	$("#plusInfo").click(function(){
		plusInfo();
	});
	$("#minusInfo").click(function(){
		minusInfo();
	});
	
	// file 확장자 체크
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

function plusInfo() {
	var count = parseInt($("#optionCnt").val()) + 1;
	var optionHTML = "";
	optionHTML += "<div class='col-md-12 option'>";
	optionHTML += "<div class='form-group col-md-6'>";
	optionHTML += "<label class='col-sm-12'><b>옵션이미지" + count + "</b></label>";
	optionHTML += "<div class='col-md-12'><input type='file' name='in_img' id='in_img" + count + "' accept='image/*' required></div>";
	optionHTML += "</div>"
	optionHTML += "<div class='form-group col-md-6'>";
	optionHTML += "<label class='col-md-12'><b>색상" + count + "</b></label>";
	optionHTML += "<div class='col-md-12'><input type='text' name='in_color' placeholder='color' class='form-control form-control-line' required></div>";
	optionHTML += "</div></div>"
		
	$("div#options").append(optionHTML);
	$("#optionCnt").val(count)
}

function minusInfo() {
	var count = parseInt($("#optionCnt").val());
	
	if (count == 1) {
		alert("옵션은 적어도 하나이상 작성해야 합니다.")
		return;
	}
	
	$("div.option:last").remove();
	$("#optionCnt").val(count - 1);
}


