<%@ page contentType="image/png" trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*, java.net.*"%>
         
<%
String fileName = request.getParameter("fileName");
fileName = URLDecoder.decode(fileName, "UTF-8");
String realPath = application.getRealPath("/resources/image/" + fileName);
FileInputStream fis = new FileInputStream(realPath);

out.clear();
ServletOutputStream soo = response.getOutputStream();

byte[] data = new byte[1024];
int byteNum = -1;
while((byteNum=fis.read(data)) != -1) {
	soo.write(data, 0, byteNum);
}

fis.close();
soo.flush();
soo.close();
%>
