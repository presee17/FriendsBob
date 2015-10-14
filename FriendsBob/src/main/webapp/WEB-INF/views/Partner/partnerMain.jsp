<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			body{
				
			}
			#all{
				display: flex;
			}
			#food{
				width:300px;
				display: inline-block;
			}
			#list{
				flex:1;
			}
			#frame{
				height:96vh;
			}
			#full{
				width:250px;
				
			}
		</style>
	</head>
	<body>
		<div id="all">
			<div id="full"><br/>
				<div id="food">
					음식 분류<br/><br/>
					<form method="post">
						<a href="partnerList?kind=k" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/hansik.jpg"/></a><br/>
						<a href="partnerList?kind=w" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/jungsik.jpg"/></a><br/>
						<a href="partnerList?kind=j" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/ilsik.jpg"/></a><br/>
						<a href="partnerList?kind=c" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/yangsik.jpg"/></a><br/>
						<a href="partnerList?kind=b" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/bunsik.jpg"/></a><br/>
					</form>
				</div><br/><!-- <br/>
				<div>
					<select name="city">
						<option value="all">도시선택</option>
						<option value="서울">서울특별시</option>
						<option value="인천">인천광역시</option>
						<option value="대구">대구광역시</option>
						<option value="대전">대전광역시</option>
						<option value="광주">광주광역시</option>
						<option value="부산">부산광역시</option>
						<option value="울산">울산광역시</option>
						<option value="경기">경기도</option>
						<option value="강원">강원도</option>
						<option value="충남">충청남도</option>
						<option value="충북">충청북도</option>
						<option value="경남">경상남도</option>
						<option value="경북">경상북도</option>
						<option value="전남">전라남도</option>
						<option value="전북">전라북도</option>
					</select>
				</div> -->
			</div>
			<iframe id="frame" name="partnerList" width="100%" src="partnerList?kind=all">
			</iframe>
		</div>
	</body>
</html>