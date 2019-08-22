<!--주변 여행지를 소개하는 페이지입니다.-->
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">



<title>Modern Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>

<body>
	<jsp:include page="Navigation.jsp" flush="false" />
	<!-- Page Content -->

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">주변 여행지</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">주변 관광지에서 다양한 경험을 해보세요.</li>
		</ol>


		<!-- Blog Post -->
		<div class="card mb-4">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-6">
						<img class="img-fluid rounded" src="7503002.jpg" alt="">
					</div>
					<div class="col-lg-6">
						<h2 class="card-title">Twice 워터파크</h2>
						<p class="card-text">
							전체 12,000평부지에 실내 2,000평, 실외 8,500평, 광장 및 주차장 등의 고객 편의시설 1,500평으로
							이루어져 있으며, 하루 최대 10,000명을 수용할 수 있는 최대급 규모를 자랑합니다. 다양한 물놀이 시설과
							편의시설을 갖추고 있으며 사계절 내내 안전하고 건강하게 워터파크의 즐거움을 만끽하실 수 있습니다. <br>
							<br> * Twice Resort와 함께 이용시 할인 혜택이 제공됩니다.
						</p>
						
						<a href="#" class="btn btn-primary">홈페이지로 가기 &rarr;</a>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted">
				<a href="#"></a>
			</div>
		</div>

		<!-- Blog Post -->
		<div class="card mb-4">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-6">
						<img class="img-fluid rounded" src="7503001.jpg">
					</div>
					<div class="col-lg-6">
						<h2 class="card-title">성산일출봉</h2>
						<p class="card-text">
							바다위에 우뚝 솟아난 수성화산·유네스코 세계자연유산, 천연기념물 제420호, 올레1코스<br>
							<br> 성산일출봉은 제주도의 다른 오름들과는 달리 마그마가 물속에서 분출하면서 만들어진 수성화산체입니다.
						</p>
						</p>
						<br>
						<a href="#" class="btn btn-primary">홈페이지로 가기 &rarr;</a>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted"></div>
		</div>

		<!-- Blog Post -->
		<div class="card mb-4">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-6">
						 <img class="img-fluid rounded" src="asdf.jpg"
							alt="">
						
					</div>
					<div class="col-lg-6">
						<h2 class="card-title">스킨스쿠버 체험</h2>
						<p class="card-text">
							아름다운 제주 바다속 환상 체험 감동 체험!<br> 제주의 에메랄드빛 바다를 온몸으로 느낄 수 있습니다. <br>
							연인, 친구 가족과 함께 평생 잊지 못할 행복한 추억을 만들어보세요!
						</p>
						* Twice Resort와 패키지 요금제로 이용하시면 파격적인 할인 혜택이 제공됩니다.<br><br>
						<br> <a href="#" class="btn btn-primary">홈페이지로 가기 &rarr;</a>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted">

				<a href="#"></a>
			</div>
		</div>

	</div>

	</div>
	<!-- /.container -->

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
