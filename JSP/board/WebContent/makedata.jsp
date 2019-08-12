<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
</head>
<body>
<%try{ %>
<h1>Make table</h1>

<%


	Class.forName("com.mysql.jdbc.Driver");//문자열을 객체로 리턴
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.56.1:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root", "password");
	//db url,계정 정보를 식별자로 받아 연결을 시도
	Statement stmt = conn.createStatement();//쿼리를 생성/실행/반환한 결과를 가져올 작업영역
	
    
    stmt.executeQuery("drop table gongji"); 
    out.println("drop table gongji OK<br>");
    
    stmt.executeQuery("create table gongji(id int no null primary key auto_increment,title varchar(70), date date, content text)DEFAULT CHARSET=utf8");
    String sql="";
    sql="insert into gongji(title, date,content) values('공지사항1',date(now()),'공지사항내용1')"; stmt.execute(sql);
    sql="insert into gongji(title, date,content) values('공지사항2',date(now()),'공지사항내용2')"; stmt.execute(sql);
    sql="insert into gongji(title, date,content) values('공지사항3',date(now()),'공지사항내용3')"; stmt.execute(sql);
    sql="insert into gongji(title, date,content) values('공지사항4',date(now()),'공지사항내용4')"; stmt.execute(sql);
    sql="insert into gongji(title, date,content) values('공지사항5',date(now()),'공지사항내용5')"; stmt.execute(sql);
	
	
	stmt.close();
	conn.close();
	
}catch (Exception e){
	out.println(e);
}
%>

</body>
</html>