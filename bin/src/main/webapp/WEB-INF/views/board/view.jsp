<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${empty read || fn:length(read) == 0 }">
		<script>
			alert("해당 글이 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>읽기 ${read[0].subject }</title>
</head>
<script>
function chkDelete(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.do?uid=' + id;
	}
	
}
</script>
<body>
<h2>읽기 ${read[0].subject }</h2>
<br>
uid : ${read[0].uid }<br>
작성자 : ${read[0].name }<br>
제목: ${read[0].subject }<br>
등록일: ${read[0].regDate }<br>
조회수: ${read[0].viewCnt }<br>
내용: <br>
<hr>
<div>
${read[0].content }
</div>
<hr>
<br>
<button onclick="location.href = 'update.do?uid=${read[0].uid }'">수정하기</button>
<button onclick="location.href = 'list.do'">목록보기</button>
<button onclick="chkDelete(${read[0].uid })">삭제하기</button>
<button onclick="location.href = 'write.do'">신규등록</button>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
	
	</c:otherwise>
</c:choose>







