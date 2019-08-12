package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.JoaDto;

public class MembershipDao {
	
	public MembershipDao() {

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

}
