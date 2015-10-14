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
					음식 분류<br/>
					
					<form action="meetingList" target ="meetingList" method ="POST">
	  					<input type="checkbox" name="foodKind[]" value="korea" checked="checked"><img id="main" src="${pageContext.request.contextPath}/resources/images/bunsik.jpg"/><br>
	  					<input type="checkbox" name="foodKind[]" value="american"><img id="main" src="${pageContext.request.contextPath}/resources/images/bunsik.jpg"/><br>
	  					<input type="checkbox" name="foodKind[]" value="japan"><img id="main" src="${pageContext.request.contextPath}/resources/images/bunsik.jpg"/><br>
	  					<input type="checkbox" name="foodKind[]" value="china"><img id="main" src="${pageContext.request.contextPath}/resources/images/bunsik.jpg"/><br>
	  					<input type="checkbox" name="foodKind[]" value="fast"><img id="main" src="${pageContext.request.contextPath}/resources/images/bunsik.jpg"/><br>
  					<br/>
  					<br/>
  					지역선택
  					<br/>
  						<select>
		  						<option name = "address1" value="myAddress">${member.address1}</option>
							    <option name = "address1" value="kangnam">강남구</option>
							    <option name = "address1" value="seocho">서초구</option>
							    <option name = "address1" value="seoul">강서구</option>
							    <option name = "address1" value="kangbuk">강북구</option>
						</select>
  					
	  					<select>
		  						<option name = "address2" value="myAddress">${member.address2}</option>
							    <option name = "address2" value="jamwon">잠원동</option>
							    <option name = "address2" value="majan">마장동</option>
							    <option name = "address2" value="karak">가락동</option>
							    <option name = "address2" value="songjeon">송정동</option>
						</select>
						
						<br/>
						<br/>
						  검색<br/>
						 <input type="text" name="search" value="검색어를 입력하세요"><br/><br/>
  					<input type="submit" value="검색">
					</form>
					
					
				</div><br/><br/>
			</div>
			<iframe id="frame" name="meetingList" width="100%" src="meetingList">
			
			</iframe>
		</div>
	</body>
</html>