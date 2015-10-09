<%@ page contentType="text/html; charset=UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String postMessage = request.getParameter("ir1"); 
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Smart Editor&#8482; WYSIWYG Mode</title>
		<link href="css/smart_editor2_in.css" rel="stylesheet" type="text/css">
	</head>
	<body class="smartOutput se2_inputarea">
		<p>
			<b><u>에디터 내용:</u></b>
		</p>
	
		<div style="width:736px;">
			<%=postMessage%>
		</div>
	</body>
</html>