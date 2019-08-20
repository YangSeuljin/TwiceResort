<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option,dao.MembershipDao,dto.MembershipDto" %>

<!DOCTYPE html>
<html>
<title>로그인페이지</title>
<head>
<%



String userid=new String(request.getParameter("userid").getBytes("8859_1"),"UTF-8");
String inputPassword=new String(request.getParameter("password").getBytes("8859_1"),"UTF-8");

MembershipDao dao = MembershipDao.sharedInstance();
String id = dao.selectid(userid);
String userPassword=dao.selectpassword(id);
out.println(id);
out.password(userPassword);

//if(userid != null && userid.equals(password)){
//	session.setAttribute("userid",userid);
//}
//	response.sendRedirect("d_04.jsp");
%>
</head>
<body>

</body>
</html>