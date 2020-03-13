<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%!
   int writePages = 5;
%>

<jsp:include page="/common/menu" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css"/>
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/bootstrap-material-datetimepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/imagebox.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://code.jquery.com/jquery-1.12.3.min.js" integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
<script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/user/bootstrap-material-datetimepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/imagebox.css">

<script type="text/javascript">
// TODO
$(document).ready(function(){
	$('#searchStartDate').bootstrapMaterialDatePicker({
	    weekStart: 0, 
	    format: 'YYYY-MM-DD', 
	    time: false , 
	    shortTime : false, 
	    minDate: null, 
	    maxDate: null
	}).on('change', function(e, date) {
	    $('#searchEndDate').bootstrapMaterialDatePicker('setMinDate', date);
	});
		
	
	$('#searchEndDate').bootstrapMaterialDatePicker({
	    weekStart: 0, 
	    format: 'YYYY-MM-DD', 
	    time: false , 
	    shortTime : false,
	});
	

   $("input#page").val(1); // 페이지 최초 로딩되면 1페이지로
   //TODO : n Page 읽어오기
   loadPage(1, searchStartDate, searchEndDate, keyword);
   
   //[이전] 버튼 눌렀을때
   $("button#prev").click(function(){
      // 현재 페이지 정보
      var curPage = parseInt($("input#page").val());
      // 첫페이지였다면
      if(curPage == 1){
         alert("이전 페이지가 없습니다");
         return;
      }
      // 첫페이지 아니라면 이전페이지 로딩
      loadPage(curPage-1, searchStartDate, searchEndDate, keyword);
   });
   
   //[다음] 버튼 눌렀을때 
   $("button#next").click(function(){
      var curPage = parseInt($("input#page").val())
      loadPage(curPage+1, searchStartDate, searchEndDate, keyword);
 
   });
   
   // 닫기버튼 눌렀을 때
   $(".closePop").click(function() {		
		$("#popUp").css("display", "none");
		return false;
	});
});




function popUp(py_uid, option) {

	var mb_uid = "${sessionScope.userUID}";
	var g_name = "";
	var py_amount = "";
	var py_confrim = "";
	var g_uid = "";
	var co_uid = "";
	var reviewProduct = "";
	var reviewBtn = ""; 
	var reviewUpdateBtn="";
	var value = "";
	 var curPage = parseInt($("input#page").val());

	var urlText = "${pageContext.request.contextPath}/mypageAjax/purchaseProductInfo.ajax/"+ py_uid;
	
	 $.ajax({
	      url : urlText,
	      type : "GET",
	      cache : false,
	      success : function(data, status){
	         if(status == "success"){
	           	g_name = data.dto.g_name;
	           	py_amount = data.dto.py_amount;
	        	py_confirm = data.dto.py_confirm;
	           	g_uid = data.dto.g_uid;
	           	co_uid = data.dto.co_uid;
	         }else{
	        	 alert("141행 ajax 실패");
	         }
	      }
	   });

	 
setTimeout(function() {
	 
	if(option == 1){

		var urlText = "${pageContext.request.contextPath}/mypageAjax/reviewUpdate.ajax/" + co_uid;

		$.ajax({
	         url : urlText,
	         type : "GET",
	         cache : false,
	         success : function(data, status){
	            if(status == "success"){
	            	$('#co_subject').val(data.dto.co_subject); 
	            	$('#co_content').val(data.dto.co_content);
	            }else{
		             alert("리뷰 불러오기 실패");
		        	 return false;
	            }
	         }
	      });
		
		
		
		$('#title').html("리뷰수정");
		$("#popUp").css("display", "block"); // 띄우기
		
		 reviewProduct += "<label>구매상품: "+g_name+"</label><br>";
		 reviewProduct += "<label>구매수량: "+py_amount+"</label>"; 
		 
		 $('#flag').html(reviewProduct);

		reviewUpdateBtn += "<button id='update' class='popBtn accept'>수정</button>";
		reviewUpdateBtn += "<button class='popBtn closePop'>취소</button>";
		
		$('.popBtnBox').html(reviewUpdateBtn);		
	

		$("#update").click(function() {  // 확인버튼 눌렀을 때
			
			var co_subject = $('#co_subject').val();
			var co_content = $('#co_content').val();
		
			var urlText = "${pageContext.request.contextPath}/mypageAjax/reviewUpdateOk.ajax";
			
			$.ajax({
		         url : urlText,
		         type : "POST",
		         data : {
		        	"co_uid" : co_uid,
		        	"co_subject" : co_subject,
		        	"co_content" : co_content
		         },
		         cache : false,
		         success : function(data, status){
		            if(status == "success"){
		            	alert("리뷰 수정 완료");
		           		return false;
		            }else{
		            	alert("리뷰 수정 실패");
		            	return false;
		            }
		         }
		      });
			
			
			loadPage(1, searchStartDate, searchEndDate, keyword);
			return true;
		});
		
	}else if(option == 0){
		
		if(py_confirm==0){
			alert("구매확정 후에 리뷰 작성이 가능합니다.");
			return false;
		}

		 reviewProduct += "<label>구매상품: "+g_name+"</label><br>";
		 reviewProduct += "<label>구매수량: "+py_amount+"</label>"; 		 
		 $('#flag').html(reviewProduct);
		
		reviewBtn += "<button id='regist' class='popBtn accept'>등록</button>";
		reviewBtn += "<button class='popBtn closePop'>취소</button>";
		$('.popBtnBox').html(reviewBtn);

		$('#title').html("리뷰 작성");
		$("#popUp").css("display", "block"); // 띄우기
		
		
		
		$("#regist").click(function() {  // 확인버튼 눌렀을 때

			var co_subject =  $('#co_subject').val();
			var co_content = $('#co_content').val();
		
			if(co_subject == ""){
				
				alrt("제목을 작성해주세요.");
				
				return false;

			}else if(co_content == ""){
				
				alrt("내용을 작성해주세요.");
				
				return false;
			}
					
			console.log("co_subject: " + co_subject+",  co_content: "+co_content);
			
			var urlText = "${pageContext.request.contextPath}/mypageAjax/reviewWriteOk.ajax";
			
			$.ajax({
		         url : urlText,
		         type : "POST",
		         data : {
		        	"mb_uid" : mb_uid,
		        	"g_uid" : g_uid,
		        	"py_uid" : py_uid,
		        	"co_subject" : co_subject,
		        	"co_content" : co_content
		         },
		         cache : false,
		         success : function(data, status){
		            if(status == "success"){
		            	alert("리뷰작성 완료");
		               loadPage(curPage, searchStartDate, searchEndDate, keyword);
		            }else{
		            	alert("리뷰작성 실패");
		            }
		         }
		      });
		
	});
		
		return true;
	}
}, 300);
}


