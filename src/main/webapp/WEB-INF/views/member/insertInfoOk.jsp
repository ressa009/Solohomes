<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == 0}">
	<script>
		alert("등록 실패!");
		history.back();
	</script>
</c:if>
<c:if test="${result == 1}">
	<script>
		<% session.setAttribute("userID", request.getParameter("id"));%>
		alert("등록 성공! 환영합니다! 이메일 인증을 해주세요!");
		location.href = "signSend.do";
	</script>
</c:if>