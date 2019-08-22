<!--관리자 회원정보를 생성하는 페이지입니다.-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@page import="java.util.List"%>
<!-- 선언부 밑에 위치해야한다. -->
<%@page import="java.util.ArrayList"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option,dao.MembershipDao,dto.MembershipDto"%>
<!DOCTYPE html>
<html>
<style>
.center{
align:center;

text-align:center;
}
</style>
<head>
<meta charset="utf-8">
<title>Member insert</title>
</head>
<body>
<jsp:include page="Navigation.jsp" flush="false" />

<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			<h1 class="mt-4 mb-3">관리자 회원가입이 완료되었습니다.
			</h1>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">아래의 정보를 확인해주세요.</li>
		</ol>
	

<%
String id=new String(request.getParameter("id").getBytes("8859_1"),"UTF-8"); //이름 
String password=new String(request.getParameter("password").getBytes("8859_1"),"UTF-8"); //예약 날짜
String name=new String(request.getParameter("name").getBytes("8859_1"),"UTF-8"); // 방 옵션. 몇 번 방인지?
String email=new String(request.getParameter("email").getBytes("8859_1"),"UTF-8"); // 주소
String phonenumber=new String(request.getParameter("phonenumber").getBytes("8859_1"),"UTF-8"); // 전화번호
String emailReceiveYn=new String(request.getParameter("emailReceiveYn").getBytes("8859_1"),"UTF-8"); // 입금자 이름
String smsReceiveYn=new String(request.getParameter("smsReceiveYn").getBytes("8859_1"),"UTF-8"); // 남기시는 말

MembershipDao dao = MembershipDao.sharedInstance();
MembershipDto dto = new MembershipDto();
dto.setId(id); //이용자 아이디를 set
dto.setPassword(password); //이용자 비밀번호를 set
dto.setname(name); // 이용자 이름을 set
dto.setEmail(email); // 이용자 이메일을 set
dto.setPhone(phonenumber); //이용자 전화번호를 set
dto.seteagree(emailReceiveYn); //이메일 수신여부를 set
dto.setSmsagree(smsReceiveYn); //문자 메시지 수신여부를 set


boolean r = dao.Insert(dto);

if(r){
	out.println("가입이 완료되었습니다.");
	out.println("<br><br>");
}else{
	out.println("가입이 실패하였습니다.");
	out.println("<br><br>");
}
%>
<table class="center" border="1" text-size="5">
		<tr>
			<td>아이디</td>
			<td style="font-weight: bold;"><%=id %></td>

		</tr>
		<tr>
			<td>이름</td>
			<td style="font-weight: bold;"><%=name %></td>

		</tr>
		<tr>
			<td>email</td>
			<td style="font-weight: bold;"><%=email %></td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td style="font-weight: bold;"><%=phonenumber %></td>
		</tr>
		<tr>
			<td>이메일 수신 여부</td>
			<td style="font-weight: bold;"><%=emailReceiveYn %></td>
		</tr>
		<tr>
			<td>문자 수신 여부</td>
			<td style="font-weight: bold;"><%=smsReceiveYn %></td>
		</tr>

	</table>
	<br>
	<div>
		<input type=button style="WIDTH: 200pt; HEIGHT: 30pt" value="홈으로 가기"
			Onclick="location.href='newindex.jsp'"> <input type=button
			style="WIDTH: 200pt; HEIGHT: 30pt" value="관리자 로그인 화면으로 가기"
			Onclick="location.href='loginpage.jsp'">
	</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br><br>
	<br><br>
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">

			<p class="m-0 text-center text-white">(주) Twice Resort 제주 서귀포시
				강정동 대표이사 : YSJ 개인정보관리 책임자: 박지효 사업자등록번호 : 2015-10-20 통신판매업신고 :
				2005-제주-151020 통신판매사업자 정보 CONTACT CENTER 1588-1234 운영시간 07:00 ~23:00
				( 연중무휴 ) 이메일 TwiceResort@twice.com</p>
			<p class="m-0 text-center text-white">Copyright &copy; Twice
				Resort 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



</body>
</html>