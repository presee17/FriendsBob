<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			*{
				margin:0px;
				padding:0px;
			}
			#top{
				min-width:940px;
				display:flex;
			}
			#logo{
				flex:1;
				margin: 10px; 0px;
				display:inline-block;
			}
			#join{
				border:20px;
				padding:20px;
				display:inline-block;
			}
			#talk{
				flex:3;
			}
			.i{
				font-size:large;
				padding:10px;
				text-align:center;
				display:inline-block;
			}
			.middle{
				width:750px;
				text-align: left;
				
			}
			#main{
				width:100%;
				height:500px;
			}
			#comment1{
				height:40px;
				width:450px;
				position:absolute;
				top:200px;
				left:450px;
				color: white;
				font-weight:bolder;
				background-color:rgba(0,0,0,0);
				padding:5px;
				font-size: x-large;
			}
			#comment2{
				height:40px;
				width:600px;
				text-align:center;
				position:absolute;
				top:400px;
				left:380px;
				background-color:white;
				padding:5px;
				background-color:rgba(0,0,0,0);
				color: white;
				font-size: xx-large;
			}
			#btn{
				height:40px;
				width:150px;
				position:absolute;
				top:300px;
				left:600px;
				font-weight:bolder;
				font-size: large;
				background-color: orange;
				color: white;
			}
		</style>
	</head>
	<body>
		<div id="top">
			<div id="logo">
				<img src="${pageContext.request.contextPath}/resources/images/logo.jpg"/>
			</div>
			<div id="talk" style="padding:18px;">
				<div class="middle">혼자 밥먹지 마세요.</div>
				<div class="middle">함께 먹어요...♥</div>
			</div>
			<div id="join">
				<form action="member/login" method="get"><button class="i">밥친구닷컴 들어가기</button></form>
				<form action="member/join" method="get"><button class="i">회원가입</button></form>
			</div>
		</div><hr>
		<div id="main">
			<img id="main" src="${pageContext.request.contextPath}/resources/images/main.jpg"/>
			<div id="comment1">밥 친구, 쉽고 편리하게 찾을 수 있습니다.</div>
			<button id="btn">밥친구 찾기⊙⊙</button>
			<a href="review/reiv">밥친구 찾기⊙⊙</button>
			<div id="comment2">현재 [ ] 명의 친구가 기다리고 있습니다.</div>
		</div>
	</body>
</html>