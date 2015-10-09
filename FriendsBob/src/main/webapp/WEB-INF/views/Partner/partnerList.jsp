<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			*{
				
			}
		</style>
	</head>
	<body>
		<h4>제휴사 목록</h4>
		<table>
			<tr style="height:40px">
				<th style="width:20px">제휴사번호</th>
				<th style="width:40px">가게 이름</th>
				<th>가게 위치</th>
				<th style="width:20px">음식분류</th>
			</tr>
		
			<c:forEach var="partner" items="${list}">
				<tr>
					<td>${partner.no}</td>
					<td><a class="name" href="detail?PartnerNo=${partner.no}">${partner.name}</a></td>
					<td>${partner.location}</td>
					<td>${partner.kind}</td>
				</tr>
			</c:forEach>
		</table>
		<div id="btns">
			<div class="btn onclick="></div>
		</div>
	</body>
</html>