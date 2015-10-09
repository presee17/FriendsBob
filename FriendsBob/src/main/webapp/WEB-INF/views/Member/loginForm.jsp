<%@ page contentType="text/html; charset=UTF-8"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script language='JavaScript'> 
		window.resizeTo(500, 700);
		window.moveTo(0, 0);
		</script>
	</head>
	
	<body>
		<form>
		<h4>로그인</h4>
		<hr/>
		<form:form commandName="login">
			memberId:
			<form:input path="memberId" size="20"/>
			<form:errors path="memberId"/><br/>
			memberPassword:
			<form:password path="memberPassword" size="20"/>
			<form:errors path="memberPassword"/><br/>
			<input type="submit" value="로그인"/>
		</form:form>	
        </form>
	</body>
</html>