function loadPage(page, searchStartDate, searchEndDate, keyword){
	
   var urlText;
   
   var searchStartDate = $('#searchStartDate').val();
   var searchEndDate = $('#searchEndDate').val();
   var keyword = $('#keyword').val();

   if(searchStartDate == "" && searchEndDate == "" && keyword == ""){
      urlText = "${pageContext.request.contextPath}/mypageAjax/memberPurchaseList.ajax/${sessionScope.userUID}/<%= writePages%>/" + page;
   }else if(searchStartDate != "" || searchEndDate != ""){
      urlText = "${pageContext.request.contextPath}/mypageAjax/searchDate.ajax/${sessionScope.userUID}/" + searchStartDate + "/" + searchEndDate + "/<%= writePages%>/" + page;
   }else if(keyword != ""){
      urlText = "${pageContext.request.contextPath}/mypageAjax/searchKeyword.ajax/${sessionScope.userUID}/" + keyword + "/<%= writePages%>/" + page;
   }
   
   $.ajax({
      url : urlText,
      type : "GET",
      cache : false,
      success : function(data, status){
         if(status == "success"){
            if(updateList(data, page)){
               // 페이지 로딩 성공하면 현재 페이지 정보 업데이트
               $("input#page").val(page);
            }
         }
      }
   });
} 
 

function pyConfrim(py_uid){
   
	urlText = "${pageContext.request.contextPath}/mypageAjax/purchaseConfirm.ajax/${sessionScope.userUID}/"+ py_uid;
	var curPage = $("input#page").val();
	
	$.confirm({
	    title: 'Confirm!',
	    content: '해당 주문의 구매를 확정하시겠습니까?',
	    buttons: {
	        confirm: function () { 
	            $.ajax({
	               url : urlText,
	               type : "GET",
	               cache : false,
	               success : function(data, status){
	                  if(status == "success"){
	                  	$.alert({
	      				    title: 'Alert!',
	      				    content: '구매 확정 완료!',
	      				});             
	                     loadPage(curPage, searchStartDate, searchEndDate, keyword);
	                  }
	               }
	            });
	           
	        },
	        cancel: function () {
	        	loadPage(curPage, searchStartDate, searchEndDate, keyword);
	        }
	    }
	});
	
}

