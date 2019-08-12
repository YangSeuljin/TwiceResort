<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.PageMaker"%>

<html>
<style>

</style>
<head>
</head>
<%//try{
	Class.forName("com.mysql.jdbc.Driver");//문자열을 객체로 리턴
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.56.1:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false", "root", "password");
	//db url,계정 정보를 식별자로 받아 연결을 시도
	Statement stmt = conn.createStatement();
	//쿼리를 생성/실행/반환한 결과를 가져올 작업영역
	
	//자료 읽어오기용 변수
	   int LineCnt = 0;
	   int fromNum = 0;
	   int toNum = 0;
	   int toCnt = 0; 
	   String fromTemp;
	   String toTemp;
	   
	   //값 받기
	    fromTemp = request.getParameter("from"); //from이라는 이름은 내가 지정해준 것 
	   toTemp = request.getParameter("cnt"); //몇개까지 값을 받았는지.
	   
	     //최초에 받은 값이 없을 때
	    if(fromTemp == null && toTemp == null){
	        fromNum = 1; //제일 처음 값
	        toCnt = 10;
	    }else{  //(만약 받은 값이 있다면)페이지 이동 번호를 눌렀다면 그 값을 페이지 이동 값으로 보내줘야함
	        fromNum = Integer.parseInt(fromTemp); //받은 String값을 Int값으로
	       toCnt = Integer.parseInt(toTemp);
	    }toNum = fromNum + toCnt;
	   
	   //페이징용 변수
	   final int firstPage_firstNum = 1; //맨 첫 페이지의 번호 
	    int firstNum = 1; //각 페이지의 첫 항목의 번호 
	    int prevPage_firstNum = 0; //이전 페이지용 
	    int nextPage_firstNum = 0; //다음 페이지용
	    int lastPage_firstNum = 0; //마지막 페이지용
	    int totalLineCnt = 0; //데이터의 전체 라인 수 (마지막 페이지용)
	
	    ResultSet rset2 = stmt.executeQuery("select * from gongji");
	    while(rset2.next()){
	       totalLineCnt++;
	    }
	    
	    //각 페이지의 첫 번째 링크 숫자
	     String getFirstLink = request.getParameter("sendFirstLink");
	     if(getFirstLink != null){
	         firstNum = Integer.parseInt(getFirstLink);
	     }
	     //마지막p 첫 링크 번호 구하기 (총라인 몇개 산정하고 식을 도출해내는 식으로 구함)
	     lastPage_firstNum = ((int)(totalLineCnt/100)*10)+1;
	     if (totalLineCnt == 100) lastPage_firstNum = 1; //위의 식에서 나올 오류의 예외처리용

	     //이전 페이지 이동
	     prevPage_firstNum = firstNum-10; 

	     //다음 페이지 이동
	     nextPage_firstNum = firstNum+10; 

	   //값 읽어오기
	      ResultSet rset = stmt.executeQuery("select * from gongji;");
	    
	    %>
<body>
<table cellspacing=1 width=600 border=1>
<tr>
	<td width=50><p align=center>번호</p></td>
	<td width=50><p align=center>제목</p></td>
	<td width=50><p align=center>등록일</p></td>
	</tr>
	<% 
	while(rset.next()){
        LineCnt++;
          if(LineCnt < fromNum){continue;}
          if(LineCnt >= toNum){break;}
         out.println("<tr>");
         out.println("<td width=50 align=center>"+rset.getInt(1)+"</td>");
	     out.println("<td width=50><a href='gongji_view_H.jsp?id="+rset.getInt(1)+"' text-align=center>"+rset.getString(2)+"</a></td> ");
	     out.println("<td width=50><p align=center>"+rset.getDate(3)+"</p></td>");
	     out.println("</tr>");
  }
  rset.close();
  stmt.close();
  conn.close();   
	%>
	</table>
	<table width=650>
	<tr>
		<td width=550></td>
		<td><input type=button value="신규" OnClick="window.location='gongji_insert_H.jsp'"></td>
	</tr>
	</table>
<%--페이지 수 만들기--%>
        <table  align="center">
            <tr id="Ltr">
                <%if(firstNum != 1){%>
             <%-- 제일 첫 페이지로 이동 --%>
                <td>
                    <a class=no_line href ="gongji_list_H2?sendFirstLink=<%=firstPage_firstNum%>">≪</a>
                </td>
                <%-- 이전 페이지로 이동 --%>
                <td>
                    <a class=no_line href ="gongji_list_H2?sendFirstLink=<%=prevPage_firstNum%>&from=<%=prevPage_firstNum*10-9%>&cnt=10">＜</a>
                </td>
                <%}%>
                
                <%-- 10쪽씩만 보이도록 처리 --%>
                <%
                    for(int i=firstNum; i<firstNum+10; i++){
                        //더이상 나올 데이터가 없을 경우 페이지 번호도 보이지 않는다
                        if((i*10)-9 > totalLineCnt) break;
                        out.print("<td text-align=\"center\">");
                        out.print("<a class=no_line href=gongji_list_H2.jsp?sendFirstLink="+firstNum+"&from="+((i*10)-9)+"&cnt=10>"+i+"</a>");
                        out.print("</td>");
                    }
                %>
                <%if((firstNum+9)*10 < totalLineCnt){%>
                        
                <%-- 다음 페이지로 이동 --%>
                <td>
                    <a class=no_line href ="gongji_list_H2?sendFirstLink=<%=nextPage_firstNum%>&from=<%=nextPage_firstNum*10-9%>&cnt=10">＞</a>
                </td>
                <%-- 제일 마지막 페이지로 이동 --%>
                <td>
                    <a class=no_line href ="gongji_list_H2?sendFirstLink=<%=lastPage_firstNum%>&from=<%=lastPage_firstNum*10-9%>&cnt=10">≫</a>
                </td>

                <%}%>
            </tr>
            </table>
      
      <%
      //}catch(Exception e){
      //   out.println("<p align=center>등록된 공지가 없습니다.</p>");
      //}
      %>      
   </body>
</html>	