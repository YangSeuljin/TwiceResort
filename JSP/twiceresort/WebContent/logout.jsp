<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


<%

String userid = (String)session.getAttribute("userid");
if(userid!=null){
	session.invalidate();
	out.println("<script>");
	out.println("var con_test = confirm(\"어떤 값이 나올까요. 확인을 눌러보세요.\")");
	out.println("document.write(con_test);");
	out.println("</script>");
	response.sendRedirect("newindex.jsp");
}
else{
	out.println("<script type=\"text/javascript\">");
	out.println("alert('로그인 상태가 아닙니다.')");
	out.println("</script>");
	out.println("<button><a href='newindex.jsp'>홈으로 돌아가기</button>");
}

%>
</head>
<body>

</body>
</html>