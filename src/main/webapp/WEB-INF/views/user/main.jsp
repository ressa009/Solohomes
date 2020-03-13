<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<jsp:include page="/common/menu" />
<html lang="ko">
<head>
<title>HoloHomes</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
</head>
<body>
	<!-- 메인 이미지 -->
	<div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/img/mainbg.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-11 ftco-animate text-center">
					<h1>HoloHomes</h1>
					<h2>
						<span>Find Your Furniture</span>
					</h2>
				</div>
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span><i class="fas fa-chevron-down"></i></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="goto-here"></div>
	
	<!-- 시리즈 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<h1 class="big">Series</h1>
					<h2>Series</h2>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row d-flex mt-5">
			<c:forEach var="dto" items="${seriese }" begin="0" end="3">
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="${pageContext.request.contextPath}/series/detail.do?sr_uid=${dto.sr_uid }" class="img-prod">
							<img class="img-fluid" src="${pageContext.request.contextPath}/img/goods/${dto.sr_img }">
						</a>
						<div class="text py-3 px-3 bdGray">
							<h3><a href="${pageContext.request.contextPath}/series/detail.do?sr_uid=${dto.sr_uid }">${dto.sr_subject }</a></h3>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</section>

	<!-- 신상품 -->
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<h1 class="big">New</h1>
					<h2 class="mb-4">New Products</h2>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row d-flex mt-5">
				<c:forEach var="dto" items="${newProduct }" begin="0" end="3">
					<div class="col-sm col-md-6 col-lg ftco-animate">
						<div class="product">
							<a href="${pageContext.request.contextPath}/user/productInfo.do/${dto.g_uid }" class="img-prod">
								<img class="img-fluid" src="${pageContext.request.contextPath}/img/goods/${dto.g_img }">
							</a>
							<div class="text py-3 px-3">
								<c:choose>
									<c:when test="${fn:length(dto.g_name) > 20}">
										<h3>
											<a href="${pageContext.request.contextPath}/user/productInfo.do/${dto.g_uid}">
												${fn:substring(dto.g_name,0,20)}...
											</a>
										</h3>
									</c:when>
									<c:otherwise>
										<h3>
											<a href="${pageContext.request.contextPath}/user/productInfo.do/${dto.g_uid}">${dto.g_name }</a>
										</h3>
									</c:otherwise>
								</c:choose>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span>
												<fmt:formatNumber value="${dto.g_price }" pattern="#,###,###"/>원
											</span>
										</p>
									</div>
									<div class="rating">
									<p class="text-right">
										<span><i class="ion-ios-heart"></i> ${dto.g_likecnt }</span>
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

	<!-- 베스트상품 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<h1 class="big">Best</h1>
					<h2>Best Products</h2>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row d-flex mt-5">
				<c:forEach var="dto" items="${best }" begin="0" end="3">
				<div class="col-sm col-md-6 col-lg ftco-animate">
					<div class="product">
						<a href="${pageContext.request.contextPath}/user/productInfo.do/${dto.g_uid }" class="img-prod">
							<img class="img-fluid" src="${pageContext.request.contextPath}/img/goods/${dto.g_img }">
						</a>
						<div class="text py-3 px-3 bdGray">
							<c:choose>
								<c:when test="${fn:length(dto.g_name) > 20}">
									<h3>
										<a href="${pageContext.request.contextPath}/user/productInfo.do/${dto.g_uid}">
											${fn:substring(dto.g_name,0,20) }...
										</a>
									</h3>
								</c:when>
								<c:otherwise>
									<h3><a href="${pageContext.request.contextPath}/user/productInfo.do/${dto.g_uid}">${dto.g_name }</a></h3>
								</c:otherwise>
							</c:choose>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>
										<fmt:formatNumber value="${dto.g_price }" pattern="#,###,###"/>원
										</span>
									</p>
								</div>
								<div class="rating">
									<p class="text-right">
										<span><i class="ion-ios-heart"></i> ${dto.g_likecnt }</span>
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

	<script src="${pageContext.request.contextPath}/js/user/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/aos.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/scrollax.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/main.js"></script>
</body>
</html>
<jsp:include page="/common/footer" />