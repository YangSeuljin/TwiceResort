<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="java.util.ArrayList"%>

<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
	
</SCRIPT>
</head>
<body>
	<%
		try {
			int id = Integer.parseInt(request.getParameter("id"));
	%>

	<%
		ArrayList<Integer> numberlist = new ArrayList();
			ArrayList<String> titlelist = new ArrayList();
			ArrayList<String> datelist = new ArrayList();

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://192.168.56.1:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false",
					"root", "password");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("SELECT * FROM gongji where id = " + id + ";");

			if (rset.next()) {
				numberlist.add(rset.getInt(1));
				titlelist.add(rset.getString(2));
				datelist.add(rset.getString(3));
	%>
	<FORM METHOD=POST name='fm'>
		<table width=650 border=1 cellspacing=0 cellpadding=5>
			<tr>
				<td><b>번호</b></td>
				<td><%=rset.getInt(1)%></td>
			</tr>
			<tr>
				<td><b>제목</b></td>
				<td><%=rset.getString(2)%></td>
			</tr>
			<tr>
				<td><b>일자</b></td>
				<td><%=rset.getString(3)%></td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td><%=rset.getString(4)%></td>
			</tr>
		</table>
		<table width=650>
			<tr>
				<td width=600></td>
				<td><input type=button value="목록"
					Onclick="location.href='gongji_list_H2.jsp'"></td>
				<td><input type=button value="수정"
					Onclick="location.href='gongji_update_H.jsp?id=<%=rset.getInt(1)%>'"></td>
			</tr>
		</table>
	</FORM>
	<%}
	} catch(Exception e){out.println(e);} %>
</body>
</html>
