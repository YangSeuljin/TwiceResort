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
<html>
<head>
<title>가격 안내</title>
</head>
<body>
	<jsp:include page="Navigation.jsp" flush="false" />
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			<small>금액 안내</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">숙박 금액</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h3 class="card-header">모찌모찌 Room</h3>
					<div class="card-body">
						<div class="display-4">₩510,000</div>
						<div class="font-italic">1박 기준</div>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">수영장, 바비큐장, 조식제공</li>
						<li class="list-group-item">별도 바베큐장 제공</li>
						<li class="list-group-item">최고급 스파</li>
						<li class="list-group-item" align="center"><a href="resv.jsp"
							class="btn btn-primary"">지금 예약하기!</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h3 class="card-header">쯔뭉 Room</h3>
					<div class="card-body">
						<div class="display-4">₩420,000</div>
						<div class="font-italic">1박 기준</div>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">수영장, 바비큐장, 조식제공</li>
						<li class="list-group-item">독채,침대방,가족실</li>
						<li class="list-group-item">스파 제공</li>
						<li class="list-group-item" align="center"><a href="resv.jsp"
							class="btn btn-primary">지금 예약하기!</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h3 class="card-header">나부기 Room</h3>
					<div class="card-body">
						<div class="display-4">₩350,000</div>
						<div class="font-italic">1박 기준</div>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">수영장, 바비큐장, 조식제공</li>
						<li class="list-group-item">복층,침대방,가족실</li>
						<li class="list-group-item">넓은 방 보유</li>
						<li class="list-group-item" align="center"><a href="resv.jsp"
							class="btn btn-primary">지금 예약하기!</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

<!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
		   
<p class="m-0 text-center text-white">(주) Twice Resort 제주 서귀포시 강정동    대표이사 : YSJ   개인정보관리 책임자: 박지효
사업자등록번호 : 2015-10-20    통신판매업신고 : 2005-제주-151020    통신판매사업자 정보 
CONTACT CENTER 1588-1234    운영시간 07:00 ~23:00 ( 연중무휴 )   이메일 TwiceResort@twice.com </p>
			<p class="m-0 text-center text-white">Copyright &copy; Twice
				Resort 2019</p>
		</div>
    <!-- /.container -->
  </footer>

</html>