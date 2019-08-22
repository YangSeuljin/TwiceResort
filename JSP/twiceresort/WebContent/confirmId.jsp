<!--관리자 회원으로 가입할 때 아이디 중복을 확인하는 페이지입니다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page
	import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option,dao.MembershipDao,dto.MembershipDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
</head>
<body>
	<%
		String id = request.getParameter("id"); //id 값을 받아온 후에 String형 변수 id에 입력.
		MembershipDao dao = MembershipDao.sharedInstance();
		int check = dao.confirmId(id); //MembershipDao 클래스의 메스드인 confirmId에 id를 매개변수로 전달하여 check 변수에 입력한다.

		if (check == 1) {
	%>
	<b><font color="red"><%=id%></font>는 이미 사용중인 아이디입니다.</b>
	<form name="checkForm" method="post" action="confirmId.jsp">
		<b>다른 아이디를 선택하세요. </b><br> <br> <input type="text" name="id" />
		<input type="submit" value="ID중복확인">
	</form>
	<%
		} else {
	%><center>
		<b>입력하신<font color="red"><%=id%></font>는<br> 사용할 수 있는 ID입니다.
		</b><br> <br> <input type="button" value="사용하기"
			onclick="setid()">
	</center>
	<%
		}
	%>
	<script language="javascript">
	
//opener.document.폼네임.필드네임.value="값" => 팝업창을 띄우고 나서 다시 부모 창으로 결과 값을 돌려줄 때 사용한다.

function setid(){
	opener.document.userinput.id.value="<%=id%>";
	opener.document.userinput.idCheck.value="Y"; //idCheck 값을 Y로 바꿔줌으로서 아이디 중복확인을 해야만 회원가입이 가능하다.
	self.close();
		}
	</script>
</body>
</html>