<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
		<hr>
		<h2>리스트</h2>
		<c:choose>
			<c:when test="${empty list || fn.length(list) == 0 }">
				데이터가 없습니다<br>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>uid</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.uid }</td>
							<td><a href="view.do?uid=${dto.uid }">${dto.subject }</a></td>
							<td>${dto.name }</td>
							<td>${dto.viewCnt }</td>
							<td>${dto.regDate }</td>
						</tr>
					</c:forEach>
				</table>				
			</c:otherwise>
		</c:choose>
		<br>
		<button onclick="location.href='write.do'">신규등록</button>
</body>
</html>







