<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%!
	// 페이징 관련 변수들
	int writePages = 10;
%>
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
<c:choose>
	<c:when test="${empty goods}">
		<script>
			alert("품절처리되거나 삭제된 가구입니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

<!-- html 시작 -->	
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
<head>
<title>${goods.g_name }</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/imagebox.css">

<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var re_type = frm["re_type"].value;
    if (re_type == "") {
        alert("신고사유를 선택해주세요.");
        return false;
    } else{
    	return true;
    }	    	    
}
</script>

<script>
// 이미지 큰 화면
function doShow(imgSrc) {
	document.getElementById("bigImg").src = imgSrc;
	$(".image-popup").attr("href", imgSrc);
}

// 장바구니 인서트
function goCart() {	
	var in_uid = parseInt($("#color option:selected").val());
	var cr_amount = parseInt($("#quantity").val());
	var storage = parseInt(document.getElementById(in_uid).value);
	
	if(<%= mb_uid%> == 0){
		if(confirm("로그인이 필요한 기능입니다.\n로그인화면으로 이동하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/member/login.do";
		} else{
			return false;
		}
	} else{
		if(confirm("해당 상품을 장바구니에 넣으시겠습니까?")){
			if(cr_amount > storage){
				alert("해당 색상의 재고수량은 " + storage + "개 입니다.\n구매수량을 재고수량보다 작게 선택해주세요.");
				return false;
			} else{
				location.href="${pageContext.request.contextPath}/user/cartInsert.do/<%= mb_uid%>/"+in_uid+"/"+cr_amount;
			}
		}
	}		
}

function popUp(uid) {
	if(<%= mb_uid%> == 0){
		if(confirm("로그인이 필요한 기능입니다.\n로그인화면으로 이동하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/member/login.do";
		} else{
			return false;
		}
	} else{
		$("#popUp").css("display", "block");
		var co_uid = uid;	
		var mb_uid = <%= mb_uid%>;	

		$(".accept").click(function() {
			if(chkSubmit()){
				var re_content = $('#re_content').val();
				var re_type = $("input[name='re_type']:checked").val(); 
				
				$.ajax({
					url:"${pageContext.request.contextPath}/user/review/notify.do",
					type:"POST",
					data: {
						"co_uid" : co_uid, 
						"mb_uid" : mb_uid,
						"re_content" : re_content,
						"re_type" : re_type},
					cache:false,
					success:function(data, status){
						if(data.status == "OK"){
							alert("신고되었습니다.");
							
							setTimeout(function() {
								loadPage(1);
							}, 300);	
							
							return true;
						} else{
							alert("이미 신고한 게시물입니다.");					
							return false;
						}
				}
					
			});
			}
		});
	}	
}
</script>

<!------ 페이징 AJAX 자바스크립트 ------>
<script>
$(document).ready(function(){
	$("input#page").val(1);  // 페이지 최초 로딩되면 1페이지로 기본 세팅
	loadPage(1)// page 읽어오기

	$("button#prev").click(function(){
		// 현재 페이지 정보
		var curPage = parseInt($("input#page").val());
		
		// 첫페이지였다면 ..
		if(curPage == 1){
			alert("첫 페이지입니다.");
			return;
		}
		
		// 첫페이지 아니라면 이전페이지 로딩
		loadPage(curPage - 1); 		
	});
	
	$("button#next").click(function(){
		// 현재페이지
		var curPage = parseInt($("input#page").val());
		loadPage(curPage + 1);   // 다음 페이지 로딩		
	});
});

function loadPage(page){	
	$.ajax({
		url : "${pageContext.request.contextPath}/user/review/" + ${goods.g_uid} + "/<%= mb_uid%>/<%= writePages%>/" + page,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				
				if(updateList(data)){ // 페이지 업데이트
					// 페이지 로딩이 성공한 뒤라야 현재 페이지 정보 업데이트
					$("input#page").val(page);
				}
			}
		}		
	});
} // end loadPage()

