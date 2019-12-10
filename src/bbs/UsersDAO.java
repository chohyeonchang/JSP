package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsersDAO {
	public String _id;
	private Connection conn;
	private ResultSet rs;
	   PreparedStatement pstmt = null;
	   String str = "";
	   String sql = "";
	   boolean key=false;
	   String db_id ="";
	   String db_password="";
	
	public UsersDAO(){    // 생성자로 DB연결
		try {

			String dbURL = "jdbc:mysql://localhost:3306/jspboarddb?characterEncoding=utf8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public int join(String id, String password) {       // 회원가입 함수
		try {
			  sql="select * from users";
		      pstmt=conn.prepareStatement(sql);
		      rs=pstmt.executeQuery();
		      while (rs.next() == true) {
		         db_id=rs.getString("id");              // Users 테이블에서 id와 password를 받아옴
		         db_password=rs.getString("password");
		         if(id.equals(db_id)){                 // Users 테이블에 있는 id중 하나와 같으면 로그인
		        	 key=true;
		         }
		      }
		      if(key==true){
		    	  // 이미 아이디 존재 하는 경우
		    	  return -1;
		      }

		}
		 catch (Exception e) {
			e.printStackTrace();
		}
		sql = "INSERT INTO users VALUES(?, ?)";       // 새로 받은 id와 password를 Users 테이블에 Insert 
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}	      
		return 1;
	}
}
