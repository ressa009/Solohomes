<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
         
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
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
	
<title>1:1문의</title>


<script>
$(document).ready(function(){
    // 문의 작성 시간 
	var regDate = new Date("${dto.rq_regdate}");
	var strDate = regDate.getFullYear() + "-" +
				(regDate.getMonth() + 1) + "-" + 
				 regDate.getDate() + "&nbsp&nbsp " +
				 regDate.getHours() + ":" + 
				 regDate.getMinutes();
	
	$("#regdate").html(strDate);
	
	 // 답변 
	 var checkResponse = "${dto.rq_response}";
	 if(checkResponse == "" || checkResponse == null || checkResponse.length == 0){
		 msg="미답변"
		 $("#admin_msg").html(msg);
	 }else{
		 $("#admin_msg").html(checkResponse);
	 }
	
});
</script>
</head>
<body>

	<!-- 대문 -->
	<div class="hero-wrap hero-bread">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<span class="quote"><i class="fas fa-quote-left"></i></span>
					<h1 class="mb-0 bread">1:1 문의</h1>				
					<span class="quote"><i class="fas fa-quote-right"></i></span>
				</div>
			</div>
		</div>
	</div>


	
	<div class="hero-wrap hero-bread">
		<div class="container">
			<div class="col-md-12 ftco-animate text-center">
				<h3 class="mb-0 bread">문의내용</h3>
			</div>
		</div>
	</div>	
	<hr>
	

<!-- <p class="breadcrumbs">
	<span class="mr-2">
		<a href="${pageContext.request.contextPath}/user/requestlist.do">문의목록 가기</a>
	</span>
</p> -->

	<!-- 문의내용 테이블 -->
	<section class="ftco-section ftco-cart fp">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">	
						<table class="table" id="request_view">
						<tbody>
							<tr>
								<td class="thead-primary">문의번호</td>
								<td class="tbody-text">${dto.rq_uid}</td>
							</tr>
							<tr>
								<td class="thead-primary">문의분류</td>
								<td class="tbody-text">${dto.rq_type_str}</td>
							</tr>
							<tr>
								<td class="thead-primary">제목</td>
								<td class="tbody-text">${dto.rq_subject}</td>
							</tr>
							<tr>
								<td class="thead-primary">문의번호</td>
								<td class="tbody-text">${dto.rq_uid}</td>
							</tr>
							<tr>
								<td class="thead-primary">내용</td>
								<td class="tbody-text">${dto.rq_content}</td>
							</tr>
							<tr>
								<td class="thead-primary">등록일</td>
								<td class="tbody-text" id="regdate"></td>
							</tr>
						</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>


	<div class="hero-wrap hero-bread pd">
		<div class="container">
			<div class="col-md-12 ftco-animate text-center">
				<h3 class="mb-0 bread">문의답변</h3>
			</div>
		</div>
	</div>	
	<hr>
	
	
	<!-- 문의답변 테이블 -->
	<section class="ftco-section ftco-cart fp">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">	
						<table class="table" id="request_view">
						<tbody>
							<tr>
								<td class="thead-primary" colspan="2">솔로홈즈관리자</td>
							</tr>
							<tr>
								<td class="thead-primary" id="td_width1">답변내용</td>
								<td class="tbody-text" id="admin_msg" id="td_width2"></td>
							</tr>
						</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div id="writeRequestBtn" class="col-md-12  ftco-animate">
	   				<input type="button" id="writeBtn" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/user/requestlist.do'"/>
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

	<script src="${pageContext.request.contextPath }/js/user/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/aos.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/scrollax.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/main.js"></script>

</body>
</html>
<jsp:include page="/common/footer" />