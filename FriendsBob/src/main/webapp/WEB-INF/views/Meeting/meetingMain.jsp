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
					음식 분류<br/><br/>
					
					<form action="meetingDetail" method="get">
	  					<input type="checkbox" name="foodkind" value="korea" checked="checked">한식<br>
	  					<input type="checkbox" name="foodkind" value="american" >양식<br>
	  					<input type="checkbox" name="foodkind" value="japan">일식<br>
	  					<input type="checkbox" name="foodkind" value="china">중식<br>
	  					<input type="checkbox" name="foodkind" value="fast">분식<br>
  					<br/>
  					<br/>
  					지역선택 
	  					<select>
						  <optgroup label="경기도">
						    <option value="soul">서울 특별시</option>
						    <option value="incheon">인천 광역시</option>
						  </optgroup>
						  
						  <optgroup label="강원도">
						  </optgroup>
						  
						  <optgroup label="충천도">
						  </optgroup>
						    
						  <optgroup label="전라도">
						    <option value="kwangju">광주 광역시</option>
						    <option value="daejeon">대전 광역시</option>
						  </optgroup>
						  
						  <optgroup label="경상도">
						    <option value="busan">부산 광역시</option>
						    <option value="daegu">대구 광역시</option>
						    <option value="ulsan">울산 광역시</option>
						  </optgroup>
						</select>
						
						<br/>
						<br/>
						  검색 <input type="text" name="search" value="검색어를 입력하세요"><br/><br/>
  					<input type="submit" value="검색">
					</form>
					
					
				</div><br/><br/>
			</div>
			<iframe id="frame" name="meetingList" width="100%" src="meetingList?kind=all">
			</iframe>
		</div>
	</body>
</html>