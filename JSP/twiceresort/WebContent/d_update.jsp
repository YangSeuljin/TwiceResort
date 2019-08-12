<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.text.*, java.util.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.JoaDao,dto.JoaDto,caldate.CalDate" %>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="Navigation.jsp" flush="false" />
<meta charset="utf-8">
<%
String name=new String(request.getParameter("name").getBytes("8859_1"),"UTF-8");
String date=new String(request.getParameter("date").getBytes("8859_1"),"UTF-8");
String firstDate=new String(request.getParameter("firstDate").getBytes("8859_1"),"UTF-8");
String room=new String(request.getParameter("option").getBytes("8859_1"),"UTF-8");
String addr=new String(request.getParameter("roadAddress").getBytes("8859_1"),"UTF-8");
String telnum=new String(request.getParameter("phone_number").getBytes("8859_1"),"UTF-8");
String iname=new String(request.getParameter("iname").getBytes("8859_1"),"UTF-8");
String comment=new String(request.getParameter("comment").getBytes("8859_1"),"UTF-8");
String processing=new String(request.getParameter("processing").getBytes("8859_1"),"UTF-8");
String firstRoom=new String(request.getParameter("firstRoom").getBytes("8859_1"),"UTF-8");
int intprocessing = Integer.parseInt(processing); // 진행 상황. 1번 예약 가능 2번 예약 확인중 3번 예약 완료
int introom = Integer.parseInt(room);
int inttelnum = Integer.parseInt(telnum);
int intfirstRoom = Integer.parseInt(firstRoom);

java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String now = sdf.format(new java.util.Date());

%>
<title>정보 수정</title>
</head>
<body>
 <jsp:include page="Navigation.jsp" flush="false" />

<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">예약 정보 수정 완료</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="newindex.jsp">HOME으로
					돌아가기</a></li>
			<li class="breadcrumb-item active">예약 정보가 수정되었습니다.</li>
		</ol>

<table border="1">
  <tr>
  <td>이름</td>
  <td style="font-weight:bold;"><%=name %></td>
  
  </tr>
  <tr>
  <td>예약 날짜</td>
  <td style="font-weight:bold;"><%=date %></td>
 
  </tr>
  <tr>
  <td>방옵션</td>
  <td style="font-weight:bold;"><%=introom %></td>
  </tr>
  
  <tr>
  <td>주소</td>
  <td style="font-weight:bold;"><%=addr %></td>
  </tr>
  <tr>
  <td>전화번호</td>
  <td style="font-weight:bold;"><%=inttelnum%></td>
  </tr>
  <tr>
  <td>입금자명</td>
  <td style="font-weight:bold;"><%=iname%></td>
  </tr>
  <tr>
  <td>수정일자</td>
  <td style="font-weight:bold;"><%=now%></td>
  </tr>
</table>
<br><br>
<input type=button style="WIDTH: 200pt; HEIGHT: 30pt" value="홈으로 가기" Onclick="location.href='newindex.jsp'">
<input type=button style="WIDTH: 200pt; HEIGHT: 30pt" value="예약 조회 화면으로 가기" Onclick="location.href='resv.jsp'">
<%

// out.println(name);
// out.println(date);
// out.println(introom);
// out.println(addr);
// out.println(inttelnum);
// out.println(iname);
// out.println(comment);
// out.println(now);
// out.println(intprocessing);


//업데이트를 한다.
JoaDao dao = JoaDao.sharedInstance();
JoaDto dto = new JoaDto(); //dto 객체를 생성

dto.setName(name); //dto객체에 name 입력.
dto.setDate(date); //dto객체에 date 입력.
dto.setRoom(introom); //dto객체에 introom 입력.
dto.setAddr(addr); //dto객체에 addr 입력.
dto.setTelnum(inttelnum); //dto객체에 inttelnum 입력.
dto.setIn_name(iname); //dto객체에 iname 입력.
dto.setComment(comment); //dto객체에 comment 입력.
dto.setWrite_date(now); //dto객체에 now 입력.
dto.setProcessing(intprocessing); //dto객체에 intprocessing 입력.
dto.setfirstDate(firstDate);
dto.setfirstRoom(intfirstRoom);

boolean r = dao.update(dto);

if(r){
	out.println("삽입에 성공했습니다.");
}else{
	out.println("삽입에 실패했습니다.");
}

%>
</div>
<br><br><br><br>
<!-- Footer -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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

</body>
	<!-- Bootstrap core JavaScript -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>