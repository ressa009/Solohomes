<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/common/menu" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
</head>
<script>
// form 검증
function ckSubmit(){
	frm = document.forms["form1"];
	var nn = frm["nn"].value.trim();
	var email = frm["email"].value.trim();
	
	if(nn == ""){
		alert("닉네임을 입력해 주세요");
		frm["nn"].focus();
		return false;
	}
	if(email == ""){
		alert("이메일을 입력해 주세요");
		frm["email"].focus();
		return false;
	}
	return true;
}
</script>
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
<body>
<div id="heightBox">
	<div id="loginBox">
		<div id="findid">
			<p id="p1">ID / PW 찾기</p>
			<div id="fbody">
				<P>&nbsp고객님의 닉네임과 <br>
				가입당시 이메일을 입력해 주세요<br>
				해당 이메일로 발송 해드립니다<br></P>
				<form name="form1" action="idpwSend.do" method="GET" onsubmit="return ckSubmit()">
					<input type="text" id="fnn" name="nn" placeholder="닉네임"><br>
					<input type="email" id="femail" name="email" placeholder="이메일"><br>
					<input type="submit" id="findsm" value="ID/PW 찾기">
					<a href="login.do" id="fback">이전으로</a>
				</form>
			</div>
		</div>
	</div>
</div>	
</body>
<link rel="stylesheet" type="text/css" href="../css/login/loginCss.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../css/login/js/login_1.js"></script>

</html>
<jsp:include page="/common/footer" />
