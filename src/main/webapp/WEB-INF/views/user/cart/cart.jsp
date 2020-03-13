<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<jsp:include page="/common/menu" />
<html lang="ko">
<head>
<title>장바구니</title>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function check(data){
	var check = $(data).is(":checked")
	var table = document.getElementsByTagName('tbody')[0].childNodes;
	var i = 0;
	for (i = 1; i < table.length; i+=2) {
		if(check){
			table[i].cells[0].childNodes[0].checked = true;
			totalCost();
		} else {
			table[i].cells[0].childNodes[0].checked = false;
			totalCost();
		}
	}
}

$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});

function CheckForm(Join){
	var chk = false;
	var arr_cruid = document.getElementsByName("cr_uid");
	
	for(var i = 0; i < arr_cruid.length; i++){
	    if(arr_cruid[i].checked == true) {
	        chk = true;
	        break;
	    }
	}
	
	if(!chk){
	    alert("상품을 한개 이상 선택해주세요.");
	    return false;
	}
}


</script>
</head>
<body>
	<c:choose>
	<c:when test="${sessionScope.userUID eq ''}">
		<script>
			location.href = "${pageContext.request.contextPath}/user/main.do";
		</script>
	</c:when>
	<c:when test="${empty list || fn.length(list) == 0 }">
		<script>
			alert("장바구니가 비어있습니다");
			location.href = "${pageContext.request.contextPath}/user/main.do";
		</script>
	</c:when>
	<c:otherwise>

	<form action="cartconfirm.do" onSubmit="return CheckForm(this)" method="post" 
		class="ftco-section ftco-cart">
		<input type="hidden" name="mb_uid" value="${sessionScope.userUID}"/>
		<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
			<div class="cart-list">
				<table class="table" id="cart_table">
					<thead class="thead-primary">
						<tr class="text-center">
							<th><input type="checkbox" onclick="check(this);"></th>
							<th>&nbsp;</th>
							<th>상품명</th>
							<th>색상</th>
							<th>단가</th>
							<th>수량</th>
							<th>총 가격</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${gilist }" var="gi" varStatus="status">
					<tr class="text-center">
	          			<td><input type="checkbox" name="cr_uid" value="${list[status.index].cr_uid }" onclick="totalCost();"></td>
						<td class="image-prod"><div class="img">
							<img class="img" src="${pageContext.request.contextPath}/img/goods/${glist[status.index].g_img }">
						</div></td>
						<td class="product-name">${glist[status.index].g_name }</td>						
						<td>
							<select name="${list[status.index].cr_uid }in_color">
								<c:forEach items="${gi}" var="i">
									<c:choose>
										<c:when test="${i.in_color == colorselect[status.index] }">
										    <option value="${i.in_color }" selected="selected">${i.in_color }</option>
										</c:when>
										<c:otherwise>
										    <option value="${i.in_color }">${i.in_color }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
						<td class="price" id="price">
							<fmt:formatNumber value="${glist[status.index].g_price }" pattern="#,###,###"/>원	
						</td>
						<td class="quantity">
							<div class="quantityBox">
							<span class="input-group-btn mr-2 cart_btn" onclick="minus(this);">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span>
							<input type="text" id="quantity" name="${list[status.index].cr_uid }cr_amount" class="cart_input form-control input-number" 
								value="${list[status.index].cr_amount }">
							<span class="input-group-btn ml-2 cart_btn" onclick="plus(this);">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span>
							</div>						
						</td>							
						<td class="total" id="total">
							<fmt:formatNumber value="${glist[status.index].g_price * list[status.index].cr_amount}" pattern="#,###,###"/>원	
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
		</div>
		<p>
			<input type="submit" class="selectBtn selectBtn2" value="선택상품 삭제하기" onclick="javascript: form.action='cartdelete.do';"/>
		</p>
		
		<div class="row justify-content-end" onload="totalCost()">
			<div class="col cart-wrap ftco-animate">
				<div class="p-md-5 cart-total mb-2">
					<h3>주문내역</h3>
					<p class="d-flex">
						<span>가격</span> 
						<span id="cost"></span>
					</p>
					<p class="d-flex">
						<span>배송비</span> 
						<span>무료</span>
					</p>
					<hr>
					<p class="d-flex total-price">
						<span>최종 가격</span> 
						<span id="totalcost"></span>
					</p>
				</div>
				<p class="text-center">
					<input type="submit" class="selectBtn" value="선택상품 구매하기"/>
				</p>
			</div>
		</div>
	</div>
	</form>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#c80a1e" /></svg>
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
function minus(data){
	var tr = data.parentNode.parentNode.parentNode;
	var input = tr.cells[5].childNodes[1].childNodes[3];
	var cost = tr.cells[4].childNodes[0].nodeValue.replace(/[^0-9]/g,"");
	if(parseInt(input.value) <= 1) return;
	input.value = parseInt(input.value) - 1;
	tr.cells[6].childNodes[0].nodeValue = cost * input.value;
	totalCost();
}

function plus(data){
	var tr = data.parentNode.parentNode.parentNode;
	var input = tr.cells[5].childNodes[1].childNodes[3];
	var cost = tr.cells[4].childNodes[0].nodeValue.replace(/[^0-9]/g,"");
	input.value = parseInt(input.value) + 1;
	tr.cells[6].childNodes[0].nodeValue = numberWithCommas(cost * input.value) + "원";
	totalCost();
}

function totalCost(){
	var table = document.getElementsByTagName('tbody')[0].childNodes;
	var cost = 0;
	var i = 0;
	for (i = 1; i < table.length; i+=2) {
		if($(table[i].cells[0].childNodes[0]).is(":checked")){
			cost += parseInt(table[i].cells[6].childNodes[0].nodeValue.replace(/[^0-9]/g,""));
		}
	}
	cost = numberWithCommas(cost);
	$('#cost').html(cost + "원");
	$('#totalcost').html(cost + "원");
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

document.getElementById("cost").onload = totalCost();

</script>
</c:otherwise>
</c:choose>
</body>
</html>
<jsp:include page="/common/footer" />