<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Twice Resort</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">


</head>

<body>
	<jsp:include page="Navigation.jsp" flush="false" />

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('http://wallperio.com/data/out/367/pretty-resort-wallpapers_616912692.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>환상적인 경치</h3>
						<p>조용한 곳에서 낭만적인 시간을 보내세요</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://external-preview.redd.it/Neq5vBjU0MeSaoNiv0gND5ffEdXPMt1Jm6vZa-k7-_I.png?width=960&crop=smart&auto=webp&s=2ff83d7e620623740bb2c3ad12e68a3db12d7a33')">
					<div class="carousel-caption d-none d-md-block">
						<h3>트와이스와 함께 휴가를 즐기세요</h3>
						<p>함께 즐겨요</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('https://money-tourism.gr/wp-content/uploads/2019/01/atrium-prestige-Pools-2_Hi-Res-1-1900x1080.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>최고의 낭만을 만끽하세요</h3>
						<p>탁트인 바다의 풍경을 바라보며 시원한 바다를 직접 느껴보세요.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">Welcome to Twice Resort</h1>

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Twice Resort 소개</h4>
					<div class="card-body">
						<p class="card-text">
							트와이스의 건축 미학을 담고있는 Twice Resort는 환상적인 바다 전망과 어우러지는 709실 규모의 호텔 &
							리조트로 탄생했습니다.<br> 맑고 투명한 옥빛 물결,파도의 리듬에 맞춰 한걸음 한걸음씩 속도를 줄이다 보면
							어느덧 마음이 치유될 것입니다.
						</p>
					</div>
					<div class="card-footer">
						<a href="about.jsp" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">찾아오는 길</h4>
					<div class="card-body">
						<p class="card-text">
							교통편이 편리한 Twice Resort는 자가용을 타고 오셔도 되고, 대중교통을 이용하셔도 쉽게 찾아올 수 있습니다.<br>
							<br>편리함과 더불어 소중한 추억을 함께 남겨보세요.
						</p>
					</div>
					<div class="card-footer">
						<a href=" location.jsp" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">주변 여행지</h4>
					<div class="card-body">
						<p class="card-text">Twice Resort 주변은 멋진 경치뿐만 아니라, 주변에 다양한
							여행지와 놀거리들이 많이 있어서 더욱 즐거운 여행을 할 수 있습니다. 함께 만끽해보세요.</p>
					</div>
					<div class="card-footer">
						<a href="enjoy.jsp" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Section -->
		<h2>주변 여행지</h2>

		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="enjoy.jsp"><img class="card-img-top"
						src="https://www.marestang.co.uk/wp-content/uploads/2018/03/DSC_1474-copie-700x400.jpg"
						alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="enjoy.jsp">Twice 워터파크</a>
						</h4>
						<p class="card-text">전체 12,000평부지에 실내 2,000평, 실외 8,500평, 광장 및
							주차장 등의 고객 편의시설 1,500평으로 이루어져 있으며, 하루 최대 10,000명을 수용할 수 있는 최대급 규모를
							자랑합니다. 다양한 물놀이 시설과 편의시설을 갖추고 있으며 사계절 내내 안전하고 건강하게 워터파크의 즐거움을 만끽하실
							수 있습니다.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="enjoy.jsp"><img class="card-img-top" src="700400.jpg"
						alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="enjoy.jsp">성산일출봉</a>
						</h4>
						<p class="card-text">
							바다위에 우뚝 솟아난 수성화산·유네스코 세계자연유산, 천연기념물 제420호, 올레1코스<br>
							<br> 성산일출봉은 제주도의 다른 오름들과는 달리 마그마가 물속에서 분출하면서 만들어진 수성화산체입니다.
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="enjoy.jsp"><img class="card-img-top"
						src="http://www.tiranadahab.com/wp-content/uploads/2018/03/GettyImages-597572085-584819855f9b5851e593fd0b-700x400.jpg"
						alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="enjoy.jsp">스킨스쿠버 체험</a>
						</h4>
						<p class="card-text">
							아름다운 제주 바다속 환상 체험 감동 체험!<br>
							<br>제주의 에메랄드빛 바다를 온몸으로 느낄 수 있습니다.<br>
							<br>연인, 친구 가족과 함께 평생 잊지 못할 행복한 추억을 만들어보세요!
						</p>
					</div>
				</div>
			</div>

		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-6">
				<h4>이 홈페이지에 활용된 개발 언어</h4>
				<p>아래와 같은 언어들을 활용하였습니다.</p>
				<ul>
					<li><strong>HTML</strong></li>
					<li><strong>CSS</strong></li>
					<li><strong>JSP</strong></li>
					<li><strong>JAVASCRIPT</strong></li>
					<li><strong>데이터베이스 : mysql 5.7.26</strong></li>
					<li><strong>서버 : Ubuntu 16.04.6</strong></li>
				</ul>
				<p>리조트의 예약 상황을 확인하여 날짜별로 예약하고, 관리자 페이지에서 로그인을 하면 예약 조회 및 변경이 가능한
					예약사이트입니다.</p>

			</div>
			<div class="col-lg-6">
				<img class="img-fluid rounded" src="700450.jpg" alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Call to Action Section -->
		<div class="row mb-4">
			<div class="col-md-8">
				<p><h3>문의사항은 언제든지 이메일로 보내주세요.
				
					<h3>
						</p>
			</div>
			<div class="col-md-4" align="center" text-align="center">
				<a class="btn btn-lg btn-secondary btn-block"
					href="mailto:gluestuck@naver.com?Subject=문의사항" align="center">양슬진의
					이메일</a>
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
