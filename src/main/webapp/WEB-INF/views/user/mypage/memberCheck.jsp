<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
	
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/icomoon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/css/mypage.css">
    
    
    
    
</head>

 <script>
	function chkSubmit(){
		frm = document.forms["frm"];
		
		var mb_pw = frm["mb_pw"].value.trim();
	    if (mb_pw == "") {
	        alert("비밀번호를 입력해주세요");
	        frm["mb_pw"].focus();
	        return false;
	    }
	    
	    return true;
	} // end chkSubmit()
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
	<!-- 대문 -->
	<div class="hero-wrap hero-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<span class="quote"><i class="fas fa-quote-left"></i></span>
					<h1 class="mb-0 bread">회원 정보 수정</h1>
					<span class="quote"><i class="fas fa-quote-right"></i></span>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 폼 -->
	<section class="ftco-section contact-section bg-light">
			<div class="container">
				<div class="row block-9">
					<div class="formBox">
						<form name="frm" action="${pageContext.request.contextPath }/user/mypage/memberCheckOk.do" method="post" onsubmit="return chkSubmit()" class="bg-white p-5 contact-form">
							<input type="hidden" name="mb_uid" value="${sessionScope.userUID}"/> 
							<div class="form-group2">
								<label for="mb_pw" class="col-form-label pwcheck-form" id="label_pw">비밀번호 확인</label>
								<input type="password" class="form-control2 pwcheck-form" id="mb_pw" name="mb_pw"/>
								<input type="submit" class="btn btn-primary pwcheck-form" value="확인" />
							</div>
						</form>
				</div>
			</div>
		</div>
	</section>
	</div>
	
	
	<script src="${pageContext.request.contextPath}/js/user/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/aos.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/scrollax.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/main.js"></script>
		

</body>
</html>
<jsp:include page="/common/footer" />