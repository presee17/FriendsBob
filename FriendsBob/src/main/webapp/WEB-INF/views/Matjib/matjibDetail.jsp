<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h4>게시물 보기</h4>
		<div id="part1">
			<div id="part1_1">
				<span class="title">번호:</span>
				<span class="content">${matjib.no}</span>
				
				<span class="title">종류:</span>
				<span class="content">${matjib.food }</span>
				
				<span class="title">가게 이름:</span>
				<span class="content">${matjib.title }</span>
				
				<span class="title">글쓴이 : </span>
				<span class="content">${matjib.id}</span>
				
				<span class="title">글쓴 날짜:</span>
				<span class="content">${matjib.date}</span>
				
				<span class="title">조회수:</span>
				<span class="content">${matjib.hitCount }</span>
			</div>
				
			<div id="part2">
				<span class="title">내용:</span> <br/>
				<pre>${matjib.content}</pre>
			</div>
		
			<div id="buttonGroup">
				<a href="matjibList?pageNo=${pageNo}">목록</a>
				<a href="matjibUpdateForm?matjibNo=${matjib.no}">수정</a>
				<a href="matjibDelete/${matjib.no}">삭제</a>
			</div>
			
		</div>
	</body>
</html>