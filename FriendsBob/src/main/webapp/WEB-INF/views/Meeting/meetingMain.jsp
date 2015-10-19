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
	  					<input type="checkbox" name="foodKind" value="hansik" checked="checked"><img id="main" src="${pageContext.request.contextPath}/resources/images/hansik.jpg"/><br>
	  					<input type="checkbox" name="foodKind" value="jungsik"><img id="main" src="${pageContext.request.contextPath}/resources/images/jungsik.jpg"/><br>
	  					<input type="checkbox" name="foodKind" value="ilsik"><img id="main" src="${pageContext.request.contextPath}/resources/images/ilsik.jpg"/><br>
	  					<input type="checkbox" name="foodKind" value="yangsik"><img id="main" src="${pageContext.request.contextPath}/resources/images/yangsik.jpg"/><br>
	  					<input type="checkbox" name="foodKind" value="bunsik"><img id="main" src="${pageContext.request.contextPath}/resources/images/bunsik.jpg"/><br>
  					<br/>
  					<br/>
  					지역선택
  					<br/>
  						<select name = "address1">
		  						<option value="myAddress">${member.address1}</option>
							    <option value="kangnam">강남구</option>
							    <option value="seocho">서초구</option>
							    <option value="seoul">강서구</option>
							    <option value="kangbuk">강북구</option>
						</select>
  					
	  					<select name = "address2">
		  						<option value="myAddress">${member.address2}</option>
							    <option value="jamwon">잠원동</option>
							    <option value="majan">마장동</option>
							    <option value="karak">가락동</option>
							    <option value="songjeon">송정동</option>
						</select>
						
						<br/>
						<br/>
						  검색<br/>
					<input type="text" name="search"><br/><br/>
  					<input type="submit" value="검색">
					</form>
					
				</div><br/><br/>
			</div>
			<iframe id="frame" name="meetingList" width="100%" src="meetingList">
			
			</iframe>
		</div>
	</body>
</html>