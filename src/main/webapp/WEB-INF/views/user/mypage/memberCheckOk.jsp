<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${empty result || result == 0 }">
	<script>
		alert("비밀번호 불일치");
		history.back();
	</script>
	</c:when>
	<c:otherwise>
	<script>
		location.href = "memberUpdate.do/${mb_uid}"; 
	</script>
	</c:otherwise>
</c:choose>