function updateList(jsonObj){
	result = "";
	
	if(jsonObj.status == "OK"){
	
		var count = jsonObj.count; // 글 개수
		var items = jsonObj.list;  // 글 목록
		var mb_uid = <%= mb_uid%>;
		var i;
		for(i = 0; i < count; i++){
			result += "<tr>\n";	
			result += "<td>" + items[i].mb_nn + "</td>\n";
			result += "<td>" + items[i].co_subject + "</td>\n";
			result += "<td>" + items[i].co_content + "</td>\n";			
			// Timestamp --> yyyy/MM/dd hh:mm:ss 로 표현
			var regDate = new Date(items[i].co_regdate);
			var strDate = regDate.getFullYear() + "." +
						(regDate.getMonth() + 1) + "." +     // +1 해추어어야 한다 
						regDate.getDate();		
			result += "<td>" +strDate + "</td>\n";
			result += "<td class='tdNotify'><button type='button' onclick='popUp(this.value)' class='tBtn notify' value='" + items[i].co_uid + "'>신고하기</button></td>"
			
			if(mb_uid == items[i].mb_uid){				
				result += "<td><button class='tBtn' value='"+ items[i].co_uid + "' onclick='goDelete(this.value)'>";
				result += "<i class='fas fa-times tBtn'></i></button></td>"
				result += "</tr>\n";
			} else{
				result +="<td></td>\n"
				result += "</tr>\n";
			}
		}
		
		$("table#list tbody").html(result); // 테이블 내용 업데이트
		return true;
	} else {
		return false;
	}
	
	return false;
}
</script>

<!------ AJAX 자바스크립트 ------>
<script>
function likeUp(){
	var url = "${pageContext.request.contextPath}/user/likeup/" + ${goods.g_uid} + "/<%= mb_uid%>";
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				var likeCnt = parseInt($('#likeCnt').val());
				alert("좋아요 상품으로 등록되었습니다.");
				$('#likeCnt').val(likeCnt + 1);					
			}
		}		
	});
}

function likeDown(){
	var url = "${pageContext.request.contextPath}/user/likedown/" + ${goods.g_uid} + "/<%= mb_uid%>";
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				var likeCnt = parseInt($('#likeCnt').val());
				alert("좋아요 취소되었습니다.");
				$('#likeCnt').val(likeCnt - 1);	
				
			}
		}		
	});
}

