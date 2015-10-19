<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			.btn{
				width:130px;
				height:50px;
				margin-bottom: 5px;
			}
			#frame{
				height:96vh;
			}
			#all{
				display: flex;
			}
			#full{
				display: inline-block;
				width:250px;
			}
		</style>
	</head>
	
	<body>
		<div id="all">
			<div id="full"><br/>
				<div id="food">
					<a href="myProfile" style="text-decoration:none;" target="myPage"><button class="btn">프로필 보기</button></a><br/>
					<a href="myProfile" style="text-decoration:none;" target="myPage"><button class="btn">약속리스트 보기</button></a><br/>
					<a href="myProfile" style="text-decoration:none;" target="myPage"><button class="btn">관리자 페이지</button></a><br/>
				</div><br/>
			</div>
			<iframe id="frame" name="myPage" width="100%" src="myProfile">
			</iframe>
		</div>
	</body>
</html>