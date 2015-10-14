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
			#kind{
				display:inline-block;
			}
		</style>
	</head>
	<body>
		<div id="all">
			<div id="full"><br/>
				<div id="food">
					<h3 id="kind">음식 분류</h3><img src="${pageContext.request.contextPath}/resources/images/sik.png"/><br/><br/>
					<form method="post">
						<a href="partnerList?kind=k" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/hansik.jpg"/></a><br/>
						<a href="partnerList?kind=w" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/jungsik.jpg"/></a><br/>
						<a href="partnerList?kind=j" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/ilsik.jpg"/></a><br/>
						<a href="partnerList?kind=c" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/yangsik.jpg"/></a><br/>
						<a href="partnerList?kind=b" style="text-decoration:none;" target="partnerList"><img src="${pageContext.request.contextPath}/resources/images/bunsik.jpg"/></a><br/>
					</form>
				</div><br/>
			</div>
			<iframe id="frame" name="partnerList" width="100%" src="partnerList?kind=all">
			</iframe>
		</div>
	</body>
</html>