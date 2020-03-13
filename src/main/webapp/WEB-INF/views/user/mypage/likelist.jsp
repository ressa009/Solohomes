<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%!
	int writePages = 8;
%> 


<jsp:include page="/common/menu" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>좋아요 목록</title>

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
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<script>
$(document).ready(function(){

	$("input#page").val(1); // 페이지 최초 로딩되면 1페이지로
	//TODO : n Page 읽어오기
	loadPage(1);
	
	//[이전] 버튼 눌렀을때
	$("button#prev").click(function(){
		// 현재 페이지 정보
		var curPage = parseInt($("input#page").val())
		// 첫페이지였다면
		if(curPage == 1){
			alert("이전 페이지가 없습니다");
			return;
		}
		// 첫페이지 아니라면 이전페이지 로딩
		loadPage(curPage-1);
	});
	
	//[다음] 버튼 눌렀을때 
	$("button#next").click(function(){
		var curPage = parseInt($("input#page").val())
		loadPage(curPage+1);
	});

	 
});


// page번째 페이지 목록 로딩
// TODO
function loadPage(page){
	$.ajax({
		url : "${pageContext.request.contextPath}/mypageAjax/memberLikeList.ajax/${sessionScope.userUID}/<%= writePages%>/" + page,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				// TODO : 페이지 업데이트
				if(updateList(data)){
				   // 페이지 로딩 성공하면 현재 페이지 정보 업데이트
				   $("input#page").val(page);
				}
			}	
		}
	});
} // end loadPage()
 

// TODO
function updateList(jsonObj){
	result = "";
	
	if(jsonObj.status == "OK"){
		
		var count = jsonObj.count; // 글 개수
		var items = jsonObj.list; // 글 목록
		
		
		var i;
		for(i = 0; i < count; i++){			
			result += "<div class='col-sm col-md-6 col-lg-3'>";
			result += "<div class='product'>";
			result += "<a href='${pageContext.request.contextPath}/user/productInfo.do/"+ items[i].g_uid +"' class='img-prod'>";
			result += "<img class='img-fluid' src='${pageContext.request.contextPath}/img/goods/"+ items[i].g_img +"'/>";
			result += "</a>";
			result += "<div class='text py-3 px-3'>";
			result += "<h3><a href='${pageContext.request.contextPath}/user/productInfo.do/"+ items[i].g_uid +"'>"+ items[i].g_name +"</a></h3>";
			result += "<div class='d-flex'>";
			result += "<div class='pricing'>";
			result += "<p class='price'><span class='price-sale'>"+ numberWithCommas(items[i].g_price) +"원</span></p>"
			result += "</div>";			
			result += "<div class='rating'>";
			result += "<p class='text-right'>";
			result += "<a onclick=delzzim('" + items[i].gl_uid + "') class='ml-auto'>";
			result += "<span><i class='ion-ios-heart'></i></span></a></p>";
			result += "</div></div></div></div></div>"		
		}
		
		$("#categorybody").append(result);

		return true;

	}else{
		alert("내용이 없습니다.")
		return false;
	}
	
	return false;
}


function delzzim(gl_uid){
	if(confirm("해당 가구 좋아요를 취소하시겠습니까?")){
		$.ajax({
			url : "${pageContext.request.contextPath}/mypageAjax/memberLikeDelete.ajax/"+gl_uid,
			type : "GET",
			cache : false,
			success : function(data){
				if(data != 0){
					alert("취소 완료");
					location.href= "${pageContext.request.contextPath}/user/likelist.do";
				}else{
					alert("취소 실패");
					location.href= "${pageContext.request.contextPath}/user/likelist.do";
				}
			}
		});
	}else{
		history.back();
	}		
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
<body>
<input type="hidden" id="page"/>
	<div class="hero-wrap hero-bread">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="mb-5 col-md-9 ftco-animate text-center">
					<span class="quote"><i class="fas fa-quote-left"></i></span>
					<h1 class="mb-0 bread">좋아요 목록</h1>					
					<span class="quote"><i class="fas fa-quote-right"></i></span>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light">
		<div class="container-fluid">
			<div class="row" id="categorybody">	
			</div>
		</div>
		<div class="prne">
			<button type="button" id="prev" class="pgBtn">&lt</button>
			<button type="button" id="next" class="pgBtn">&gt</button>
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
<script src="${pageContext.request.contextPath}/js/user/main.js"></script>
</body>
</html>
<jsp:include page="/common/footer" />