<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>

<%!
	HttpSession session;
	int mb_uid = 0;
%>
<%
	if(session.getAttribute("userUID") == null){
		mb_uid = 0;
	} else{
		mb_uid = (int)session.getAttribute("userUID");
	}
%>

<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
<head>
<title>1:1 문의 작성</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">

<script>
function chkSubmit(){
	frm = document.forms["frm"];

	var rq_subject = frm["rq_subject"].value.trim();
	if(rq_subject == ""){
		alert("제목을 입력해주세요");
	    frm["rq_subject"].focus();
	    return false;
	}
	
	var rq_content = frm["rq_content"].value.trim();
   	if(rq_content == ""){
   		alert("내용을 입력해주세요");
   		frm["rq_content"].focus();
   		return false;
   	} 
   	
   	return true;
}
</script>
</head>

<body>

	<div class="hero-wrap hero-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<span class="quote"><i class="fas fa-quote-left"></i></span>
					<h1 class="mb-0 bread">1:1 문의</h1>
					<span class="quote"><i class="fas fa-quote-right"></i></span>
					<p class="breadcrumbs mt-3">
						<span class="mr-2">
							<a href="${pageContext.request.contextPath}/user/mypage/requestView.do/<%=mb_uid%>">문의목록 가기</a>
						</span>
					</p>
					
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section contact-section bg-light">
		<div class="container">
			<div class="row block-9">
				<div class="formBox">
					<form name="frm" action="${pageContext.request.contextPath}/user/mypage/requestWriteOk.do" 
						method="post" onsubmit="return chkSubmit()" class="bg-white p-5 contact-form">
						<input type="hidden" name="mb_uid" value="${mb_uid}"/>
						<div>
							<select name="rq_type" class="form-group rq_type">
		                        <option value="1">상품문의</option>
		                        <option value="2">배송문의</option>
		                        <option value="3">결제문의</option>
		                        <option value="4">환불문의</option>
		                        <option value="5">기타문의</option>
	                      	</select>
	                    </div>
						<div class="form-group">
							<input type="text" class="form-control"  name="rq_subject" placeholder="제목">
						</div>
						<div class="form-group">
							<textarea name="rq_content" id="reContent" class="form-control" placeholder="상세내용"></textarea>
						</div>
						<div class="form-group">
							<input type="submit" value="작성하기" class="btn btn-primary py-3 px-5">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#c80a1e" />
		</svg>
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
<jsp:include page="/common/footer"/>