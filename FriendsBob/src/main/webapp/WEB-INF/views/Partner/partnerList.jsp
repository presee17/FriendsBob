<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			body{
				
			}
			*{
				
			}
			#buttonGroup {
				text-align: right;
				margin-right: 20px;
			}
			
			#buttonGroup a {
				display:inline-block;
				width: 70px;
				line-height: 30px;
				text-decoration: none;
				font-size: small;
				color: white;
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
				color: red;
			}
			.data{
				text-align: center;
			}
			.name{
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<h4>제휴사 목록</h4>
		<table align=center border="1">
			<tr style="height:40px">
				<th style="width:120px">제휴사번호</th>
				<th style="width:200px">이름</th>
				<th style="width:350px">위치</th>
				<th style="width:100px">음식분류</th>
			</tr>
		
			<c:forEach var="partner" items="${list}">
				<tr>
					<td class="data">${partner.no}</td>
					<td class="data"><a class="name" href="partnerDetail?partnerNo=${partner.no}">${partner.name}</a></td>
					<td class="data">${partner.location}</td>
					<td class="data">${partner.kind}</td>
				</tr>
			</c:forEach>
		</table><br/>
		<div id="pager">
			<a href="partnerList?pageNo=1">[처음]</a>
			
			<c:if test="${groupNo>1}">
				<a href="partnerList?pageNo=${startPageNo-pagesPerGroup}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
				<a class="pageNo <c:if test="${pageNo==i}">selected</c:if>" 
				   href="partnerList?pageNo=${i}">${i}</a>
			</c:forEach>
			
			<c:if test="${groupNo<totalGroupNo}">
				<a href="partnerList?pageNo=${endPageNo+1}">[다음]</a>
			</c:if>		
	
			<a href="partnerList?pageNo=${totalPageNo}">[맨끝]</a>
		</div>		
		<c:if test="${kind=='all'}">
			<div id="buttonGroup">
				<a href="write">제휴사 등록</a>
			</div>
		</c:if>
	</body>
</html>