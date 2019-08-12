<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option" %>

<!DOCTYPE html>
<html>
<title>로그인페이지</title>
<head>
<%

String userid=new String(request.getParameter("uname").getBytes("8859_1"),"UTF-8");
String password=new String(request.getParameter("psw").getBytes("8859_1"),"UTF-8");


if(userid != null && userid.equals(password)){
	session.setAttribute("userid",userid);
}
	response.sendRedirect("managerpage.jsp");
%>
</head>
<body>

</body>
</html>