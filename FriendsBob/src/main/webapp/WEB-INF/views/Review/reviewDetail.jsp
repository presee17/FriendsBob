<%@ page contentType="text/html; charset=UTF-8"%>
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
				color: black;
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
		<h4>게시물 보기</h4>
		<div id="part1">
			<div id="part1_1">	
				<span class="title">번호:</span> 
				<span class="content">${reivew.reviewNo}</span> <br/>
				
				<span class="title">제목:</span> 
				<span class="content">${review.reviewTitle}</span> <br/>
				
				<span class="title">글쓴이:</span> 
				<span class="content">${review.reviewWriter}</span> <br/>
				
				<span class="title">날짜:</span> 
				<span class="content">${review.reviewDate}</span> <br/>
			</div>

		</div>
		
		<div id="part2">
			<span class="title">내용:</span> <br/>
			${review.reviewContent}
		</div>
		<div id="part3">
			
		</div>
		<div id="buttonGroup">
			<input type="button" id="listButton" href="reviewList?pageNo=${pageNo}">목록</a>
			<input type="button" id="modyfiButton" href="reviewUpdate?rno=${review.reviewNo}">수정</a>
			<input type="button" id="deleteButton" href="delete/${review.reviewNo}">삭제</a>
		</div>		
	</body>
</html>

