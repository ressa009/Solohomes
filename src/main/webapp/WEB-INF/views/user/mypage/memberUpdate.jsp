<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
  <head>
    <title>회원정보수정</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
  </head>
  
  <script>
	function chkSubmit(){
		frm = document.forms["frm"];
		
		var mb_nn = frm["mb_nn"].value.trim();
		var mb_pw = frm["mb_pw"].value.trim();
		var mb_pwCheck = frm["mb_pwCheck"].value.trim();
		var mb_email = frm["mb_email"].value.trim();
		var mb_zipcode = frm["mb_zipcode"].value.trim();
		var mb_addr = frm["mb_addr"].value.trim();
		var mb_addr2 = frm["mb_addr2"].value.trim();
		var mb_phone = frm["mb_phone"].value.trim();
		
	    if (mb_nn == "") {
	        alert("닉네임을 입력해주세요");
	        frm["mb_nn"].focus();
	        return false;
	    }
	    
	    if (mb_pw == "") {
	        alert("비밀번호을 입력해주세요");
	        frm["mb_pw"].focus();
	        return false;
	    }
	    
	    if (mb_pwCheck == "") {
	        alert("비밀번호 확인을 입력해주세요");
	        frm["mb_pwCheck"].focus();
	        return false;
	    }
	    
	    if (mb_email == "") {
	        alert("이메일을 입력해주세요");
	        frm["mb_email"].focus();
	        return false;
	    }
	    
	    if (mb_zipcode == "") {
	        alert("우편번호를 입력해주세요");
	        frm["mb_zipcode"].focus();
	        return false;
	    }
	    
	    if (mb_addr == "") {
	        alert("주소를 입력해주세요");
	        frm["mb_addr"].focus();
	        return false;
	    }
	    
	    if (mb_addr2 == "") {
	        alert("상세 주소를 입력해주세요");
	        frm["mb_addr2"].focus();
	        return false;
	    }
	    
	    if (mb_phone == "") {
	        alert("연락처를 입력해주세요");
	        frm["mb_phone"].focus();
	        return false;
	    }
	    
	    if (mb_pw != pb_pwCheck) {
	        alert("비밀번호 확인이 일치하지 않습니다.");
	        frm["mb_pwCheck"].focus();
	        return false;
	    }
	    
	    // 비밀번호 정규표현식 체크
	    // 이메일 정규표현식 체크
	    // 연락처 정규표현식도 체크
	    
	    return true;
	} // end chkSubmit()
  </script>
  
  <body>
  
	<!-- 대문 -->
	<div class="hero-wrap hero-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<span class="quote"><i class="fas fa-quote-left"></i></span>
					<h1 class="mb-0 bread">회원 정보 수정</h1>				
					<span class="quote"><i class="fas fa-quote-right"></i></span>
				</div>
			</div>
		</div>
	</div>

	<!-- 폼 -->
	<section class="ftco-section contact-section bg-light">
			<div class="container">
				<div class="row block-9">
					<div class="formBox">
		
					<form name="frm" action="${pageContext.request.contextPath }/user/mypage/memberUpdateOk.do" method="post" onsubmit="return chkSubmit()"  class="bg-white p-5 contact-form form-group3">
						<input type="hidden" name="mb_uid" value="${dto.mb_uid }"/>
						
							<div class="frm_input_set">
							<label for="mb_nn" class="col-form-label" id="label_nn">닉네임</label>
							<input type="text" id="mb_nn" name="mb_nn" value="${dto.mb_nn }" class="form-control3"/>
							</div>
							
							<div class="frm_input_set">
							<label for="mb_pw2" class="col-form-label" id="label_pw2">비밀번호</label>
							<input type="password" name="mb_pw" id="mb_pw2" class="form-control3"/>
							</div>
							
							<div class="frm_input_set">
							<label for="mb_pwCheck" class="col-form-label" id="label_pwCheck">비밀번호 확인</label>
							<input type="password" name="mb_pwCheck" id="mb_pwCheck" class="form-control3"/>
							</div>
							
							<div class="frm_input_set">
							<label for="mb_email" class="col-form-label" id="label_email">이메일</label>
							<input type="text" name="mb_email" id="mb_email" value="${dto.mb_email }" class="form-control3"/>
							</div>
							
							<div class="frm_input_set">
							<label for="sample6_postcode" class="col-form-label" id="label_addr">주소</label><br>
							<input type="text" id="sample6_postcode" value="${dto.mb_zipcode }" name="mb_zipcode" placeholder="우편번호" readonly="readonly"/>
							<input type="button" class="addr-btn btn btn-primary"  id="updateInfoBtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
							<input class="addr form-control3" type="text" id="sample6_address" value="${dto.mb_addr }" name="mb_addr" placeholder="주소" readonly="readonly"/>
							<input class="addr form-control3" type="text" id="sample6_detailAddress" value="${dto.mb_addr2 }" name="mb_addr2" placeholder="상세주소" />
							<input class="addr form-control3" type="text" id="sample6_extraAddress" style="display: none;" placeholder="상세주소"/>
							</div>
							
							<div class="frm_input_set">
							<label for="mb_phone" class="col-form-label" id="label_phone">연락처</label>
							<input type="text" name="mb_phone" id="mb_phone" value="${dto.mb_phone }" class="form-control3"/><br>
							</div>
							
							<div class="frm_input_set">
							<input type="submit" class="btn btn-primary pwcheck-form" value="수정"/>
							</div>
							
					
					</form>
 				</div>
			</div>
		</div>
	</section>
	
	
	
	
	
	
 
 	<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress").focus();
						}
					}).open();
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
	<script src="${pageContext.request.contextPath}/js/user/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/js/user/main.js"></script>
  </body>
</html>
<jsp:include page="/common/footer" />