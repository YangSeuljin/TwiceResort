<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
</head>
<body>
<h1>게시물이 삭제되었습니다.</h1>
<%
int id=Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");//문자열을 객체로 리턴
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.56.1:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root", "password");
	//db url,계정 정보를 식별자로 받아 연결을 시도
	Statement stmt = conn.createStatement();//쿼리를 생성/실행/반환한 결과를 가져올 작업영역
	stmt.execute("delete from gongji where id="+id+";");
	String QueryTxt;
	stmt.close();
	conn.close();
%>

<table width=650>	
	<tr>
	<td width=600></td>
	<td><input type=button value="목록" Onclick="location.href='gongji_list_H2.jsp'"></td>
	</tr>
	</table>

</body>
</html>