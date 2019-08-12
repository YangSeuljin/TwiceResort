<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<html>
<head>

</head>
<body>
	<h2>게시글이 수정되었습니다.</h2>

	<%
		int id = Integer.parseInt(request.getParameter("id"));
		String content = new String(request.getParameter("content").getBytes("8859_1"), "UTF-8");
		String title = new String(request.getParameter("title").getBytes("8859_1"), "UTF-8");

		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		out.println("수정일자: " + date);

		Class.forName("com.mysql.jdbc.Driver");//문자열을 객체로 리턴
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://192.168.56.1:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root",
				"password");//db url,계정 정보를 식별자로 받아 연결을 시도
		Statement stmt = conn.createStatement();//쿼리를 생성/실행/반환한 결과를 가져올 작업영역

		stmt.execute("update gongji set title=" + "'" + title + "'" + "where id=" + id + ";");
		stmt.execute("update gongji set content=" + "'" + content + "'" + "where id=" + id + ";");
		stmt.execute("update gongji set date=" + "'" + date + "'" + "where id=" + id + ";");

		stmt.close();
		conn.close();
	%>
	</table>
	<table width=650>
		<tr>
			<td width=600></td>
			<td><input type=button value="목록"
				Onclick="location.href='gongji_list_H2.jsp'"></td>
		</tr>
	</table>
</body>
</html>