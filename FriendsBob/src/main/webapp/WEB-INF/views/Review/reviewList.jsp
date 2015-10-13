<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			body {
				color: black;
			}
			table {
				width: 100%;
				border-collapse: collapse;
				font-size: small;
			}
			table, th, td {
				border: 1px solid white;
				text-align: center;
			}
			th {
				background-color: orange;
				color: black;
			}
			
			#buttonGroup {
				margin: 10px;
				text-align: center;
			}
			
			#buttonGroup a {
				display:inline-block;
				width: 70px;
				line-height: 30px;
				text-decoration: none;
				font-size: small;
				color: black;
				border: 1px solid darkgray;
				background-color: gray;
				font-weight: bold;
			}
			
			#buttonGroup a:hover {
				color: black;
				background-color: lightgray;
			}
			
			#pager {
				margin-top: 5px;
				text-align: center;
				font-size: small;
			}
			
			#pager a {
				text-decoration: none;
				color: black;
			}
			
			#pager a:hover {
				color: orange;
			}
			
			#pager a.pageNo {
				margin-left: 5px;
				margin-right: 5px;
			}
			
			#pager a.pageNo.selected {
				color: aqua;
			}
			
			.title {
				text-decoration: none;
				color: black;
			}	
			.title:hover {
				color: orange;
			}
		</style>
	</head>
	
	<body>
		<table>
			<tr>
				<th style="width:50px">번호</th>
				<th>제목</th>
				<th style="width:60px">글쓴이</th>
				<th style="width:80px">날짜</th>
			</tr>
			
			<c:forEach var="review" items="${list}">
				<tr>
					<td>${review.reviewNo}</td>
					<td><a class="title" href="reviewDetail?reviewNo=${review.reviewNo}">${review.reviewTitle}</a></td>
					<td>${review.reviewWriter}</td>
					<td>${review.reviewDate}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div id="pager">
			<a href="revieList?pageNo=1">[처음]</a>
			
			<c:if test="${groupNo>1}">
				<a href="reviewList?pageNo=${startPageNo-pagesPerGroup}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
				<a class="pageNo <c:if test="${pageNo==i}">selected</c:if>" 
				   href="reviewList?pageNo=${i}">${i}</a>
			</c:forEach>
			
			<c:if test="${groupNo<totalGroupNo}">
				<a href="reviewList?pageNo=${endPageNo+1}">[다음]</a>
			</c:if>		
	
			<a href="reviewList?pageNo=${totalPageNo}">[맨끝]</a>
		</div>		
		
		<div id="buttonGroup">
			<a href="write">글쓰기</a>
		</div>
	</body>
</html>








