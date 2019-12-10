package bbs;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class FileDAO {

	private Connection conn;
	
	public FileDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/jspboarddb?characterEncoding=utf8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(String name, String subject, String filename1, String filename2) {
		String SQL = "INSERT INTO file(id, subject, filename1, filename2) VALUES(?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, subject);
			pstmt.setString(3, filename1);
			pstmt.setString(4, filename2);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
