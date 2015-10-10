<%@ page contentType="text/html; charset=UTF-8"%>
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			body {
				font-family: "돋움";
				font-size: 12px;
				color: black;
			}
			span {
				display: inline-block;
				margin: 2px 10px;
			}
			
			span.title {
				margin: 2px 10px;
				border: 1px solid darkgray;
				background: lightgray;
				width: 70px;
				text-align: center;
				color: black;
			}
			
			pre {
				margin: 10px;
				border: 1px solid darkgray;
				padding: 10px;
				width: 90%;
				height: 100px;
				font-size: 12px;
			}
			
			#part1 {
				display: flex;
			}
			#part1_1 {
				flex: 1;
			}
			#part1_2 {
				width: 120;
				margin-right: 10px;
				text-align: center;
			}
			#part1_2 img {
				display: block;
				padding: 10px;
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
				color: white;
				border: 1px solid darkgray;
				background-color: gray;
				font-weight: bold;
			}
			
			#buttonGroup a:hover {
				color: black;
				background-color: lightgray;
			}
		</style>
	</head>
	
	<body>
		<h4>제휴사 보기</h4>
		<div id="part1">
			<div id="part1_1">	
				<span class="title">번호:</span> 
				<span class="content">${partner.no}</span> <br/>
				
				<span class="title">상호명:</span> 
				<span class="content">${partner.name}</span> <br/>
				
				<span class="title">위치:</span> 
				<span class="content">${partner.location}</span> <br/>
				
				<span class="title">전화번호:</span> 
				<span class="content">${partner.tel}</span> <br/>
				
				<span class="title">분류:</span> 
				<span class="content">${partner.kind}</span> <br/>
				
				<span class="title">첨부:</span> 
				<span class="content">${partner.originalFileName}</span> <br/>
			</div>
			
			<div id="part1_2">
				<img src="${pageContext.request.contextPath}/resources/uploadfiles/${partner.filesystemName}" width="100px" height="100px"/>
			</div>
		</div>
		
		<div id="part2">
			<span class="title">설명:</span> <br/>
			<pre>${partner.content}</pre>
		</div>
		
		<div id="buttonGroup">
			<a href="partnerList?&&pageNo=${pageNo}">목록</a>
			<a href="partnerUpdate?pno=${partner.no}">수정</a>
			<a href="partnerDelete/${partner.no}">삭제</a>
		</div>		
	</body>
</html>