<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
			<table>
				<c:forEach var="reviewComment" items="${commentlist}">
					<tr>
						<td style="width:50px">${reviewComment.memberId}</td>
						<td> ${reviewComment.rCommentContent}</td>
						<td style="width:80px">${reviewComment.rCommentDate}</td>
						<c:if test="${reviewComment.memberId==loginNick }">
							<td style="width:50px"><a href="commentDelete?reviewCommentNo=${reviewComment.rCommentNo}">삭제</a></td>
						</c:if>	
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="repply">
			<form name="repplyForm" id = "repplyForm" method="post" action="commentWrite" >
				<textarea name="rCommentContent" rows="5" cols="20">댓글작성</textarea>
				<input type="submit" value="등록">
				<input type="reset" value="다시작성">
				<input type="hidden" name="reviewNo" value="${review.reviewNo }"/>
			</form>
			
		</div>
		<div id="buttonGroup">
			<a href="reviewList?pageNo=${pageNo}">목록</a>
			
			<c:if test="${review.reviewWriter==loginNick }">
				<a href="reviewUpdate?reviewNo=${review.reviewNo}">수정</a>
				<a href="delete/${review.reviewNo}">삭제</a>
			</c:if>
		</div>		
	</body>
</html>

