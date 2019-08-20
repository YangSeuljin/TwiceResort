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
<title>예약 상세정보 입력</title>

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

	//maxlength 체크
	function maxLengthCheck(object) {
		if (object.value.length > object.maxLength) {
			object.value = object.value.slice(0, object.maxLength);
		}
	}
</script>

<head>
<jsp:include page="Navigation.jsp" flush="false" />

<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<h1 class="mt-4 mb-3">예약하기</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
				돌아가기</a></li>
		<li class="breadcrumb-item active">아래의 정보를 입력해주세요.</li>
	</ol>
</head>
<body>
	<%
		String nowdate;
		CalDate caldate = new CalDate();
		nowdate = caldate.caldate();

		String adddate;
		String mindate;
		adddate = CalDate.addDate(nowdate, 0, 0, -2);
	%>

	<div class="w3-card-4">

		<form name="form" id="form" class="w3-container"
			action="resvformconfirm.jsp" onsubmit="return f(this)">
			<br>
			<p>
				<label class="w3-text-brown"><b>성명</b></label> <input
					class="w3-input w3-border w3-sand" name="name" id="name"
					type="text" placeholder="실제 예약자 성명을 입력해주세요." maxlength="10"
					required>
			</p>
			<p>
				<label class="w3-text-brown"><b>예약일자</b></label> <input
					class="w3-input w3-border w3-sand" type="date" name="date" required
					min="<%=nowdate%>" max="<%=adddate%>">
			</p>
			<p>
				<label class="w3-text-brown"><b>예약방</b></label> <select
					class="w3-text-brown" name="option" id="option">
					<option class="w3-text-brown" value="1">모찌모찌 룸</option>
					<option class="w3-text-brown" value="2">쯔뭉 룸</option>
					<option class="w3-text-brown" value="3">나부기 룸</option>

				</select>
			</p>
			<p>
				<label class="w3-text-brown"><b>주소</b></label> <input type="button"
					onclick="execDaumPostcode()" value="우편번호 찾기"><br> 신
				우편번호 : <input oninput="maxLengthCheck(this) type="
					number" name="zip_code" id="zip_code" placeholder="우편번호"
					maxlength="5" required><br> 구 우편번호 : <input
					type="text" id="old_zip_code" name="old_zip_code"
					placeholder="우편번호" maxlength="7" required><br> 도로명 주소
				: <input type="text" id="roadAddress" name="roadAddress"
					placeholder="도로명주소" size="40" maxlength="40" required><br>
				지번 주소 : <input type="text" id="jibunAddress" name="jibunAddress"
					placeholder="지번주소" size="40" maxlength="40" required><br>
			</p>
			<p>
				<label class="w3-text-brown"><b>전화번호</b></label> <input
					class="w3-input w3-border w3-sand" name="phone_number"
					id="phone_number" type="number" placeholder="- 를 빼고 입력해주세요."
					maxlength="11" oninput="maxLengthCheck(this)" required>
			</p>
			<p>
				<label class="w3-text-brown"><b>입금자명</b></label> <input
					class="w3-input w3-border w3-sand" name="iname" id="iname"
					type="text" placeholder="입금하시는 분의 성명을 입력해주세요." maxlength="10"
					required>
			</p>
			<p>
				<label class="w3-text-brown"><b>남기실 말</b></label> <input
					class="w3-input w3-border w3-sand" name="comment" type="text">
			</p>
			<input type=hidden class="w3-input w3-border w3-sand"
				name="processing" readonly id="option" value=2>
			<p>
				<input type="submit" value="예약하기" onclick="go();">
			</p>
		</form>
	</div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js">
		
	</script>

	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수
							var sido = data.sido;
							var sigungu = data.sigungu;
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}
							var remainRoadAddr = fullRoadAddr.replace(sido
									+ " " + sigungu, "");
							var remainjibunAddr = data.jibunAddress.replace(
									sido + " " + sigungu, "");
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('zip_code').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('old_zip_code').value = data.postcode; //6자리 우편번호 사용
							document.getElementById('roadAddress').value = fullRoadAddr;
							document.getElementById('jibunAddress').value = data.jibunAddress;
							document.getElementById('user_selected_type').value = data.userSelectedType; //검색 결과에서 사용자가 선택한 주소의 타입(R(도로명), J(지번))
							document.getElementById('sido').value = sido;
							document.getElementById('sido2').value = sido;
							document.getElementById('sigungu').value = sigungu;
							document.getElementById('sigungu2').value = sigungu;
							document.getElementById('remain_road_addr').value = remainRoadAddr;
							document.getElementById('remain_jibun_addr').value = remainjibunAddr;
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
		removeEvent();
	</script>
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
</body>
</html>
