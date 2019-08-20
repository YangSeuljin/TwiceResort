package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.JoaDto;

import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.sql.SQLException;
import java.sql.Statement;



public class JoaDao {

	public JoaDao() {

	}

	private static JoaDao obj;

	public static JoaDao sharedInstance() {
		if(obj == null) {
			obj = new JoaDao();
		}
		System.out.println(obj);
		return obj;
	}

	//데이터 베이스 연동에 필요한 변수들을 선언
	//private Connection con;

	//SQl 실행에 필요한 변수
	//private Statement stmt; 

	//select 구문을 수행했을 때 결과를 저장할 변수
	private ResultSet rs;
	Connection conn;
	private boolean connect(){  
		boolean result = false;
		try{
			Class.forName("com.mysql.jdbc.Driver");  
			conn =  DriverManager.getConnection("jdbc:mysql://192.168.23.102:3306/kopo?useUnicode=true&characterEncoding=utf-8&useSSL=false&amp;autoReconnection=true", "root", "password" );  
			result = true;
		}catch(Exception e){
			System.out.println("연결 실패 :" + e.getMessage());}  
		System.out.println(result);
		return result;

	}

	//데이터 베이스 연결을 해제하는 메서드
	//	private void close() {
	//		try {
	//			if(rs !=null)
	//				rs.close();
	//		
	//		if(stmt!=null)
	//			stmt.close();
	//	
	//	if(con!=null)
	//		con.close();
	//}catch(Exception e) {
	//System.out.println("해제 실패 :" + e.getMessage());
	//}
	//}
	//JoaDto는 DTO클래스를 의미한다.
	
	public List<JoaDto> getList(){
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		List<JoaDto> list = null;
		//수행할 sql문장을 생성.
		String sql = "SELECT * FROM resv;"; //resv라는 테이블의 select문 실행
		if(connect()) {
			//연결이 성공했을 때 작업
			try {
				//Connection 객체에 연결된 Statement 객체를 생성하여 Statement 변수에 대입
				Statement stmt = conn.createStatement();
				if(stmt!=null) {
					rs= stmt.executeQuery(sql);
				}
				//데이터를 저장할 리스트를 생성
				//구문 실행에 성공했을 때 객체를 생성하게 해서 리턴하는 값이 null이면 데이터베이스 작업에 실패한 것이고, size()가 0이면 데이터가 없다는 것을 구분하기 위하여
				list = new ArrayList<JoaDto>();

				//데이터를 읽어서 list에 저장
				while(rs.next()) {
					//DTO 클래스의 객체 생성.(모든 데이터가 DTO클래스에 들어있으므로)
					JoaDto inform = new JoaDto();

					//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd
					inform.setName(rs.getString("name"));
					inform.setDate(rs.getString("date"));
					inform.setRoom(rs.getInt("room"));
					inform.setAddr(rs.getString("addr"));
					inform.setTelnum(rs.getInt("telnum"));
					inform.setIn_name(rs.getString("in_name"));
					inform.setComment(rs.getString("comment"));
					inform.setWrite_date(rs.getString("write_date"));
					inform.setProcessing(rs.getInt("processing"));
					list.add(inform);
				}

			}catch(SQLException e) {
				e.printStackTrace();
			}
		}else {
			//연결에 실패했을 때 작업
			System.out.println("데이터베이스 연결에 실패했습니다.");
			System.exit(0);

		}
		return list;
	}
	
	public boolean Insertresv(JoaDto joadto) {
		boolean result = false;

		if(this.connect()) {
			try {
				//값이 삽입되어야 하는 자리에는 물음표
				String sql = "INSERT INTO resv VALUES(?,?,?,?,?,?,?,?,?);"; //모든 컬럼에 값을 넣으므로 컬럼명을 모두 생략
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, joadto.getName());
				pstmt.setString(2, joadto.getDate());
				pstmt.setInt(3, joadto.getRoom());
				pstmt.setString(4, joadto.getAddr());
				pstmt.setInt(5, joadto.getTelnum());
				pstmt.setString(6, joadto.getIn_name());
				pstmt.setString(7, joadto.getComment());
				pstmt.setString(8, joadto.getWrite_date());
				pstmt.setInt(9, joadto.getProcessing());

				int r= pstmt.executeUpdate();

				if(r>0) {
					result = true;
				}
				//데이터베이스 생성 객체 해제
				pstmt.close();

			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}else {
			System.out.println("데이터베이스 연결에 실패");
			System.exit(0);
		}
		return result;
	}


