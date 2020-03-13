<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("수정실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("수정성공");
			location.href = "view.do?uid=${param.uid}"; <%-- 수정성공하면 view 로 이동해서 제대로 수정되었는지 확인--%>
		</script>	
	</c:otherwise>
</c:choose>

















