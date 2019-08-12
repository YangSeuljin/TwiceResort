<%@ page contentType="text/html; charset=utf-8" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Twice Resort</title>

</head>

<body>

 <jsp:include page="Navigation.jsp" flush="false" />

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">About
      <small>Twice Resort</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="newindex.jsp">HOME으로 돌아가기</a>
      </li>
      <li class="breadcrumb-item active">About</li>
    </ol>

    <!-- Intro Content -->
    <div class="row">
      <div class="col-lg-6">
        <img class="img-fluid rounded mb-4" src="https://images.joins.com/newsroom/2018/0410_idol3year/img_group/TWICE.jpg" alt="">
      </div>
      <div class="col-lg-6">
        <h2>About Twice Resort</h2>
        <p>트와이스 리조트에 오신 것을 환영합니다. </p>
        <p>트와이스 멤버들의 개성이 담긴 방들을 직접 느껴보세요.</p>
        <p>트와이스 멤버들의 개성을 담은 Twice Resort는 하얀 외벽과 파란색 지붕의 조화가 돋보이는 그리스 키클라틱 건축양식을 모티브로
환상적인 바다 전망과 어우러지는 709실 규모의 호텔 & 리조트로 탄생했습니다. 맑고 투명한 옥빛 물결, 파도의 리듬에 맞춰 한걸음 한걸음씩 속도를 줄이다 보면 어느덧 마음이 치유될 것입니다.</p>
      </div>
    </div>
    <!-- /.row -->

    <!-- Team Members -->
    <h2>Our Room</h2>

    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="http://imagenew.hotelpass.com/KRINC021/KRINC0216.jpg" alt="">
          <div class="card-body">
            <h4 class="card-title">다현의 모찌모찌 Room</h4>
            <h6 class="card-subtitle mb-2 text-muted">528번 Room</h6>
            <p class="card-text">다현의 발랄함을<br> 느낄 수 있는 방입니다.<br> 깔끔한 느낌의 방에서 <br> 시원한 바다의 풍경을 느껴보세요.</p>
          </div>
          <div class="card-footer">
            <a href="#">TwiceResort@example.com</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="https://wanderlustphuquoc.com/wp-content/uploads/2018/05/Phu-Quoc-Wanderlust-Bungalows-Guest-House-2-750x450.jpg" alt="">
          <div class="card-body">
            <h4 class="card-title">쯔위의 쯔뭉 Room</h4>
            <h6 class="card-subtitle mb-2 text-muted">614번 Room</h6>
            <p class="card-text">쯔위와 같이 세련되고 <br> 아름다운 느낌의 방입니다.<br> 심플한 매력을 느껴보세요.</p>
          </div>
          <div class="card-footer">
            <a href="#">TwiceResort@example.com</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="https://www.byoumhotel.com/wp-content/uploads/2017/08/Byoum_Lakeside_Hotel_lake_Suite_3-750x450.jpg" alt="">
          <div class="card-body">
            <h4 class="card-title">나연의 나부기 Room</h4>
            <h6 class="card-subtitle mb-2 text-muted">922번 Room</h6>
            <p class="card-text">나연을 닮은 귀여운 느낌의 <br> 나부기 Room입니다.<br> 상큼한 방에서 멋진 바다의<br> 풍경을 만끽하세요.</p>
          </div>
          <div class="card-footer">
            <a href="#">TwiceResort@example.com</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Our Customers -->
    <h2>Our Customers</h2>
    <div class="row">
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="https://assetsmysky.blob.core.windows.net/assetsmysky/production/media-upload/1479880597_twice.jpg" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="https://www.finnsrecclub.com/wp-content/uploads/2017/08/20180401-FRC-Easter-Sunday-41-of-88-500x300.jpg" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="https://www.finnsrecclub.com/wp-content/uploads/2017/08/20170830-gallery-splashwaterpark-39-1-500x300.jpg" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="https://www.finnsrecclub.com/wp-content/uploads/2017/08/20170830-gallery-splashwaterpark-10-1-500x300.jpg" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="https://www.explorewaterlooregion.com/wp-content/uploads/2016/05/bingemans-big-splash-500x300.jpg" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="https://mumsofbrisbane.com.au/wp-content/uploads/2018/04/robelle-domain-discover-ipswich.jpg" alt="">
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

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

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
