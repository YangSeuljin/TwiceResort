<!--예약을 완료하는 페이지입니다.-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@page import="java.util.List"%>
<!-- 선언부 밑에 위치해야한다. -->
<%@page import="java.util.ArrayList"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option"%>
<!DOCTYPE html>
<html>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
<head>

</head>
<body>
	<jsp:include page="Navigation.jsp" flush="false" />
	<%
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String now = sdf.format(new java.util.Date());

		String name = new String(request.getParameter("name").getBytes("8859_1"), "UTF-8"); //이름 
		String date = new String(request.getParameter("date").getBytes("8859_1"), "UTF-8"); //예약 날짜
		String option = new String(request.getParameter("option").getBytes("8859_1"), "UTF-8"); // 방 옵션. 몇 번 방인지?
		String roadAddress = new String(request.getParameter("roadAddress").getBytes("8859_1"), "UTF-8"); // 주소
		String phone_number = new String(request.getParameter("phone_number").getBytes("8859_1"), "UTF-8"); // 전화번호
		String iname = new String(request.getParameter("iname").getBytes("8859_1"), "UTF-8"); // 입금자 이름
		String comment = new String(request.getParameter("comment").getBytes("8859_1"), "UTF-8"); // 남기시는 말
		String nowdate = request.getParameter(now); // 신청하는 현재의 날짜
		String processing = new String(request.getParameter("processing").getBytes("8859_1"), "UTF-8");
		int intprocessing = Integer.parseInt(processing); // 진행 상황. 1번 예약 가능 2번 예약 확인중 3번 예약 완료
 		int intoption = Integer.parseInt(option); // 방번호를 숫자로 바꿈.
		

		JoaDao checkDao = JoaDao.sharedInstance();
		int check = checkDao.confirmResv(date, intoption);
		%>
	<%if (check == -1) { // 날짜와 룸번호가 이미 예약 되어있다면 %>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">예약 완료</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">아래의 정보를 확인해주세요.</li>
		</ol>

		<% 
 				JoaDao dao = JoaDao.sharedInstance();
				JoaDto dto = new JoaDto();
				dto.setAddr(roadAddress); //주소
 				dto.setComment(comment); // 남기시는 말
 				dto.setDate(date); // 예약 날짜
 				dto.setIn_name(iname); //입금자명
 				dto.setName(name); //신청자명
 				dto.setProcessing(intprocessing); //예약 진행상황
 				dto.setRoom(intoption); //방번호
 				dto.setTelnum(phone_number); //전화번호
 				dto.setWrite_date(now); //신청을 한 날짜

 				boolean r = dao.Insertresv(dto);

 				if (r) {
 					out.println("삽입에 성공했습니다.");
 				} else {
 					out.println("삽입에 실패했습니다.");
 				}

 				//룸번호를 가지고 이름으로 바꾸어준다.
 				String roomname = "";
				Option roomoption = new Option(); //Option 클래스의 객체인 roomoption을 생성.
				roomname = roomoption.roomoption(intoption); //roomoption 메서드에서 값을 가지고 옴.
		%>


		<table border="1">
			<tr>
				<td>이름</td>
				<td style="font-weight: bold;"><%=name%></td>

			</tr>
			<tr>
				<td>예약 날짜</td>
				<td style="font-weight: bold;"><%=date%></td>

			</tr>
			<tr>
				<td>방옵션</td>
				<td style="font-weight: bold;"><%=roomname%></td>
			</tr>

			<tr>
				<td>주소</td>
				<td style="font-weight: bold;"><%=roadAddress%></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td style="font-weight: bold;"><%=phone_number%></td>
			</tr>
			<tr>
				<td>입금자명</td>
				<td style="font-weight: bold;"><%=iname%></td>
			</tr>
			<tr>
				<td>예약일자</td>
				<td style="font-weight: bold;"><%=now%></td>
			</tr>
		</table>

		<br>
		<div>
			<input type=button style="WIDTH: 200pt; HEIGHT: 30pt" value="홈으로 가기"
				Onclick="location.href='newindex.jsp'"> <input type=button
				style="WIDTH: 200pt; HEIGHT: 30pt" value="예약 조회 화면으로 가기"
				Onclick="location.href='resv.jsp'">
		</div>

		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
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


	<%
		} else{
	%>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">예약 불가</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">이미 예약된 방입니다. 예약이 가능한 날짜를 선택해주세요.</li>
		</ol>
		<div>
			<input type=button style="WIDTH: 200pt; HEIGHT: 30pt"
				value="예약 조회 화면으로 가기" Onclick="location.href='resv.jsp'">
		</div>

		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>

	<br>
	<br>

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

	<% }%>
</body>

</html>