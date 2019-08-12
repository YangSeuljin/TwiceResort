<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.PageMaker"%>

<html>
<head>
</head>
<%try{
	Class.forName("com.mysql.jdbc.Driver");//문자열을 객체로 리턴
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.56.1:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root", "password");
	//db url,계정 정보를 식별자로 받아 연결을 시도
	Statement stmt = conn.createStatement();
	//쿼리를 생성/실행/반환한 결과를 가져올 작업영역
	
	//String studentid = request.getParameter("studentID");
	int number;
	String title;
	String date;
	String QueryTxt;
	
	PageMaker pagemaker = new PageMaker();
	String pagenum = request.getParameter("pagenum");
	String contentnum = request.getParameter("contentnum");
	int cpagenum = Integer.parseInt(pagenum);
	int ccontentnum = Integer.parseInt(contentnum);
	
	pagemaker.setTotalcount();//전체 게시글 개수를 지정한다.
	pagemaker.setPagenum(cpagenum-1); //현재 페이지를 패이지 객체에 지정한다. 
	pagemaker.setContentnum(ccontentnum); //한 페이지에 몇 개씩 게시그릉ㄹ 보여줄지 지정한다.
	pagemaker.setLastblock(pagemaker.getTotalcount()); //마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
	
	pagemaker.prevnext(cpagenum); //현재 페이지 번호로 화살표를 나타낼지 정한다.
	pagemaker.setStartpage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록 번호로 정한다.
	pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
	
	
	ArrayList<Integer> numberlist=new ArrayList();
	ArrayList<String> titlelist=new ArrayList();
	ArrayList<String> datelist=new ArrayList();
	QueryTxt = String.format("SELECT * FROM gongji ORDER BY id DESC LIMIT 0,10;");
	ResultSet rset = stmt.executeQuery(QueryTxt);
	while(rset.next()){
	numberlist.add(rset.getInt(1));
	titlelist.add(rset.getString(2));
	datelist.add(rset.getString(3));
	}
	//out.println(titlelist.get(0));
	//out.println(titlelist.get(1));
%>
<body>
<select name="contentnum" id="contentnum">
<table cellspacing=1 width=600 border=1>
<tr>
	<td width=50><p align=center>번호</p></td>
	<td width=50><p align=center>제목</p></td>
	<td width=50><p align=center>등록일</p></td>
	</tr>
	<% 
	//out.println(numberlist.size());
	//out.println(numberlist.get(0));
	//out.println(titlelist.get(0));
	//out.println(datelist.get(0));
	//out.println(numberlist.get(1));
	//out.println(titlelist.get(1));
	//out.println(datelist.get(1));
	//if(numberlist.size()!=0)
		for(int i=numberlist.size()-1; i>-1;i--){
		out.println("<tr>");
		out.println("<td width=50><p align=center>"+numberlist.get(i)+"</p></td>");
		out.println("<td width=70><p align=center>"+"<a href = 'http://localhost:8090/board/gongji_view_H.jsp?id="+numberlist.get(i)+"'>"+titlelist.get(i)+"</a>"+"</p></td>");
		out.println("<td width=40><p align=center>"+datelist.get(i)+"</p></td>");
		out.println("</tr>");
		}
	%>
	<table width=650>
	<tr>
		<td width=550></td>
		<td><input type=button value="신규" OnClick="window.location='gongji_insert_H.jsp'"></td>
	</tr>
	
	<tfoot>
	<tr>
	<td colspan="2">
	
	</tfoot>
	</table>
	<%
}
	catch(Exception e)
{out.println(e);}
	
	%>
	</body>
	</html>