	public List<JoaDto> selectone(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		List<JoaDto> list = new <JoaDto>ArrayList();
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT * FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();

			while(rs.next()){  //다음 레코드가 있으면 true
				JoaDto joadto = new JoaDto();
				joadto.setName(rs.getString("name"));
				joadto.setDate(rs.getString("date"));
				joadto.setRoom(rs.getInt("room"));
				joadto.setAddr(rs.getString("addr"));
				joadto.setTelnum(rs.getInt("telnum"));
				joadto.setIn_name(rs.getString("in_name"));
				joadto.setComment(rs.getString("comment"));
				joadto.setWrite_date(rs.getString("write_date"));
				joadto.setProcessing(rs.getInt("processing"));

				list.add(joadto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return list;  
		//resv라는 테이블의 select문 실행
	}

	public String selectname(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		String selectname = null;
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT name FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				selectname=rs.getString(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return selectname;  
		//resv라는 테이블의 select문 실행
	}




	public String selectdate(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		String selectdate = null;
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT date FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				selectdate=rs.getString(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return selectdate;  
		//resv라는 테이블의 select문 실행
	}

	public int selectroom(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		int selectroom = 0;
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT room FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				selectroom=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return selectroom;  
		//resv라는 테이블의 select문 실행
	}

	public String selectaddr(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		String selectaddr = null;
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT addr FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				selectaddr=rs.getString(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return selectaddr;  
		//resv라는 테이블의 select문 실행
	}

	public int selecttelnum(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		int selecttelnum = 0;
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT telnum FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				selecttelnum=rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return selecttelnum;  
		//resv라는 테이블의 select문 실행
	}

	public String selectiname(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		String selectiname = null;
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT in_name FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				selectiname=rs.getString(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return selectiname;  
		//resv라는 테이블의 select문 실행
	}

	public String selectcomment(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		String selectcomment = null;
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT comment FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				selectcomment=rs.getString(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return selectcomment;  
		//resv라는 테이블의 select문 실행
	}

	public String selectwritedate(String date,int room) throws SQLException{
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		String selectwritedate = null;
		//수행할 sql문장을 생성.
		if(connect()) {
		}
		try {

			//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

			String sql = "SELECT write_date FROM resv where date=? and room=?;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, room);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				selectwritedate=rs.getString(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){System.out.println(e);}  
		return selectwritedate;  
		//resv라는 테이블의 select문 실행
	}

	public boolean update(JoaDto joadto) {
		boolean result = false;
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		String selectname = null;
		//수행할 sql문장을 생성.
		if(this.connect()) { 

			try {

				//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

				String sql = "update resv set name=?,date=?,room=?,addr=?,telnum=?,in_name=?,comment=?,write_date=? where date=? and room=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, joadto.getName());
				pstmt.setString(2, joadto.getDate());
				pstmt.setInt(3, joadto.getRoom());
				pstmt.setString(4, joadto.getAddr());
				pstmt.setInt(5, joadto.getTelnum());
				pstmt.setString(6, joadto.getIn_name());
				pstmt.setString(7, joadto.getComment());
				pstmt.setString(8, joadto.getWrite_date());
				pstmt.setString(9, joadto.getfirstDate());
				pstmt.setInt(10, joadto.getfirstRoom());

				int r= pstmt.executeUpdate();

				if(r>0) {
					result = true;
				}
				//데이터베이스 생성 객체 해제
				pstmt.close();

			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}else {
			System.out.println("데이터베이스 연결에 실패");
			System.exit(0);
		}
		return result;
	}


	public boolean delete(JoaDto joadto) {
		boolean result = false;
		//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
		String selectname = null;
		//수행할 sql문장을 생성.
		if(this.connect()) { 

			try {

				//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

				String sql = "delete from resv where date=? and room=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, joadto.getDate());
				pstmt.setInt(2, joadto.getRoom());

				int r= pstmt.executeUpdate();

				if(r>0) {
					result = true;
				}
				//데이터베이스 생성 객체 해제
				pstmt.close();

			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}else {
			System.out.println("데이터베이스 연결에 실패");
			System.exit(0);
		}
		return result;
	}



	/*	public static int save(Exam u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"insert into examtable(name,studentid,kor,eng,mat) values(?,?,?,?,?)");  
	        ps.setString(1,u.getName());  
	        ps.setInt(2,u.getStudentid());  
	        ps.setInt(3,u.getKor());  
	        ps.setInt(4,u.getEng());  
	        ps.setInt(5,u.getMat());  
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;
	}  

	public static int update(Exam u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"update examtable set name=?,studentid=?,kor=?,eng=?,math=? where studentid=?");  
	        ps.setString(1,u.getName());  
	        ps.setInt(2,u.getStudentid());  
	        ps.setInt(3,u.getKor());  
	        ps.setInt(4,u.getEng());  
	        ps.setInt(5,u.getMat());
	        ps.setInt(6,u.getStudentid());
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}

	public static int delete(Exam u){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from examtable where studentid=?");  
	        ps.setInt(1,u.getStudentid());  
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  

	    return status;  
	}

	public static List<Exam> getAllRecords(){  
	    List<Exam> list=new ArrayList<Exam>();  

	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from examtable");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	Exam u= new Exam();  
	            u.setName(rs.getString("name"));  
	            u.setStudentid(rs.getInt("studentid"));  
	            u.setKor(rs.getInt("kor"));  
	            u.setEng(rs.getInt("eng"));  
	            u.setMat(rs.getInt("mat"));    
	            list.add(u);  
	        }  
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  

	public static Exam getRecordById(int id){  
		Exam u= new Exam();  
	    try{
	        Connection con=getConnection();  //db접속을 위한 커넥션이 접속됨.
	        PreparedStatement ps=con.prepareStatement("select * from examtable where studentid=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){ //다음 레코드가 있으면 true
	        	u.setName(rs.getString("name"));  
	            u.setStudentid(rs.getInt("studentid"));  
	            u.setKor(rs.getInt("kor"));  
	            u.setEng(rs.getInt("eng"));  
	            u.setMat(rs.getInt("mat"));  
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return u;  
	}  */
}
