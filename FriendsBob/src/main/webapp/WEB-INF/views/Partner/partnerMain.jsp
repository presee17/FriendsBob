<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
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
					<input type="checkbox" name="kinds" value="한식"/>&nbsp;&nbsp;<a href="../Partner/partnerList" style="text-decoration:none;" target="partnerList">한식</a><br/>
					<input type="checkbox" name="kinds" value="양식"/>&nbsp;&nbsp;양식<br/>
					<input type="checkbox" name="kinds" value="일식"/>&nbsp;&nbsp;일식<br/>
					<input type="checkbox" name="kinds" value="중식"/>&nbsp;&nbsp;중식<br/>
					<input type="checkbox" name="kinds" value="분식"/>&nbsp;&nbsp;분식<br/><br/>
				</form>
			</div>
			<iframe name="partnerList" width="100%" height="100%">
			
			</iframe>
		</div>
	</body>
</html>