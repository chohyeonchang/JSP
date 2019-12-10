package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BbsDAO {
		public String _id;
		private Connection conn;
		private ResultSet rs;
		
		public BbsDAO() {  // 생성자로 DB 연결
			try {
								// URL 이렇게 안하면 한글깨짐
				String dbURL = "jdbc:mysql://localhost:3306/jspboarddb?characterEncoding=utf8&serverTimezone=UTC";
				String dbID = "root";
				String dbPassword = "1234";
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
				
			public int getNext() { // number를 오름차순으로 불러오는 함수
				String SQL = "SELECT number FROM posts ORDER BY number DESC";

				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						return rs.getInt(1) + 1;
					}

					return 1;

				} catch (Exception e) {
					e.printStackTrace();
				}

				return -1; 

			}

			public int write(String Title, String userID, String Content) {  // post 테이블에 Insert 하는 함수
				long time = System.currentTimeMillis(); 
				SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String current_time = dayTime.format(new Date(time));  // 현재 시간을 형식에 맞게 변환
				String SQL = "INSERT INTO posts VALUES(?, ?, ?, ?, ?, ?)";
				try {
					
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, getNext());
					pstmt.setString(2, Title);
					pstmt.setString(3, userID);
					pstmt.setString(4, current_time);
					pstmt.setString(5, Content);
					pstmt.setInt(6,1);
					return pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();

				}
				return -1; 

			}
			
			public int rewrite_number() { //  post테이블의 number를 재 배열하는 함수  
				String SQL1 = "SELECT @number := 0";
				String SQL2 = " UPDATE posts SET number=@number := @number+1 ORDER BY number"; // 게시글 삭제 시 number 재배열 
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL1);   
					rs = pstmt.executeQuery();
					PreparedStatement pstmt2 = conn.prepareStatement(SQL2);   
					pstmt2.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; 
			}				
			
			public ArrayList<Bbs>getList(int pageNumber){ // DB에 있는 data 불러와서 List에 넣어주는 함수 ( 10개 )
				String SQL = "SELECT * FROM posts WHERE number < ? AND plag = 1 ORDER BY number DESC LIMIT 10";
				ArrayList<Bbs>list = new ArrayList<Bbs>();
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Bbs bbs = new Bbs();
						bbs.setnumber(rs.getInt(1));
						bbs.setTitle(rs.getString(2));
						bbs.setUserID(rs.getString(3));
						bbs.setDate(rs.getString(4));
						bbs.setContent(rs.getString(5));
						bbs.setplag(rs.getInt(6));
						list.add(bbs);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return list; 
			}
			
			public boolean nextPage (int pageNumber) { // 페이지 넘기고 DB 데이터 불러오는 함수 ( 10 개 )
				String SQL = "SELECT * FROM posts WHERE number < ? AND plag = 1 ORDER BY number DESC LIMIT 10";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						return true;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return false; 		
			}
			
			public Bbs getnumber(int number) {           // posts 테이블에서 해당 number의 내용을 모두 불러오는 함수 
				String SQL = "SELECT * FROM posts WHERE number = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, number);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						Bbs bbs = new Bbs();
						bbs.setnumber(rs.getInt(1));       //bbs에 선언되어있는 number,Title, UserID, Date, Content, plag를 모두 set
						bbs.setTitle(rs.getString(2));
						bbs.setUserID(rs.getString(3));
						bbs.setDate(rs.getString(4));
						bbs.setContent(rs.getString(5));
						bbs.setplag(rs.getInt(6));
						return bbs;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;
			}
			public void setid(String id) {
				_id = id;
			}
		
			public int update(int number, String Title, String Content) {       // 게시글 수정 함수
				String SQL = "UPDATE posts SET Title = ?, Content = ? WHERE number = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, Title);
					pstmt.setString(2, Content);
					pstmt.setInt(3, number);
					return pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; 
			}
			
			public int delete(int ID) {  // 게시글 삭제 함수
				String SQL = "DELETE FROM posts WHERE number = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);   
					pstmt.setInt(1, ID);
					return pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; 
			}
			
			public int getNext2() { // comment테이블의 number를 다음 번호로 넘기는 함수
				String SQL = "SELECT number FROM comment ORDER BY number DESC";

				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						return rs.getInt(1) + 1;
					}

					return 1;

				} catch (Exception e) {
					e.printStackTrace();
				}

				return -1; 

			}
			public int comment_write(int number, int pagenumber, String id, String content) {  // comment 테이블에 댓글 쓰는 함수
				String SQL = "INSERT INTO comment VALUES(?, ?, ?, ?) ";        
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1,getNext2());
					pstmt.setInt(2, pagenumber);
					pstmt.setString(3, id);
					pstmt.setString(4, content);
					return pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; 
			}
			
			public ArrayList<Bbs> show_comment(int number) {                  // comment 테이블에서 해당 pagenumber의 내용을 불러와 list2에 저장하는 함수
				String SQL = "SELECT * FROM comment WHERE pagenumber = ?";
				ArrayList<Bbs> list2 = new ArrayList<Bbs>();
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, number);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						Bbs bbs = new Bbs();
						bbs.setPost_id(rs.getString(3)); 
						bbs.setPost_content(rs.getString(4));
						list2.add(bbs); // list2에 불러온 id와 content를 저장
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return list2; 
			}	
			
			public int delete_comment(int number) {              // comment 테이블에서 해당 number의 내용 모두 삭제하는 함수
				
				String SQL = "DELETE FROM comment WHERE pagenumber = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1,number); // number번째 댓글들 모두 삭제
					pstmt.executeUpdate();
				}
				catch (Exception e) {
					e.printStackTrace();
					}
				return -1;	
			}
			
			public int update_comment(int number) {   // comment테이블의 pagenumber가 현재 pagenumber보다 크면 1씩 줄이고 작으면 그대로 ( 댓글과 게시글 번호를 일치시키기 위해)
				String SQL = "UPDATE comment SET pagenumber = pagenumber-1 WHERE pagenumber > ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, number);
					pstmt.executeUpdate();
					
				}
				catch (Exception e) {
					e.printStackTrace();
					}
				return -1;	
			}
						
}