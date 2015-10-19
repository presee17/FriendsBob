<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
		
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/excite-bike/jquery-ui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
 		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    	<script type="application/javascript">
    	
	    	 $(function() {
	    		    $( "#drop" ).dialog({
	    		      autoOpen: false,
	    		      show: { 
	    		        effect: "blind",
	    		        duration: 300
	    		      },
	    		      modal: true,
	    		      hide: {
	    		        effect: "blind",
	    		        duration: 300
	    		      }
	    		    });
	    		 
	    		    $( "#dropBtn" ).click(function() {
	    		      $( "#ld" ).dialog( "open" );
	    		    });
	    		    
	    		    $( "#dropBtn" ).click(function() {
		    		      $( "#drop" ).dialog( "open" );
		    		    });

	    		  });
		</script>
		
	</head>
	
	<body>
	<div id="drop" title="회원탈퇴">
		<hr/>
		<form name="Form" id="Form" method="post" action="write">
			<table>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
			
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="check"></td>
				</tr>
			
				<tr>
					<td>탈퇴 사유</td>
					<td><input type="text" id="title" name="title"/></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="button" onclick="submitContents(this)" value="회원탈퇴"/>					
					</td>
				</tr>
			</table>
		</form>
		</div>
		
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
		<div class="buttonGroup" id = "dropBtn"><a href="#">회원탈퇴</a></div>
		</div>
	</body>
</html>