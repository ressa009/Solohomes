<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장바구니 확인용</title>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.userUID}">
		<script>
			alert("로그인이 되어있지 않습니다");
			location.href = "${pageContext.request.contextPath}/member/login.do";
		</script>
	</c:when>
	<c:otherwise>
		<form action="beforecart.do" method="POST">
			<input type="hidden" name="mb_uid" value="${sessionScope.userUID }"> <br />
			상품상세uid : <input type="text" name="in_uid" > <br />
			수량 : <input type="text" name="cr_amount" > <br />	
			<input type="submit" value="장바구니 담기" >
		</form>
			<input type="button" value="장바구니" onclick="location.href='cart.do?mb_uid=${sessionScope.userUID}'"> <br />
	</c:otherwise>
</c:choose>
</body>
</html>