function goDelete(number) {	
	if(confirm("삭제하시겠습니까?")){
		var co_uid = parseInt(number);
		
		$.ajax({
			url:"${pageContext.request.contextPath}/user/review/delete.do",
			type:"POST",
			data: {"co_uid" : co_uid},
			cache:false,
			success:function(data,status){
				if(status == "success"){
					alert("삭제되었습니다.");
					location.reload();
					loadPage(1);
				}
			}
			
		})
	} else{
		return false;
	}
}
</script>
</head>
<body>
	<section class="ftco-section bg-light padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="${pageContext.request.contextPath}/img/goods/${goods.g_img}" class="image-popup">
						<img id="bigImg" src="${pageContext.request.contextPath}/img/goods/${goods.g_img}" class="img-fluid">
					</a>
					<ul class="subImgbox">
						<li class="subImg">
							<img src="${pageContext.request.contextPath}/img/goods/${goods.g_img}" onclick="doShow(this.src)">
						</li>
					<c:forEach var="gInfo" items="${gInfo }">
						<li class="subImg">
							<img src="${pageContext.request.contextPath}/img/goods/${gInfo.in_img }" onclick="doShow(this.src)">
						</li>
					</c:forEach>
					</ul>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${goods.g_name }</h3>
					<p class="price">
						<span>
							<fmt:formatNumber value="${goods.g_price }" pattern="#,###,###"/>원
						</span>						
					</p>
					<span class="like">
						<i class="ion-ios-heart"></i>
						<input id="likeCnt" type="text" value="${goods.g_likecnt }" disabled>
					</span>
					<div class="row mt-4">
						<div class="col-md-9">
							<div class="form-group d-flex">
								<div class="select-wrap">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>
									<select name="color" id="color" class="form-control">
										<c:forEach var="gInfo" items="${gInfo }">
											<option value="${gInfo.in_uid }">${gInfo.in_color }</option>
										</c:forEach>
									</select>
									<c:forEach var="gInfo" items="${gInfo }">
										<input type="hidden" id="${gInfo.in_uid }" value="${gInfo.in_inv }">									
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span>
							<input type="text" id="quantity" name="quantity"
								class="form-control input-number" value="1" min="1" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span>
						</div>
					</div>
					<p>
						<a onclick="goCart();" class="btn btn-primary py-3 px-5">장바구니</a>
						<c:choose>
							<c:when test="${empty likeYN}">
								<a class="btn likeBtn"><i class="ion-ios-heart-empty"></i></a>
							</c:when>
							<c:otherwise>
								<a class="btn likeBtn pink"><i class="ion-ios-heart"></i></a>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
			</div>
		</div>
	</section>	
	
	<section class="ftco-section-parallax">
	<div class="parallax-img d-flex align-items-center">
		<div class="container">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-9 text-center heading-section ftco-animate">
					<h1 class="big">Review</h1>
					<h2>Show our review</h2>
					<div class="row d-flex justify-content-center mt-5">
						<input type="hidden" id="page"/>
						<table id="list" class="mt-3">
							<tbody>
							</tbody>
						</table>	
					</div>
					<button type="button" id="prev" class="pgBtn">&lt</button>
					<button type="button" id="next" class="pgBtn">&gt</button>
				</div>
			</div>
		</div>
	</div>
	</section>	
	
	<div id="popUp">
		<form class="modal-notify" name="frm">
			<p>
				한줄평 신고는 이용수칙에 맞지 않는 글을 신고하는 기능이며, 반대 의견을 표시하는 것이 아닙니다.
				신고는 철회가 안되므로 신중하게 해주세요. 허위 신고의 경우 신고자가 제재받을 수 있음을 유념해주세요.
			</p>
			<input type="hidden" id="co_uid" name="co_uid" value="">
			<input type="hidden" id="mb_uid" name="mb_uid" value="">
			<div class="moBox">
				<h6>신고사유</h6>
				<ul>
					<li><input type="radio" name="re_type" value="1"> 광고/음란성</li>
					<li><input type="radio" name="re_type" value="2"> 욕설/반말/부적절한 언어</li>
					<li><input type="radio" name="re_type" value="3"> 회원 분란/비방</li>
					<li><input type="radio" name="re_type" value="4"> 지나친 정지/종교적 언행</li>
					<li><input type="radio" name="re_type" value="5"> 도배성 댓글</li>
					<li><input type="radio" name="re_type" value="6"> 기타</li>
				</ul>
				<h6>상세내용(선택)</h6>
				<div class="txtBox">
					<textarea name="re_content" id="re_content"></textarea>
				</div>				
			</div>	
			<div class="popBtnBox">
				<button class="popBtn accept" style="outline: none;">신고하기</button>
				<button class="popBtn closePop" style="outline: none;">취소하기</button>
			</div>
			
		</form>
	</div>
	
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

<script>
$(document).ready(function(){	
	var quantitiy=0;
	$('.quantity-right-plus').click(function(e){
		// Stop acting like a button
		e.preventDefault();
		// Get the field name
		var quantity = parseInt($('#quantity').val());
		// If is not undefined
		
		$('#quantity').val(quantity + 1);		
		// Increment
		});
	
	$('.quantity-left-minus').click(function(e){
		e.preventDefault();
		var quantity = parseInt($('#quantity').val());
		if(quantity>0){
			$('#quantity').val(quantity - 1);
		}
	});		    
	
	$(".likeBtn").click(function() {
		if(<%= mb_uid%> == 0){
			if(confirm("로그인이 필요한 기능입니다.\n로그인화면으로 이동하시겠습니까?")){
				location.href="${pageContext.request.contextPath}/member/login.do";
			} else{
				return false;
			}
		} else{
			var className = $(".likeBtn > i").attr('class');
			
			if(className == "ion-ios-heart-empty"){
				$(".likeBtn > i").attr('class','ion-ios-heart');
				$(".likeBtn").addClass('pink');
				likeUp();
			}
			
			else{
				$(".likeBtn > i").attr('class','ion-ios-heart-empty');
				$(".likeBtn").removeClass('pink');
				likeDown();
			}
		}		
	});
	
	$(".closePop").click(function() {		
		$("#popUp").css("display", "none");
		return false;
	});

	window.onclick = function(event) {
		var pop = document.getElementById('popUp');
		if (event.target == pop) {
			$("#popUp").css("display", "none");
			return false;
		}
	}
		
});
</script>
</body>
</html>
<jsp:include page="/common/footer" />
</c:otherwise>
</c:choose>