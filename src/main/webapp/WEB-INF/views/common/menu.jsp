<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${pageContext.request.contextPath}/img/favi.png">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function sendKeyword(){
	var userKeyword = document.getElementById("userKeyword").value;
	if(userKeyword == ""){
		hide();
		return;
	}
	var params = "userKeyword=" + userKeyword;
	$.ajax({
		url : "${pageContext.request.contextPath}/searchAJAX/searchOk.ajax?" + params,		
		type : "GET",
		cache : false,
		success : function(data, status) {
			if(status == "success"){
				displaySuggest(data);
			}
		}
	});
}

function displaySuggest(data){
	var resultText = data;
	var resultArray = resultText.split("|");
	var count = parseInt(resultArray[0]);
	var keywordList = null;
	var start = document.getElementById("userKeyword").value;
	if(count > 0){
		keywordList = resultArray[1].split(",");
		var html = "";
		for (var i = 0; i < keywordList.length; i+=2) {
			if(keywordList[i] == ""){
				break;
			}
			if(1 <= parseInt(keywordList[i+1]) && parseInt(keywordList[i+1]) <= 10){
				html += "<a style='text-decoration: none' href='${pageContext.request.contextPath}/category/category.do?g_type=" +
				keywordList[i+1] + "'>" +
				"<span style='color:#A91F24'><b>" + start + "</b></span>" + 
				"<span style='color:grey'><b>" + keywordList[i].substring(start.length, keywordList[i].length) + 
				"/카테고리" + "</b></span>" + "</a><br>";				
			} else if(11 <= parseInt(keywordList[i+1]) && parseInt(keywordList[i+1]) <= 15){
				html += "<a style='text-decoration: none' href='${pageContext.request.contextPath}/series/detail.do?sr_uid=" +
				(parseInt(keywordList[i+1])-10) + "'>" +
				"<span style='color:#A91F24'><b>" + start + "</b></span>" + 
				"<span style='color:grey'><b>" + keywordList[i].substring(start.length, keywordList[i].length) + 
				"/시리즈" + "</b></span>" + "</a><br>";	
			} else {
				html += "<a style='text-decoration: none' href='${pageContext.request.contextPath}/user/productInfo.do/" +
				keywordList[i+1] + "'>" +
				"<span style='color:#A91F24'><b>" + start + "</b></span>" + 
				"<span style='color:grey'><b>" + keywordList[i].substring(start.length, keywordList[i].length) + 
				"</b></span>" + "</a><br>";	
			}
		}
		var suggestListDiv = document.getElementById("suggestListDiv");
		suggestListDiv.innerHTML = html;
		show();
	} else {
		hide();
	}
}


function select(selectKeyword){
	document.myFrom.userKeyword.value = selectKeyword;
	hide();
}

function show(){
	var suggetDiv = document.getElementById("suggestDiv");
	suggestDiv.style.display = "block";
}

function hide(){
	var suggetDiv = document.getElementById("suggestDiv");
	suggestDiv.style.display = "none";
}

function sessionchk(){
	var sessionUid = "${sessionScope.userUID}";
	if(sessionUid.trim() == ""){
		alert("로그인이 되어있지 않습니다");
		location.href = "${pageContext.request.contextPath}/member/login.do";
		return false;
	}
	return true;
}

$(window).resize(function() {
	var winWidth = $(window).width();
	var modal = document.getElementById('myModal');
	if(winWidth >= 600){
		$(".mo_menu").removeClass("show");
		modal.style.display = "none";
	}
});

window.addEventListener("click", function() {
	var modal = document.getElementById('myModal');
	if (event.target == modal) {
		modal.style.display = "none";
		$(".mo_menu").removeClass("show")
	}	
});
</script>
</head>
<body>
<%
	String userID = null;
	int userLevel = 0;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(session.getAttribute("userLevel") != null){
		userLevel = (Integer)session.getAttribute("userLevel");
	}
