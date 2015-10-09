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
				text-align:center;
				width:200px;
				margin: 10px; 0px;
				display:inline-block;
			}
			#join{
				width:250px;
				border:20px;
				padding:20px;
				text-align:center;
				display:inline-block;
			}
			#talk{
				margin-top:7px;
				flex:1;
				padding:18px;
			}
			#menu{
				margin:auto;
				text-align:center;
				width:700px;
			}
			.i{
				background-color:#FF0000;
				font-size:large;
				padding:10px;
				text-align:center;
				color:white;
				display:inline-block;
			}
			.line{
				font-size:large;
				padding:10px;
			}
			td{
				background-color: white;
			}
			td:hover{
				color: white;
				background-color: #FF7E7E;
			}
			table,tr,td{
				border:1px solid black;
				border-color: #FF2424;
			}
			#content{
				display:flex;
			}
			#content1{
				text-align:center;
				width:250px;
			}
			#content2{
				height:100%;
				flex:1;
				display: inline-block;	
			}
			#content3{
				width:330px;
			}
			#side1{
				height:150px;
			}
			#side2{
	
			}
		</style>
	</head>
	<body>
	<div id="top">
			<div id="logo">
				<img src="${pageContext.request.contextPath}/resources/imgaes/logo.jpg"/>
			</div>
			<div id="talk">
				<table id="menu">
					<tr>
						<td class="line">마이페이지</td>
						<td class="line">약속목록</td>
						<td class="line">맛집정보</td>
						<td class="line">후기</td>
						<td class="line"><a href="Partner/partnerMain" style="text-decoration:none;" target="partnerMain">제휴사</a></td>
					</tr>
				</table>
			</div>
			<div id="join">
				<button class="i">밥친구닷컴 나가기</button>
			</div>
		</div><hr>
		<div id="content">
			<iframe name="partnerMain" width="100%" height="100%">
			</iframe>
			<hr>
			<div id="content3">
				<div id="side1">센
				</div><hr>
				<div id="side2">
				</div>
			</div>
		</div>
	</body>
</html>