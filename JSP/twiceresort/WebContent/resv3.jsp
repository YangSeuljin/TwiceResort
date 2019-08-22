<!--3번방의 예약 상황을 개별로 보여주는 페이지입니다.-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option"%>
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
<jsp:include page="Navigation.jsp" flush="true" />
</head>
<body>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">나부기룸 예약 상황</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">나부기룸 예약 상황 보기</li>
		</ol>
	</div>


	<div align="center">
		<table border="1" width="50%" text-align="center" align="center"
			id="tbs" class="type10">
			<thead>
				<tr>
					<th width="10%" height="50px" scope="cols" text-align="center"><h2>날짜</h2></th>
					<th width="10%" scope="cols">나부기 <br> Room
					</td>

				</tr>
			</thead>
			<%
				for (int i = 0; i < 30; i++) {
			%>
			<tbody>
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
							JoaDao dao_room3 = JoaDao.sharedInstance();
								List<JoaDto> list_room3 = dao_room3.selectone(strDate, 3);

								if (list_room3.size() == 0) {
									out.println("<a href = 'http://192.168.23.102:8090/twiceresort/resvform.jsp?resv_date=" + strDate
											+ "&room=3&processing=2&date=" + date + "'>예약가능</a>");
									continue;

								}

								if (list_room3.size() > 0) {
									String str_room3 = String.valueOf(list_room3.get(0));
									Option changeName = new Option();
									String newname_room3 = changeName.changename(str_room3);
									out.println(newname_room3);
								}
						%>
					</td>
				</tr>
			</tbody>
			<%
				}
			%>

		</table>
		<br> <br>
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
</body>
</html>