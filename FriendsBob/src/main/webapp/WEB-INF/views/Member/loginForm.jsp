<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
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
			id:
			<form:input path="id" size="20"/>
			<form:errors path="id"/><br/>
			password:
			<form:password path="password" size="20"/>
			<form:errors path="password"/><br/>
			<input type="submit" value="로그인"/>
		</form:form>	
        </form>
	</body>
</html>

