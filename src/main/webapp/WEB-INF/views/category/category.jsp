<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
	<c:when test="${empty gdto || fn.length(gdto) == 0 }">
		<script>
			alert("해당 카테고리의 상품이 없습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	
<jsp:include page="/common/menu" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${typeName}</title>
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

<body>
	<div class="hero-wrap hero-bread">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<span class="quote"><i class="fas fa-quote-left"></i></span>
					<h1 class="mb-0 bread">${typeName}</h1>
					<span class="quote"><i class="fas fa-quote-right"></i></span>
				</div>
			</div>
		</div>
		<div id="sortdivt">
			<div id ="sortdiv" class="mt-3 col-md-2 col-xs-12">
			    <select class="form-control" id="sortSelect">
			        <option value="0" selected>최신순</option>
			        <option value="1">가격순</option>
			        <option value="2">좋아요순</option>
			    </select>
			</div>
		</div>
	</div>

	<section class="ftco-section bg-light">
		<div class="container-fluid">
			<div class="row" id="categorybody">
				<c:forEach var="gdto" items="${gdto }">
				<div class="col-sm col-md-6 col-lg-3 ftco-animate">
					<div class="product" onclick="location.href = '${pageContext.request.contextPath}/user/productInfo.do/${gdto.g_uid }'">
						<a class="img-prod">
							<img class="img-fluid" src="${pageContext.request.contextPath}/img/goods/${gdto.g_img}">
						</a>
						<div class="text py-3 px-3">
							<h3>
								<a>${gdto.g_name }</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="price-sale"><fmt:formatNumber type="number" maxFractionDigits="3" value="${gdto.g_price}" />원</span>
									</p>
								</div>
								<div class="rating">
									<p class="text-right">
										<span><i class="ion-ios-heart"></i> ${gdto.g_likecnt }</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
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

<script>
$(document).ready(function(){	
	$("select#sortSelect").change(function(){
		var sortType = parseInt($("select#sortSelect").val());
		
		$.ajax({
			url: "${pageContext.request.contextPath}/Cajax/typeCheck.do/" + sortType + "/" + ${g_type} + "",
			type: "GET",
			cache : false,
			success: function(data, status){
				if(status == "success"){
					upDateList(data);
				} else{
					alert("정렬 변경 실패");
				}
			}
		});
	
	});
	
});

function upDateList(jsonObj){
	var result = "";
	var count = jsonObj.count;
	var list = jsonObj.list;
	var status = jsonObj.status;
	
	if(status == "success"){
		for(var i = 0; i < count; i++){
			result += "<div class='col-sm col-md-6 col-lg-3'>";
			result += "<div class='product' onclick='movePage(" + list[i].g_uid + ")'>";
			result += "<a class='img-prod'><img class='img-fluid' src='../img/goods/" + list[i].g_img + "'></a>";
			result += "<div class='text py-3 px-3'>";
			result += "<h3><a>" + list[i].g_name + "</a></h3>";
			result += "<div class='d-flex'><div class='pricing'>";
			result += "<p class='price'><span class='price-sale'>" + numberWithCommas(list[i].g_price) + "</span>원</p></div>";
			result += "<div class='rating'><p class='text-right'>";
			result += "<span><i class='ion-ios-heart'></i> " + list[i].g_likecnt + "</span></p>";
			result += "</div></div></div></div></div>";
		}
	} else {
		result = "정렬 실패";
	}
	$(".ftco-animate").css({
		visibility : "inherit",
		opacity : "100"
	});
	$("div#categorybody").html(result);
}

function movePage(uid) {
	location.href = "../user/productInfo.do/"+uid;
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>

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
</c:otherwise>
</c:choose>