// TODO
function updateList(jsonObj, page){
   result = "";
   if(jsonObj.status == "OK"){
      
      var count = jsonObj.count; // 글 개수
      var rowCnt = jsonObj.purchaseCnt; // 행개수
      var items = jsonObj.list; // 글 목록
     
      var index = (page-1)*5;
          
      for(i = 0; i < count; i++){
	  
         result += "<tr class='text-center'>";
         result += "<td>" + (index + i + 1) +"</td>";
         
      // Timestamp --> yyyy/MM/dd hh:mm:ss 로 표현
         var regDate = new Date(items[i].py_regdate);
         var strDate = regDate.getFullYear() + "-" +
                  (regDate.getMonth() + 1) + "-" +     // +1 해추어어야 한다 
                  regDate.getDate();
         
         result += "<td>" +strDate + "</td>";         
         result += "<td class='imageTd'><a href='${pageContext.request.contextPath}/user/productInfo.do/"+ items[i].g_uid +"' class='img-prod'><img class='img-fluid' src='${pageContext.request.contextPath}/img/goods/"+ items[i].in_img +"'/></a></td>"
         result += "<td class='productTd'>" + items[i].g_name +"</td>";
         result += "<td>" + items[i].in_color +"</td>\n";       
         result += "<td>" + items[i].py_amount +"</td>\n";        
         result += "<td class='price'>" + numberWithCommas(items[i].g_price) +"원</td>\n";
         var totalPrice = parseInt(items[i].g_price) * parseInt(items[i].py_amount);
         result += "<td class='price'>"+numberWithCommas(totalPrice)+"원</td>\n";
         if(items[i].py_confirm == 1){
            result += "<td>구매 확정 완료</td>\n";
         }else{
            result += "<td><input type='button' class='purchaseListBtn' name='py_uid' value='구매확정' onclick='pyConfrim("+items[i].py_uid+")'/></td>\n";
         }
         
         if(items[i].co_uid == "" ){
        	items[i].co_uid = 0;

            result += "<td><input type='button' class='writeBtn purchaseListBtn' onclick='popUp("+items[i].py_uid+", 0)' value='작성하기'/></td>\n";  
         }else{
            result += "<td><input type='button' class='updateBtn purchaseListBtn' onclick='popUp("+items[i].py_uid+", 1)' value='수정'/></td>\n";
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


function searchDate(){
   
   var searchStartDate = $('#searchStartDate').val();
   var searchEndDate = $('#searchEndDate').val();
   var keyword = "";
   var curPage = parseInt($("input#page").val());

   if(searchStartDate == '' || searchEndDate == ''){
      alert("검색할 기간을 입력해주세요");
      return;
   }      
   loadPage(curPage, searchStartDate, searchEndDate, keyword);
}

function searchKeyword(){
   
   var searchStartDate = "";
   var searchEndDate = "";
   var keyword = $('#keyword').val();  
   var curPage = parseInt($("input#page").val());
   
   if(keyword == ''){
      alert("검색어를 입력해주세요");
      return;
   }   
   loadPage(curPage, searchStartDate, searchEndDate, keyword);
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>   
</head>

<body>
<input type="hidden" id="page"/>

	<div class="hero-wrap hero-bread">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<span class="quote"><i class="fas fa-quote-left"></i></span>
					<h1 class="mb-0 bread">구매목록</h1>				
					<span class="quote"><i class="fas fa-quote-right"></i></span>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-cart">
		<div class="container">
			<!------------ 달력 ------------>
			<div class="row">
				<div class="col-md-3">
					<div class="form-control-wrapper">
						<input type="text" id="searchStartDate" class="form-control floating-label" placeholder="Start Date">
					</div>
				</div>	
				<div class="col-md-3">
					<div class="form-control-wrapper">
						<input type="text" id="searchEndDate" class="form-control floating-label" placeholder="End Date">
					</div>
				</div>
				<div class="col-md-3">
					<p>
						<a onclick="searchDate();" class="btn btn-primary py-3 px-5" id="dateOk">날짜적용하기</a>
					</p>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
						<table class="table" id="list">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>No.</th>
								<th>구매일</th>
								<th colspan="2">구매상품</th>	
								<th>색상</th>							
								<th>수량</th>						
								<th>단가</th>
								<th>총 금액</th>
								<th>구매확정</th>
								<th>리뷰</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						</table>
					</div>
					<div class="searchBox">
						<div class="col-md-10">
							<div class="form-control-wrapper">
								<input type="text" class="form-control floating-label" name="keyword" id="keyword"/>
							</div>
						</div>
						<button type="button" onclick="searchKeyword();" name="keyword_search_btn" class="searchBtn mt-3" id="keyword_search_btn">
							<i class="fas fa-search"></i>
						</button>	
					</div>
				</div>
				<div class="prne">
					<button type="button" id="prev" class="pgBtn">&lt</button>
					<button type="button" id="next" class="pgBtn">&gt</button>
				</div>
			</div>
		</div>
	</section>
	
	
	 <div id="popUp">
      <form class="modal-notify" name="writeFrm" action="" method="post" style="height: auto; margin-top:-250px;">
         <p id="title">
         </p>
      
         <div class="moBox">  
            <div class="txtBox">
                <label id="flag"></label>             
                <input type="text" id="co_subject" class="form-control" placeholder="Subject"/>
                <textarea id="co_content" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>   
            </div>                       
         </div>   
         <div class="popBtnBox">    
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
	
	
	
<script src="${pageContext.request.contextPath }/js/user/date.js"></script>     
<script src="${pageContext.request.contextPath }/js/user/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/user/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath }/js/user/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath }/js/user/aos.js"></script>
<script src="${pageContext.request.contextPath }/js/user/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath }/js/user/scrollax.min.js"></script>
<script src="${pageContext.request.contextPath }/js/user/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/js/user/main.js"></script>
	
	
	
	
</body>
</html>
<jsp:include page="/common/footer" />
