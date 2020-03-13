<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == 1}">
	<script>
		alert("입력이 잘못 되었습니다. 다시 입력해 주세요!");
		history.back();
	</script>
</c:if>
<c:if test="${result == 0}">
	<script>
		alert("ID / PW가 성공적으로 이메일 발송 되었습니다.");
		location.href="login.do";
	</script>
</c:if>