<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/excite-bike/jquery-ui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
 		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    	<script type="application/javascript">
    	
    	 $(function() {
    		    $( "#ld" ).dialog({
    		      autoOpen: false,
    		      show: {
    		        effect: "blind",
    		        duration: 1000
    		      },
    		      hide: {
    		        effect: "blind",
    		        duration: 1000
    		      }
    		      modal: true,
    		    });
    		 	
    		    $( "#lBtn" ).click(function() {
    		      $( "#ld" ).dialog( "open" );
    		    });
    		  });
    	
    	 $(function() {
 		    $( "#jd" ).dialog({
 		      autoOpen: false,
 		     modal: true,
 		      show: {
 		        effect: "blind",
 		        duration: 1000
 		      },
 		      hide: {
 		        effect: "blind",
 		        duration: 1000
 		      }
 		    });
 		 
 		    $( "#jBtn" ).click(function() {
 		      $( "#jd" ).dialog( "open" );
 		    });
 		  });
    	 
	</script> 
	<body>
		<div id="ld" title="로그인">
		<hr/>
		<form:form commandName="login" action="login">
			E-mail &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<form:input path="id" size="15"/>
			<form:errors path="id"/><br/>
			Password &nbsp;
			<form:password path="password" size="15"/>
			<form:errors path="password"/><br/>
			<input type="submit" value="로그인"/>
		</form:form>
		</div>
		
 		<div id="jd" title="회원가입">
		<hr/>
		<form:form commandName="member" action="join">
			아이디:
			<form:input path="id" size="20"/>
			<form:errors path="id"/> <br/>
			비밀번호:
			<form:password path="password" size="20"/>
			<form:errors path="password"/> <br/>
			관심 주소1:
			<form:input path="address1" size="20"/>
			<form:errors path="address1"/> <br/>
			관심 주소2:
			<form:input path="address2" size="20"/>
			<form:errors path="address2"/> <br/>
			닉네임:
			<form:input path="nick" size="20"/>
			<form:errors path="nick"/> <br/>
			<input type="submit" value="회원가입"/>
		</form:form>
		</div>
	</body>
</html>