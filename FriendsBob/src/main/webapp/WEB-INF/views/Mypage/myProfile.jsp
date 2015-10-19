<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			#tb{
				margin-top: 100px;
				margin-bottom: 50px;
			}
			#dd{
				text-align: center;
			}
			.buttonGroup {
				margin: 10px;
				text-align: center;
				display:inline-block;
			}
			
			.buttonGroup a {
				text-align: center;
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
			.buttonGroup a:hover {
				color: black;
				background-color: lightgray;
			}
		</style>
	</head>
	
	<body>
		<table id="tb" align="center" border="2">
			<tr>
				<td>항목</td>
				<td>나의 프로필</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.id}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${member.nick}</td>
			</tr>
			<tr>
				<td>주소 1</td>
				<td>${member.address1}</td>
			</tr>
			<tr>
				<td>주소 2</td>
				<td>${member.address2}</td>
			</tr>
			<tr>
				<td>포인트</td>
				<td>${member.point}</td>
			</tr>
			<tr>
				<td>등급</td>
				<td>${member.grade}</td>
			</tr>
		</table>
		<div id="dd">
		<div class="buttonGroup"><a href="update">프로필 수정</a></div>
		<div class="buttonGroup"><a href="delete">회원탈퇴</a></div>
		</div>
	</body>
</html>