%>
	<header class="header">
		<div class="container">
			<div class="pc">
				<a id="menuBtn"><i class="fas fa-bars"></i></a>
				<a id="brand" href="${pageContext.request.contextPath}/user/main.do">
					<img src="${pageContext.request.contextPath}/img/flogo.png">
				</a>
			</div>
			<div class="pc mo_none">
				<form action="${pageContext.request.contextPath}/search/searchOk.do" name="myForm" method="POST" autocomplete="off">
					<input type="text" class="searchTxt" id="userKeyword" name="userKeyword" onkeyup="sendKeyword();" autocomplete="off"/>
					<button style="border:0" type="submit" class="searchBtn"><i class="fas fa-search"></i></button>
					<div id="suggestDiv" class="suggest">
						<div id="suggestListDiv"></div>
					</div>
				</form>
			</div>
			<div class="pc mo_none">
		
<%
	if(userID == null){
%>	
				<a id="logInOut" class="login" href="${pageContext.request.contextPath}/member/login.do">로그인</a>
<%
	} else {
%>
				<a id="logInOut" class="login" href="${pageContext.request.contextPath}/member/logOut.do">로그아웃</a>
<%
	}
%>		
<%
	if(userLevel > 1){
%>
				<a class="login mr-2" id="adminBtn" href="${pageContext.request.contextPath}/manager/index.do">관리자</a>
<%
	}
%>		
			</div>
		</div>
	</header>

	<ul class="mo_menu">
		<li><a class="f">가구 <i class="fas fa-sort-down"></i></a></li>
			<ul class="f_sub pl-0">
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=5">거실장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=3">서랍장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=4">소파</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=6">옷장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=8">의자</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=9">책상</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=10">책장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=1">침대</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=7">테이블</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=2">화장대</a></li>
			</ul>
		<li><a href="${pageContext.request.contextPath}/series/series.do">시리즈</a></li>
		<li><a class="mypage">마이페이지 <i class="fas fa-sort-down"></i></a></li>
			<ul class="my_sub pl-0">
				<li><a href="${pageContext.request.contextPath}/cart/cart.do?mb_uid=${sessionScope.userUID}" >장바구니</a></li>
				<li><a href="${pageContext.request.contextPath}/user/purchaselist.do">구매목록</a></li>
				<li><a href="${pageContext.request.contextPath}/user/likelist.do">좋아요한 상품</a></li>
				<li><a href="${pageContext.request.contextPath}/user/requestlist.do">1:1문의</a></li>
				<li><a href="${pageContext.request.contextPath}/user/memberCheck.do">회원정보수정</a></li>	
			</ul>	
		<li><a href="#">검색</a></li>				
<%
	if(userLevel > 1){
%>
				<li><a href="${pageContext.request.contextPath}/manager/index.do">관리자페이지</a></li>
<%
	}
%>	

<%
	if(userID == null){
%>	
				<li><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
<%
	} else {
%>
				<li><a href="${pageContext.request.contextPath}/member/logOut.do">로그아웃</a></li>
<%
	}
%>	
		</ul>

	<div class="menu" id="myModal">
		<div class="modal-content">
			<ul class="right">
				<h3>가구</h3>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=5">거실장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=3">서랍장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=4">소파</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=6">옷장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=8">의자</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=9">책상</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=10">책장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=1">침대</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=7">테이블</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=2">화장대</a></li>
			</ul>
			<ul>
				<h3>시리즈</h3>
				<li><a href="${pageContext.request.contextPath}/series/series.do">시리즈</a></li>
			</ul>
			<ul class="left">
				<h3>마이페이지</h3>
				<li><a href="${pageContext.request.contextPath}/cart/cart.do?mb_uid=${sessionScope.userUID}" >장바구니</a></li>
				<li><a href="${pageContext.request.contextPath}/user/purchaselist.do">구매목록</a></li>
				<li><a href="${pageContext.request.contextPath}/user/likelist.do">좋아요한 상품</a></li>
				<li><a href="${pageContext.request.contextPath}/user/requestlist.do">1:1문의</a></li>
				<li><a href="${pageContext.request.contextPath}/user/memberCheck.do">회원정보수정</a></li>
			</ul>
			<span class="close"><i class="fas fa-times"></i></span>
		</div>
	</div>


	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/menu.js" type="text/javascript"></script>

</body>
</html>