<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/common/menu" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원정보 입력</title>
<!-- bootstrap css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu_2.css">
<!-- height 길이 조절 자바스크립트  -->
<script>
$(document).ready(function(){
	var menu = 90;
	var dHeight = $(document).height() - menu;
	
	$(document).resize(function() {
		dHeight = $(document).height() - menu;
	});
	
	$("#heightBox").css('min-height', dHeight);
});
</script>
</head>
<body>
<div id="heightBox">
<div id="loginBox">
<div id="logInfo">
	<p id="p1">약관 동의</p>
	<p id="p2">정보 입력</p>
	<p id="p3">가입 완료</p>
	<form name="form1" method="post" action="insertInfoOk.do">
		
			<input type="text" id="id" name="id" placeholder="아이디" required/><div id="id_check"></div>
		
			<input type="text" id="nn" name="nn" placeholder="닉네임" required/><div id="nick_check"></div>
			
			<input type="text" id="name" name="name" placeholder="이름" required/>
		
			<input type="password" id="pw" name="pw" placeholder="비밀번호" required/><br>
		
			<input type="password" id="pw2" name="pw2" placeholder="비밀번호 확인" required/><div id="pw_check"></div>
		
			<input type="email" id="email" name="email" placeholder="이메일" required/><br>
		
			<input type="number" id="phone" name="phone" placeholder=" - 없이 입력해 주세요(휴대폰)" required/><br>
		
			<input type="text" name="zipcode" id="sample6_postcode" placeholder="우편번호">
			<input type="button" id="zipbt" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		
			<input type="text" name="addr" id="sample6_address" placeholder="주소"><br>
		
		<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소"><br>
		
		<button type="submit" id="lsubmit_button" disabled="true">가입하기</button>
	</form>
		<input type="hidden" id="sample6_extraAddress" placeholder="참고항목"><br>
		<a href="terms.do" id="lback">이전으로</a><br>
</div>	
</div>	
</div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#id").blur(function(){
		
		frm = document.forms["form1"];
		var id = frm["id"].value.trim();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/Lajax/idCheck.do?id=" + id,
			type:"GET",
			success:function(data){
				console.log(data);
				
				if(data == 1 || id == ""){
					$("#id_check").text("사용불가!");
					$("#id_check").css("color","red");
					$("#lsubmit_button").attr("disabled", true);
					$("#lsubmit_button").css("background-color", "#595757");
				} else {
					$("#id_check").text("사용가능!");
					$("#id_check").css("color","green");
					$("#lsubmit_button").attr("disabled", false);
					$("#lsubmit_button").css("background-color", "#c80a1e");
				}
				
			}
		
		})
		
	});
	
	$("#nn").blur(function(){
			
			frm = document.forms["form1"];
			var nn = frm["nn"].value.trim();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/Lajax/nickCheck.do?nn=" + nn,
				type:"GET",
				success:function(data){
					console.log(data);
					
					if(data == 1 || nn == ""){
						$("#nick_check").text("사용불가!");
						$("#nick_check").css("color","red");
						$("#lsubmit_button").attr("disabled", true);
						$("#lsubmit_button").css("background-color", "#595757");
					} else {
						$("#nick_check").text("사용가능!");
						$("#nick_check").css("color","green");
						$("#lsubmit_button").attr("disabled", false);
						$("#lsubmit_button").css("background-color", "#c80a1e");
					}
					
				}
			
			})
			
		});
	
	$("#pw2").blur(function(){
		
		frm = document.forms["form1"];
		
		var pw1 = frm["pw"].value.trim();
		var pw2 = frm["pw2"].value.trim();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/Lajax/pwCheck.do?pw1=" + pw1 + "&pw2=" + pw2,
			type:"GET",
			success:function(data){
				console.log(data);
				
				if(pw1 != pw2 || pw1 == "" || pw2 == ""){
					$("#pw_check").text("비밀번호 다름!");
					$("#pw_check").css("color","red");
					$("#lsubmit_button").attr("disabled", true);
					$("#lsubmit_button").css("background-color", "#595757");
				} else {
					$("#pw_check").text("비밀번호 같음!");
					$("#pw_check").css("color","green");
					$("#lsubmit_button").attr("disabled", false);
					$("#lsubmit_button").css("background-color", "#c80a1e");
				}
				
			}
		
		})
		
	});
	
	
	
});




    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<link rel="stylesheet" type="text/css" href="../css/login/loginCss.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../css/login/js/login_1.js"></script>
</html>
<jsp:include page="/common/footer" />