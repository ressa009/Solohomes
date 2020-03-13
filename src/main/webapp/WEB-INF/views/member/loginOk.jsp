<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:choose>
	<c:when test="${result == 1}">
		<script>
			alert("로그인 성공!");
<% 
	if(session.getAttribute("urlCopy") != null) {
%>
			location.href="${urlCopy}";
			session.removeAttribute("urlCopy");
<%
	}else{
%>
			location.href = "../user/main.do"
<%
	}
%>
		</script>
	</c:when>
	
	<c:when test="${result == 3}">
		<script>
			alert("비밀번호가 다릅니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${result == 5}">
		<script>
			alert("아이디가 없습니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${result == 2}">
		<script>
			alert("이메일 인증되지 않았습니다.");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("로그인 실패");
			history.back();
		</script>
	</c:otherwise>

</c:choose>
    