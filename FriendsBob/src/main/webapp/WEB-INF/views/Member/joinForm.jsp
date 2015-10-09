<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			body {
				font-size: small;
				color:white;
			}
		</style>
		
		<script language='JavaScript'> 
		window.resizeTo(500, 700);
		window.moveTo(0, 0);
		</script>
	</head>
	
	<body>
		<h4>회원가입</h4>
		<hr/>
		<form:form commandName="Join">
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
	</body>
</html>