<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	if (${result} != null && ${result} > 0) {
		if (${update} == 1) {
			alert("상품이 수정되었습니다.");
		} else {
			alert("상품이 등록되었습니다.");	
		}
		location.href="${pageContext.request.contextPath}/manager/goods.do";
	} else {
		if (${update} == 1) {
			alert("상품이 수정이 실패했습니다.");
		} else {
			alert("상품이 등록이 실패했습니다.");	
		}
		history.back();
	}
</script>
