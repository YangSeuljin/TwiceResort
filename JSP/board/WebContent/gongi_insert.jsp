<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<h2>게시글이 등록되었습니다.</h2>
</head>

<body>
<% 
String content= new String(request.getParameter("content").getBytes("8859_1"),"UTF-8");
String title= new String(request.getParameter("title").getBytes("8859_1"),"UTF-8");

Class.forName("com.mysql.jdbc.Driver");//문자열을 객체로 리턴
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.56.1:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root", "password");
//db url,계정 정보를 식별자로 받아 연결을 시도
Statement stmt = conn.createStatement();//쿼리를 생성/실행/반환한 결과를 가져올 작업영역

int NewStdId=1;

ResultSet rset = stmt.executeQuery("select * from gongji where id = '1';"); 
//select * from examtable where studentid='209901'로 데이터를 조회해서 rset에 입력한다.
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String date = sdf.format(new java.util.Date());

if (rset.next()) { 
      //결과물 처리 
      rset = stmt.executeQuery("select min(id+1) from gongji where(id+1) not in (select id from gongji);");
      rset.next() ;
      NewStdId=rset.getInt(1) ;          
 } else {
    NewStdId = 1 ;
 }	
 stmt.execute("insert into gongji(title, id, content,date) values (" + "'"+title+"'" +","+NewStdId+","+"'"+content+"'"+","+"'"+date+"'"+");");
%>

<table width=650>	
	<tr>
	<td width=600></td>
	<td><input type=button value="목록" Onclick="location.href='gongji_list_H2.jsp'"></td>
	</tr>
	</table>
</body>
</html>
