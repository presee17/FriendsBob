<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			body{
				overflow:hidden;
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
		</style>
	</head>
	<body>
		<div id="all">
			<div id="food"><br/>
				음식 분류<br/><br/>
				<form method="post">
					<a href="partnerList?kind=k" style="text-decoration:none;" target="partnerList">한식</a><br/>
					<a href="partnerList?kind=w" style="text-decoration:none;" target="partnerList">양식</a><br/>
					<a href="partnerList?kind=j" style="text-decoration:none;" target="partnerList">일식</a><br/>
					<a href="partnerList?kind=c" style="text-decoration:none;" target="partnerList">중식</a><br/>
					<a href="partnerList?kind=b" style="text-decoration:none;" target="partnerList">분식</a><br/>
				</form>
			</div>
			<iframe name="partnerList" width="100%" height="100%">
			
			</iframe>
		</div>
	</body>
</html>