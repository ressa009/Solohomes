<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == 1 }">
	<script>
		alert("인증 성공! 환영 합니다");
		location.href = "../user/main.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script>
		alert("인증 실패!");
		location.href = "login.do";
	</script>
</c:if>