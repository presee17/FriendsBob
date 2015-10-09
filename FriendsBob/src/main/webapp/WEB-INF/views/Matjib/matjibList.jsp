<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h4>맛집 게시물 목록</h4>
			<table>
				<tr>
						<th style="width:50px"> 게시물 번호 </th>
						<th style="width:50px"> 종류 </th>
						<th style="width:50px"> 맛집 이름 </th>
						<th style="width:40px"> 글쓴이 </th>
						<th style="width:40px"> 날짜 </th>
						<th style="width:40px"> 조회수 </th>
				</tr>
			
				<c:forEach var="matjib" items="${list}">
					<tr>
						<td>${matjib.no}</td>
						<td>${matjib.food}</td>
						<td><a class="name" href=matjibDetail?matjibNo=${matjib.no}">${matjib.name}</a></td>
						<td>${matjib.id}</td>
						<td>${matjib.date}</td>
						<td>${matjib.hitCount}</td>
					</tr>
				</c:forEach>
			</table>
			
			<div id="pager">
				<a href= "list?pageNo=1">[처음]</a>
				
				<c:if test="${groupNo>1}">
					<a href="list&pageNo=${startPageNo-pagesPerGroup}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
					<a class="pageNo <c:if test="${pageNo==i}">selected</c:if>"
						href="lsit&pageNo=${i}">${i}</a>
				</c:forEach>
				
				<c:if test="${groupNo<totalGroup }">
					<a href="list?pageNo=${endPageNo+1}">[다음]</a>
				</c:if>
				
				<a href="lsit?pageNo=${totalPageNo}">[맨끝]</a>
			</div>
			
			<div id="buttonGroup">
				<a href="write">글쓰기</a>
			</div>
	</body>
</html>