<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page
	import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html>

<html>
<title>예약자 정보</title>

<style>

/* a태그에 색깔 및 밑줄 없애기*/

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { text-decoration: none;}


/* button에 마우스를 갖다대면 투명하게 만들기 */
button:hover {
  opacity: 0.8;
}
table {
	border-collapse: collapse;
	width: 50%;
	height: 30px;
}

tr, th, td {
	text-align: center;
	padding: 8px;
	height: 30px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>

<script language="JavaScript">
	window.onload = function() {
		// IE6 이하 버전이나 팝업에서 가능
		window.resizeTo(600, 400);
	}

	function f() {
		var re_name = /^[가-힣]{1,10}$/;
		var name = document.getElementById("name");
		var iname = document.getElementById("iname");
		var phone_number = document.getElementById("phone_number");

		if (form.name.value == "" || form.iname.value == "") { // 이름칸이 비어있을 때
			alert("성명과 입금자명을 모두 입력하세요.");
			form.name.focus();
			return false;
		}

		if (!check(re_name, name, "이름은 10자이내의 한글로 입력하세요")) {
			return false;
		}

		if (!check(re_name, iname, "입금자명은 10자이내의 한글로 입력하세요")) {
			return false;
		}

		else if (form.phone_number.value == "") { // 이름칸이 비어있을 때
			alert("전화번호를 입력하세요.");
			form.phone_number.focus();
			return false;
		}

		if (form.zip_code.value == "") { // 주소가 비었을 때
			alert("주소를 입력하세요.");
			form.addr.focus();
			return false;
		}
		return true;
	}

	function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
	}

	function maxLengthCheck(object) {
		if (object.value.length > object.maxLength) {
			//object.maxLength : 매게변수 오브젝트의 maxlength 속성 값입니다.
			object.value = object.value.slice(0, object.maxLength);
		}
	}
	
</script>

<head>
<jsp:include page="Navigation.jsp" flush="false" />
</head>
<body>
<!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">예약자 상세정보 보기
     
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="newindex.jsp">HOME으로 돌아가기</a>
      </li>
      <li class="breadcrumb-item active">예약자 상세정보입니다.</li>
    </ol>
    
   
	<%
		String resv_date = new String(request.getParameter("resv_date").getBytes("8859_1"), "UTF-8");
		String room = new String(request.getParameter("room").getBytes("8859_1"), "UTF-8");
		int introom = Integer.parseInt(room);
		String roomname = "";
		String firstDate= new String(request.getParameter("resv_date").getBytes("8859_1"), "UTF-8");
		String firstRoom= new String(request.getParameter("room").getBytes("8859_1"), "UTF-8");
		int intFirstRoom = Integer.parseInt(firstRoom);
		
		JoaDao dao = JoaDao.sharedInstance();
		String name = dao.selectname(resv_date, introom);
		String addr = dao.selectaddr(resv_date, introom);
		int telnumber = dao.selecttelnum(resv_date, introom);
		String iname = dao.selectiname(resv_date, introom);
		String comment = dao.selectcomment(resv_date, introom);

		String nowdate;
		CalDate caldate = new CalDate();
		nowdate = caldate.caldate();

		String adddate;
		String mindate;
		adddate = CalDate.addDate(nowdate, 0, 0, -2);
	%>

	<form name="form" id="form" class="w3-container"
		onsubmit="return f(this)">
		<div>

			<p>
				<label class="w3-text-brown"><b>성명</b></label> <input
					class="w3-input w3-border w3-sand" name="name" id="name"
					type="text" value="<%=name%>" required>
			</p>
			<p>
				<label class="w3-text-brown"><b>예약일자</b></label> <input
					class="w3-input w3-border w3-sand" type="date" name="date"
					value="<%=resv_date%>" required min="<%=nowdate%>"
					max="<%=adddate%>">
			</p>
			<p>
				<label class="w3-text-brown"><b>예약방</b></label> <select
					class="w3-text-brown" name="option" id="option">
					<option class="w3-text-brown" value="1">VIP룸</option>
					<option class="w3-text-brown" value="2">일반룸</option>
					<option class="w3-text-brown" value="3">합리적인 룸</option>
				</select>
			</p>
			<p>
			<p>
				<label class="w3-text-brown"><b>주소</b></label> <input type="text"
					id="roadAddress" name="roadAddress" value="<%=addr%>" size="70"
					required><br>
			</p>
			<p>
				<br>

			</p>
			<p>
				<label class="w3-text-brown"><b>전화번호</b></label> 
				<input	class="w3-input w3-border w3-sand" name="phone_number" maxlength="11" id="phone_number" type="number" oninput="maxLengthCheck(this)" value="<%=telnumber%>" required>
			</p>
			<p>
				<label class="w3-text-brown"><b>입금자명</b></label> 
				<input class="w3-input w3-border w3-sand" name="iname" id="iname" type="text" value="<%=iname%>" required>
			</p>
			<p>
				<label class="w3-text-brown"><b>남기실 말</b></label> <input
					class="w3-input w3-border w3-sand" name="comment" id="option"
					value="<%=comment%>" readonly> <input type=hidden
					class="w3-input w3-border w3-sand" name="processing" id="option"
					value="3" readonly>
					<br>
			
				<input type="hidden" name="firstDate"value="<%=firstDate%>">
				<input type="hidden" name="firstRoom"value="<%=intFirstRoom%>">
				<br>
			<input type="submit" value="수정" formaction="d_update.jsp"></input>
				
		</p>
	
	
	</form>
	
	
	<button><a href ="d_delete.jsp?date=<%=firstDate%>&room=<%=intFirstRoom%>">삭제</a></button>
</div>
</div>
	<!-- Footer -->
	<br><br><br>
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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>
