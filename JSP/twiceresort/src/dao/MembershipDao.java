package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.JoaDto;
import dto.MembershipDto;

public class MembershipDao {
	
	public MembershipDao() {

	}

	private static MembershipDao obj;

	public static MembershipDao sharedInstance() {
		if(obj == null) {
			obj = new MembershipDao();
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
	
	
	public boolean Insert(MembershipDto MembershipDto) {
		boolean result = false;

		if(this.connect()) {
			try {
				
				//값이 삽입되어야 하는 자리에는 물음표
				String sql = "INSERT INTO membership VALUES(?,?,?,?,?,?,?);"; //모든 컬럼에 값을 넣으므로 컬럼명을 모두 생략
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, MembershipDto.getId());
				pstmt.setString(2, MembershipDto.getPassword());
				pstmt.setString(3, MembershipDto.getName());
				pstmt.setString(4, MembershipDto.getEmail());
				pstmt.setString(5, MembershipDto.getPhone());
				pstmt.setString(6, MembershipDto.geteAgree());
				pstmt.setString(7, MembershipDto.getSmsagree());
			

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
		
		public String selectid(String id) throws SQLException{
			//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
			String selectid = null;
			//수행할 sql문장을 생성.
			if(connect()) {
			}
			try {

				//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

				String sql = "SELECT id FROM membership where id=?;";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					selectid=rs.getString(1);
				}
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e){System.out.println(e);}  
			return selectid;  
			//resv라는 테이블의 select문 실행
		}
		
		public String selectpassword(String id) throws SQLException{
			//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
			String selectPassword = null;
			//수행할 sql문장을 생성.
			if(connect()) {
			}
			try {

				//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

				String sql = "SELECT password FROM membership where id=?;";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					selectPassword=rs.getString(1);
				}
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e){System.out.println(e);}  
			return selectPassword;  
			//resv라는 테이블의 select문 실행
		}
		
		public int confirmId(String id) throws SQLException{
			//데이터를 저장할 변수 생성. 여기서 객체 생성을 안하는 이유는 접속이 되었을 때만 객체 생성을 해야 의미가 있기 때문에
			int x=-1;
			//수행할 sql문장을 생성.
			if(connect()) {
			}
			try {

				//DTO 클래스의 변수에 값을 세팅하기 위해 Set 메서드를 이용하고, Select의 결과를 컬럼 단위로 읽어오기 위해서 'get변수타입(컬럼명)' aptjemfmf dldyd

				String sql = "SELECT id FROM membership where id=?;";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					x=1; //해당 아이디가 있다면
				}
				else
					x=-1; //해당 아이디가 없다면
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e){System.out.println(e);}  
			  
			//resv라는 테이블의 select문 실행
		
			return x;
		}
		
		
		
		
		
		
}
		
	


