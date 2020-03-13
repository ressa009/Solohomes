<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<jsp:include page="/common/menu" />
<html lang="ko">
<head>
<title>주문하기</title>
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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function chkSubmit(){
	frm = document.forms["form"];
	
	var zipcode = frm["zipcode"].value.trim();
	var addr = frm["addr"].value.trim();
	var addr2 = frm["addr2"].value.trim();
	
	if(zipcode == ""){
		alert("우편번호는 반드시 입력해야 합니다");
		frm["zipcode"].focus();
		return false;
	}
	if(addr == ""){
		alert("주소는 반드시 작성해야 합니다");
		frm["addr"].focus();
		return false;
	}
	if(addr2 == ""){
		alert("상세주소는 반드시 작성해야 합니다");
		frm["addr2"].focus();
		return false;
	}
	
	return true;
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

$(document).ready(function() { 
	$("#sameasmine").on('click', function() { 
		if ( $(this).prop('checked') ) {
			$("[name='zipcode']").val("${member.mb_zipcode}");
			$("[name='addr']").val("${member.mb_addr}");
			$("[name='addr2']").val("${member.mb_addr2}");
		} else { 
			$("[name='zipcode']").val("");
			$("[name='addr']").val("");
			$("[name='addr2']").val("");
		} 
	}); 
});
</script>
</head>

<body>
	<div class="ftco-section ftco-cart pb-0">
		<input type="hidden" name="mb_uid" value="${sessionScope.userUID}"/>
		<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
			<div class="cart-list">
				<table class="table" id="cart_table">
					<thead class="thead-primary">
						<tr class="text-center">
							<th>&nbsp;</th>
							<th>상품명</th>
							<th>색상</th>
							<th>단가</th>
							<th>수량</th>
							<th>총 가격</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list }" varStatus="status">
					<tr class="text-center">
						<td class="image-prod"><div class="img">
							<img class="img" src="${pageContext.request.contextPath}/img/goods/${glist[status.index].g_img }">
						</div></td>
						<td class="product-name">${glist[status.index].g_name }</td>						
						<td>${in_color[status.index]}</td>
						<td class="price" id="price">
							<fmt:formatNumber value="${glist[status.index].g_price }" pattern="#,###,###"/>
						</td>
						<td>${list[status.index].cr_amount }</td>							
						<td class="total" id="total">  
							<fmt:formatNumber value="${glist[status.index].g_price * list[status.index].cr_amount}" pattern="#,###,###"/>	
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
		</div>
		</div>
	</div>
		
	<section class="ftco-section">
		<div class="container">
        <div class="row justify-content-center">
        <div class="col-xl-8 ftco-animate">
			<form name="form" method="post" action="cartconfirmOk.do" onsubmit="return chkSubmit()">
			<div class="billing-form bg-light p-3 p-md-5">
				<input type="hidden" name="mb_uid" value="${sessionScope.userUID}"/>
				<c:forEach items="${list }" varStatus="status">
					<input type="hidden" name="cr_amount" value="${list[status.index].cr_amount }">
					<input type="hidden" name="in_uid" value="${list[status.index].in_uid }">
				</c:forEach>
				
				<h3 class="mb-2 billing-heading">배송지 작성하기</h3>
				<input type="checkbox" id="sameasmine" class="mb-5"> <span>회원정보와 동일</span>
	          	<div class="row align-items-end">
	          		<div class="col-md-6">
		                <div class="form-group">
		                	<label for="username">주문자 이름</label>
		                  	<input type="text" class="form-control" value="${member.mb_name}" disabled>
		                </div>
	              	</div>

                	<div class="w-100"></div>             
                	<div class="col-md-6">
		            	<div class="form-group">
		            		<label for="postcodezip">우편번호</label>
		                  	<input type="text" class="form-control" name="zipcode" id="sample6_postcode">
		                </div>
		            </div>
		            <div class="col-md-6">
		                <div class="form-group">
		                	<input type="button" class="form-control" id="zipbt" 
		                		onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		                </div>
		            </div>
		            
	              	<div class="w-100"></div>
		            <div class="col-md-12">
		            	<div class="form-group">
		            		<label for="country">주소</label>
		            		<div class="select-wrap">
		            			<input type="text" class="form-control" name="addr" id="sample6_address">
		               		</div>
		            	</div>
		            </div>
		            
		            <div class="w-100"></div>
		            <div class="col-md-6">
		            	<div class="form-group">
		                	<label for="streetaddress">상세주소</label>
		                  	<input type="text" class="form-control" name="addr2" id="sample6_detailAddress">
		                </div>
		            </div>
	           	</div>
	        </div>
	        
           	<div class="row justify-content-end" onload="totalCost()">
				<div class="col cart-wrap ftco-animate">
					<div class="p-md-5 cart-total mb-2 bg-light bdn">
						<h3>총 구매 상품</h3>
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
						<input type="submit" class="selectBtn" value="주문하기"/>
					</p>
				</div>
			</div>
           	</form>
			<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
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
<script src="${pageContext.request.contextPath}/js/user/main.js"></script>

<script type="text/javascript">
function totalCost(){
	var costlist = document.getElementsByClassName('total');
	var cost = 0;
	var i = 0;
	for (i = 0; i < costlist.length; i++) {
		cost += parseInt(costlist.item(i).innerHTML.replace(/[^0-9]/g,""));
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
</body>
</html>
<jsp:include page="/common/footer" />