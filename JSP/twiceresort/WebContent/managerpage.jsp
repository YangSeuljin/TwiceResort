<!--관리자가 예약상황을 조회하고 클릭해서 수정/삭제가 가능한 관리자 페이지입니다.-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html>

<html>
<style>
table.type10 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: 20px 10px;
	align: center;
}

table.type10 thead th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #e7708d;
	margin: 20px 10px;
	align: center;
	text-align: center;
}

table.type10 tbody th {
	width: 150px;
	padding: 10px;
	align: center;
	text-align: center;
}

table.type10 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	align: center;
	text-align: center;
}

table.type10 .even {
	background: #fdf3f5;
}
</style>


<head>
<jsp:include page="Navigation.jsp" flush="false" />
</head>
<body>

	<%
		if (session.getAttribute("userid") == null) {
			out.println("<center><br><br><H2>아이디와 비밀번호를 다시 확인해주세요.</H2>");
			out.println("<button><a href='newindex.jsp'>홈으로 돌아가기</a></button>");
			out.println("<button><a href='loginpage.jsp'>로그인 페이지로 돌아가기</a></button>");
			out.println(
					"<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></center>");
		} else {

			String userid = (String) session.getAttribute("userid");
	%>

	<%
		//select문
			//JoaDao dao = JoaDao.sharedInstance();
			//List <JoaDto> list = dao.getList();
			//for(JoaDto dto:list){
			//	out.println(dto);
			//}

			//JoaDao dao = new JoaDao();
			//List<JoaDto> list= dao.getname("2019-07-24",2);

			//for (JoaDto dto : list){
			//System.out.println(dto);
			//}
	%>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			<h1 class="mt-4 mb-3"><%=userid%>님의 관리자 페이지입니다.
			</h1>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">예약 상황 보기</li>
		</ol>
	</div>


	<div align="center">
		<table border="1" width="50%" text-align="center" align="center"
			id="tbs" class="type10">
			<thead>
				<tr>
					<th width="10%" height="50px" scope="cols" text-align="center"><h2>날짜</h2></th>
					<th width="10%" scope="cols">모찌모찌 <br> Room
					</td>
					<th width="10%" scope="cols">쯔뭉 <br>Room
					</td>
					<th width="10%" scope="cols">나부기 <br> Room
					</td>

				</tr>
				<%
					for (int i = 0; i < 30; i++) {
				%>
				<tr>
					<td>
						<%
							//오늘 날짜 구하기
									java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
									String date = sdf.format(new java.util.Date());

									//날짜 더하기
									Calendar cal = Calendar.getInstance();
									cal.add(cal.DATE, i);
									String strDate = sdf.format(cal.getTime());
									out.println(strDate);
						%>
					</td>

					<td width="10%">
						<%
							JoaDao dao2 = JoaDao.sharedInstance();
									String name = dao2.selectname(strDate, 1);

									if (name == null) {
										out.println("예약가능");
									}
									//out.println(list.get(0));				

									else if (name != null) {

										out.println("<a href =updatepage.jsp?resv_date=" + strDate + "&room=1&processing=2&date=" + date
												+ "'>" + name + "</a>");
									}

									//out.println(list.get(0));
									//String str = String.valueOf(list.get(0));
									//out.println(str);
									//String str = String.valueOf(list.get(0));
									//out.println(list.get(1));

									//out.println(str);
									//for (i=0;i<list.size();i++){
									//	String str = String.valueOf(list.get(i));
									//	String sublist=str.substring(1,3);
									//	out.println(sublist);
									//;}	
									//if(list==null){

									//	out.println("<a href = 'http://localhost:8090/joa/d_02.jsp?resv_date=" + strDate
									//				+ "&room=1&processing=2&date=" + date + "'>예약하기</a>");
									//	}
									//	else {
									//		out.println("예약불가");
									//}
						%>

					</td>
					<td width="10%">
						<%
							JoaDao dao_room2 = JoaDao.sharedInstance();
							String name_room2 = dao2.selectname(strDate, 2);

									if (name_room2 == null) {
										out.println("예약가능");
									}
									//out.println(list.get(0));				

									else if (name_room2 != null) {

										out.println("<a href =updatepage.jsp?resv_date=" + strDate + "&room=2&processing=2&date=" + date
												+ "'>" + name_room2 + "</a>");
									}
						%>

					</td>
					<td width="10%">
						<%
							JoaDao dao_room3 = JoaDao.sharedInstance();
									String name_room3 = dao2.selectname(strDate, 3);

									if (name_room3 == null) {
										out.println("예약가능");
									}
									//out.println(list.get(0));				

									else if (name_room3 != null) {

										out.println("<a href =updatepage.jsp?resv_date=" + strDate + "&room=3&processing=2&date=" + date
												+ "'>" + name_room3 + "</a>");
									}
						%>
					</td>
				</tr>
				<%
					}
				%>
			
		</table>
	</div>
	<%
		}
	%>

	<!-- Footer -->
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
