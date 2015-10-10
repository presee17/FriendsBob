<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
	</head>
	
	<body>
		<h4>제휴사 등록</h4>
		<form method="post" action="write" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td>상호명</td>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td>위치</td>
					<td><input type="text" name="location"/></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="tel"/></td>
				</tr>
				<tr>
					<td>분류</td>
					<td>
						<select>
						  <option value="한식">한식</option>
						  <option value="양식">양식</option>
						  <option value="일식">일식</option>
						  <option value="중식">중식</option>
						  <option value="분식">분식</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>설명</td>
					<td><textarea name="content" rows="5" cols="50"></textarea></td>
				</tr>
				<tr>
					<td>첨부</td>
					<td><input type="file" name="attach"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="submit" value="등록"/>
						<input type="reset" value="다시작성"/>					
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>