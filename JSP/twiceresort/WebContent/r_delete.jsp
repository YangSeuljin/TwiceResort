<!--예약 정보를 삭제하는 페이지입니다.-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Navigation.jsp" flush="false" />
<meta charset="utf-8">
<%
	//String name=new String(request.getParameter("name").getBytes("8859_1"),"UTF-8");
	String date = new String(request.getParameter("date").getBytes("8859_1"), "UTF-8");
	String room = new String(request.getParameter("room").getBytes("8859_1"), "UTF-8");
	//String firstDate=new String(request.getParameter("firstDate").getBytes("8859_1"),"UTF-8");
	//String firstRoom=new String(request.getParameter("firstRoom").getBytes("8859_1"),"UTF-8");
	//String addr=new String(request.getParameter("roadAddress").getBytes("8859_1"),"UTF-8");
	//String telnum=new String(request.getParameter("phone_number").getBytes("8859_1"),"UTF-8");
	//String iname=new String(request.getParameter("iname").getBytes("8859_1"),"UTF-8");
	//String comment=new String(request.getParameter("comment").getBytes("8859_1"),"UTF-8");
	//String processing=new String(request.getParameter("processing").getBytes("8859_1"),"UTF-8");
	//int intprocessing = Integer.parseInt(processing); // 진행 상황. 1번 예약 가능 2번 예약 확인중 3번 예약 완료
	int introom = Integer.parseInt(room);
	//int intfirstRoom = Integer.parseInt(firstRoom);
	//int inttelnum = Integer.parseInt(telnum);

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(new java.util.Date());

	// out.println(date);
	// out.println(room);
	// out.println(introom);
	Option roomoption = new Option(); //Option 클래스의 객체인 roomoption을 생성.
	String roomname = roomoption.roomoption(introom); //roomoption 메서드에서 값을 가지고 옴.
%>
<title>정보 수정</title>
</head>
<body>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">예약 정보 삭제 완료</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">예약 정보가 삭제되었습니다.</li>
		</ol>

		<table border="1">

			<tr>
				<td style="width: 300px;" align="center"><h4>예약 날짜</h4></td>
				<td style="font-weight: bold; width: 300px;" align="center"><h4><%=date%></h4></td>

			</tr>
			<tr>
				<td style="width: 300px;" align="center"><h4>방 옵션</h4></td>
				<td style="font-weight: bold; width: 300px;" align="center"><h4><%=roomname%></h4></td>
			</tr>
			<tr>
				<td style="width: 300px;" align="center"><h4>삭제일자</h4></td>
				<td style="font-weight: bold; width: 300px;" align="center"><h4><%=now%></h4></td>
			</tr>
		</table>
		<br> <br> <input type=button
			style="WIDTH: 200pt; HEIGHT: 30pt" value="홈으로 가기"
			Onclick="location.href='newindex.jsp'"> <input type=button
			style="WIDTH: 200pt; HEIGHT: 30pt" value="관리자 페이지로 가기"
			Onclick="location.href='managerpage.jsp'">
		<%
			// out.println(name);
			//out.println(date);
			// out.println(introom);
			// out.println(addr);
			// out.println(inttelnum);
			// out.println(iname);
			// out.println(comment);
			// out.println(now);
			// out.println(intprocessing);

			//업데이트를 한다.
			JoaDao dao = JoaDao.sharedInstance();
			JoaDto dto = new JoaDto(); //dto 객체를 생성

			dto.setRoom(introom); //dto 객체에 방번호를 setRoom메서드에 매개변수로 전달함.
			dto.setDate(date); //dto 객체에 날짜를 setDate메서드에 매개변수로 전달함.

			boolean r = dao.delete(dto); //boolean형 변수 r을 선언하여 dao.delete에 매개변수로 dto객체를 매개변수로 전달하여 return 값으로 true or false값을 받는다.

			if (r) {
				out.println("<br>");
				out.println("<br>");
				out.println("삭제에 성공했습니다.");
			} else {
				out.println("<br>");
				out.println("<br>");
				out.println("삭제에 실패했습니다.");
			}
		%>
	</div>
	<!-- Footer -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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
</body>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>