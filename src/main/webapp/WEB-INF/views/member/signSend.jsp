<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == -1 }">
	<script>
		alert("정상적인 접근이 아닙니다");
		location.href = "login.do";
	</script>
</c:if>
<c:if test="${result == -2 }">
	<script>
		alert("이미 인증된 회원입니다. 로그인해 주세요");
		location.href = "login.do";
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script>
		alert("인증 메일 발송이 실패하였습니다. 다시 작성해주세요");
		history.back();
	</script>
</c:if>
<c:if test="${result == 0 }">
<jsp:include page="/common/menu" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>인증 이메일 전송</title>
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
		<div id="sendPage">
			<p id="p1">약관 동의</p>
			<p id="p2">정보 입력</p>
			<p id="p3">가입 완료</p>
				<h2>메일 인증</h2>
			<div id="sendtext">
				<p id="p4">&nbsp&nbsp고객님의 메일함으로</p>
				<p id="p5">인증 메일을 보냈습니다</p>
				<p id="p6">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp확인해주세요</p>
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
</c:if>