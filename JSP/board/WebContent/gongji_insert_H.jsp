<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">

function f(){
	if (fm.title.value=="") { // 제목이 비어있을 때
        alert("제목을 입력하세요.");
        fm.title.focus();
        return false;
	}
	if (fm.content.value=="") { // 내용이 비어있을 때
        alert("내용을 입력하세요.");
        fm.title.focus();
        return false;
	}
	else return true;
}

</SCRIPT>
</head>
<body>
<FORM name='fm' action="gongi_insert.jsp" onsubmit="return f()">
<table width=650 border=1 cellspacing=0 cellpadding=5>
<tr>
	<td><b>번호</b></td>
	<td>신규(insert)<input type=hidden name=id value'INSERT'></td>
</tr>
<tr>
	<td><b>제목</b></td>
	<td><input type=text name=title size=70 maxlength=70></td>
</tr>
<tr>
	<td><b>일자</b></td>
	<td>
	<%java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String date = sdf.format(new java.util.Date());
	out.println(date);
	%></td>
</tr>
<tr>
	<td><b>내용</b></td>
	<td><textarea style="width:500px; height:250px;" name=content cols=70 row=600></textarea></td>
</tr>
</table>
<table width=650>	
	<tr>
	<td width=600></td>
	<td><input type=button value="취소" OnClick="location.href='gongji_list_H2.jsp'"></td>
	<td><input type=submit value="쓰기"></td>
	</tr>
	</table>
	</FORM>
	</body>
	</html>
