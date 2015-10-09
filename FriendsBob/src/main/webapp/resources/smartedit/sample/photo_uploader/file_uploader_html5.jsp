<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.net.*"%>

<%
String originfileName = request.getHeader("file-name");
originfileName = URLDecoder.decode(originfileName, "UTF-8");
String savefileName = new Date().getTime() + originfileName;
String fileSize = request.getHeader("file-size");
String fileType = request.getHeader("file-Type");
ServletInputStream sis = request.getInputStream();

String urlPath = "/resources/images/" + savefileName;
String saveFilePath = application.getRealPath(urlPath);
System.out.println(saveFilePath);
FileOutputStream fos = new FileOutputStream(saveFilePath);

byte[] data = new byte[1024];
int byteNum = -1;
while(true) {
	byteNum = sis.read(data);
	if(byteNum == -1) break;
	fos.write(data, 0, byteNum);
}

fos.flush();
fos.close();
%>

&bNewLine:true
&sFileName:<%=originfileName%>
&sFileURL:${pageContext.request.contextPath}/resources/smartedit/sample/photo_download/photo_download.jsp?fileName=<%=savefileName%> 