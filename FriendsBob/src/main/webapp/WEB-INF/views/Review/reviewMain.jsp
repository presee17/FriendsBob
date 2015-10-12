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
		</style>
	</head>
	<body>
		<div id="all">
			<div id="food"><br/>
			</div>
			<iframe id="frame" name="reviewList" width="100%" src="reviewList">
			
			</iframe>
		</div>
	</body>
</html>