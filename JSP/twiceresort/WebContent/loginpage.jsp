<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate,option.Option"%>

<!DOCTYPE html>
<html>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="Navigation.jsp" flush="false" />
	<br>
	<!-- Page Content -->
	<div class="container">


		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">관리자 로그인하기</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">관리자 로그인</li>
		</ol>
	</div>
	<%
		if (session.getAttribute("userid") == null) {
	%>
	<%
		String userid = (String) session.getAttribute("userid");
	%>

	<form action="loginconfirm.jsp">
		<div class="container">
			<label for="uname"><b>아이디</b></label> <input type="text"
				placeholder="아이디를 입력해주세요." name="uname" required> <label
				for="psw"><b>비밀번호</b></label> <input type="password"
				placeholder="비밀번호를 입력해주세요." name="psw" required> <br> <label><b></b></label>
			<label><b></b></label>
			<button type="submit">관리자 모드로 로그인 하기</button>

		</div>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button" class="cancelbtn"
				onclick="location.href='membership.jsp'">관리자 회원 가입하기</button>
			<span class="psw"><a href="#">비밀번호를 잊어버리셨습니까?</a></span>
		</div>
	</form>
	</div>
	<%
		} else {
	%>
	<%
		String userid = (String) session.getAttribute("userid");
	%>
	<div class="container">
		<label for="uname"><b>아이디</b></label> <input type="text"
			placeholder="아이디를 입력해주세요." name="uname"
			value="<%=userid%>님 관리자 모드로 로그인 중입니다." readonly> <label
			for="psw"><b>비밀번호</b></label> <input type="password"
			placeholder="비밀번호를 입력해주세요." name="psw" value="**********" readonly>
		<br> <label><b></b></label> <label><b></b></label>
		<button onclick="location.href='managerpage.jsp'">관리자 페이지로 가기</button>

	</div>
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
	<%
		}
	%>



	<!-- Footer -->
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
