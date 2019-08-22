<!--찾아오는 길을 안내하는 페이지입니다.-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option"%>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Twice Resort</title>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Navigation.jsp" flush="true" />
<meta charset="EUC-KR">
<title>찾아오는길</title>

<!-- Page Heading/Breadcrumbs -->
<div class="container">
	<h1 class="mt-4 mb-3">찾아오는 길</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
				돌아가기</a></li>
		<li class="breadcrumb-item active">찾아오는 길</li>
	</ol>
</head>
<body>
	<center>
		<div
			style="font: normal normal 400 12px/normal dotum, sans-serif; width: 640px; height: 392px; color: #333; position: relative">
			<div style="height: 360px;">
				<a
					href="https://map.kakao.com/?urlX=377236.0&amp;urlY=-73872.0&amp;itemId=22102651&amp;q=%EA%B0%95%EC%A0%95%ED%95%AD&amp;srcid=22102651&amp;map_type=TYPE_MAP&amp;from=roughmap"
					target="_blank"><img class="map"
					src="//t1.daumcdn.net/roughmap/imgmap/0ba2ac4fd46dcce7035e5827dba303bd64c61baed6000795d6a483ff5a32addd"
					width="638px" height="358px" style="border: 1px solid #ccc;"></a>
			</div>
			<div
				style="overflow: hidden; padding: 7px 11px; border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 0px 0px 2px 2px; background-color: rgb(249, 249, 249);">
				<a href="https://map.kakao.com" target="_blank" style="float: left;"><img
					src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png"
					width="72" height="16" alt="카카오맵"
					style="display: block; width: 72px; height: 16px"></a>
				<div
					style="float: right; position: relative; top: 1px; font-size: 11px;">
					<a target="_blank"
						href="https://map.kakao.com/?from=roughmap&amp;srcid=22102651&amp;confirmid=22102651&amp;q=%EA%B0%95%EC%A0%95%ED%95%AD&amp;rv=on"
						style="float: left; height: 15px; padding-top: 1px; line-height: 15px; color: #000; text-decoration: none;">로드뷰</a><span
						style="width: 1px; padding: 0; margin: 0 8px 0 9px; height: 11px; vertical-align: top; position: relative; top: 2px; border-left: 1px solid #d0d0d0; float: left;"></span>
					<a target="_blank"
						href="https://map.kakao.com/?from=roughmap&amp;eName=%EA%B0%95%EC%A0%95%ED%95%AD&amp;eX=377236.0&amp;eY=-73872.0"
						style="float: left; height: 15px; padding-top: 1px; line-height: 15px; color: #000; text-decoration: none;">길찾기</a><span
						style="width: 1px; padding: 0; margin: 0 8px 0 9px; height: 11px; vertical-align: top; position: relative; top: 2px; border-left: 1px solid #d0d0d0; float: left;"></span><a
						target="_blank"
						href="https://map.kakao.com?map_type=TYPE_MAP&amp;from=roughmap&amp;srcid=22102651&amp;itemId=22102651&amp;q=%EA%B0%95%EC%A0%95%ED%95%AD&amp;urlX=377236.0&amp;urlY=-73872.0"
						style="float: left; height: 15px; padding-top: 1px; line-height: 15px; color: #000; text-decoration: none;">지도
						크게 보기</a>
				</div>
			</div>
		</div>

		<br>
	</center>

	<div class="mb-4" id="accordion" role="tablist"
		aria-multiselectable="true">
		<div class="card">
			<div class="card-header" role="tab" id="headingOne">
				<h5 class="mb-0">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">자가용으로 오시는 길</a>
				</h5>
			</div>

			<div id="collapseOne" class="collapse show" role="tabpanel"
				aria-labelledby="headingOne">
				<div class="card-body">
					<H5>
						1135번 평화로 → 창전 → 1132번 일주도로 → 중문관광단지 → 서귀포 방향 (약 20분) → Twice
						Resort *서귀포 월드컵 경기장에서 성산, 남원 방향으로 3분정도 소요
						<H5>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" role="tab" id="headingTwo">
				<h5 class="mb-0">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo">대중교통으로 오시는 길 </a>
				</h5>
			</div>
			<div id="collapseTwo" class="collapse" role="tabpanel"
				aria-labelledby="headingTwo">
				<div class="card-body">
					<H4>[제주시외버스터미널 출발]</H4>
					<H5>210-1 , 220-1 , 230-1 ,343-1 , 260 , 330-1 탑승</H5>
					<br> <br>
					<H4>[서귀포 시외버스터미널 출발]</H4>
					<H5>230-1 , 210-1 , 220-1 탑승</H5>

				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header" role="tab" id="headingThree">
				<h5 class="mb-0">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">도보로 오시는 길</a>
				</h5>
			</div>
			<div id="collapseThree" class="collapse" role="tabpanel"
				aria-labelledby="headingThree">
				<div class="card-body">
					<H5>
						북촌리 버스장류장에서 언덕으로 5분 → CU편의점 옆 오른쪽 골목 → 제주 낚시용품 지나서 도보로 10분 직진 →
						Twice Resort
						<H5>
				</div>
			</div>
		</div>
	</div>

	</div>
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