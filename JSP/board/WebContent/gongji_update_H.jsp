<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<html>
<head>

<%
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		int id2;
		String title;
		String content;
		String date;
%>

<%
	Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://192.168.56.1:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false",
				"root", "password");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("SELECT * FROM gongji where id = " + id + ";");

		if (rset.next()) {
			id2 = rset.getInt(1);
			title = rset.getString(2);
			date = rset.getString(3);
			content = rset.getString(4);
%>
</head>
<body>
	<FORM METHOD=POST name='fm' onsubmit="return f();">
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td><input type=text name=id size=70 maxlength=70
					value=<%=id2%> readonly></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><input type=text name=title size=70 maxlength=70
					value="<%=title%>"></td>
			</tr>
			<td><b>일자</b></td>
			</td>
			<td><%=date%></td>
			<tr>
				<td><b>내용</b></td>
				<td><textarea style='width: 500px; height: 250px;' name=content
						cols=70 row=600><%=content%></textarea></td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600></td>
				<td><input type=button value="취소"
					OnClick="location.href='gongji_list_H2.jsp'"></td>
				<td><input type=submit formaction="gongji_update.jsp"
					value="쓰기" onclick="return f()"></td>
				<td><input type=submit value="삭제"
					formaction="gongji_delete.jsp"
					onclick="return confirm('게시글을 삭제하시겠습니까?')"></td>
			</tr>
		</table>
	</FORM>
	<%}
	} catch(Exception e){out.println(e);} %>
</body>
</html>