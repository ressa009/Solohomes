<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%!
	int writePages = 5;
%>
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>1:1 문의 목록</title>

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
   
   
    <!-- 표 -->
    <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/css/main.css">
	<!--===============================================================================================-->
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/css/mypage.css">
	
</head>

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

<script>
// TODO
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
	


function loadPage(page){

	var urlText = "${pageContext.request.contextPath}/mypageAjax/memberRequestList.ajax/${sessionScope.userUID}/<%= writePages%>/" + page;	
	
	$.ajax({
		url : urlText,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				if(updateList(data)){
				   // 페이지 로딩 성공하면 현재 페이지 정보 업데이트
				   $("input#page").val(page);
				}
			}
		}
	});
} 
 


// TODO
function updateList(jsonObj){
	result = "";
	
	if(jsonObj.status == "OK"){
		
		var count = jsonObj.count; // 글 개수
		var items = jsonObj.list; // 글 목록
		
		var i;
		for(i = 0; i < count; i++){
			result += "<tr>\n";
			result += "<td>" + (i+1) +"</td>\n";
			
			var rq_type = items[i].rq_type;
			var rq_type_str;
			
			switch(rq_type){
			case 1: 
				rq_type_str = "배송문의";
				break;
			case 2:
				rq_type_str = "상품문의";
				break;
			case 3:
				rq_type_str = "결제문의";
				break;
			case 4:
				rq_type_str = "환불문의";
				break;
			case 5:
				rq_type_str = "기타문의";
				break;
				
			}
				
			result += "<td>" + rq_type_str +"</td>\n";
			
			var url = "${pageContext.request.contextPath}/user/mypage/requestView.do/"+ items[i].rq_uid;
			
			result += "<td colspan='3'><a href="+ url +">" + items[i].rq_subject +"</a></td>\n";

			// Timestamp --> yyyy/MM/dd hh:mm:ss 로 표현j r
			var regDate = new Date(items[i].rq_regdate);
			var strDate = regDate.getFullYear() + "-" +
						(regDate.getMonth() + 1) + "-" + 
						regDate.getDate();
			result += "<td>" +strDate + "</td>\n";
			
			var response = items[i].rq_response;
			
			if(response != null){
				result += "<td>답변 완료</td>\n";
			}else{
				result += "<td>N</td>\n";
			}
		
			result += "</tr>\n";
		}
		
		$("table#list tbody").html(result); // 테이블 내용 업데이트
		
		return true;
		
	}else{
		alert("내용이 없습니다.")
		return false;
	}
	
	return false;
}

</script>		
<body>
<div id="heightBox">
	<input type="hidden" id="page"/>

	
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


	<!-- 문의목록 테이블 -->	
	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div id="writeRequestBtn" class="col-md-12  ftco-animate">
		        	<input type="button" id="writeBtn" value="문의등록" onclick="location.href='${pageContext.request.contextPath}/user/mypage/requestWrite.do/${sessionScope.userUID}'"/>
		        </div>   
			</div>	
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">	
						<table class="table" id="list">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>No.</th>
								<th>문의분류</th>
								<th colspan="3">문의제목</th>	
								<th>작성시간</th>							
								<th>답변여부</th>						
							</tr>
						</thead>
						<tbody>
						</tbody>
						</table>
					</div>
				</div>
				<div class="prne">
					<button type="button" id="prev" class="pgBtn">&lt</button>
					<button type="button" id="next" class="pgBtn">&gt</button>
				</div>
			</div>
		</div>
	</section>
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
	
	<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script>
			$('.js-pscroll').each(function(){
				var ps = new PerfectScrollbar(this);
	
				$(window).on('resize', function(){
					ps.update();
				})
			});	
		</script>
	<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath }/css/user/mypage/js/main.js"></script>


</body>
</html>
<jsp:include page="/common/footer"/>