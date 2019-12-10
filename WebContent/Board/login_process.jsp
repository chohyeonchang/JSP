<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter" %>
<%

   request.setCharacterEncoding("utf-8");
   String getId = request.getParameter("id");
   String getPw = request.getParameter("passwd");             // login 폼에서 id와 pw를 받아옴
   String db_Id = null;
   String db_Pw = null;
   BbsDAO bbsDAO = new BbsDAO();
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String str = "";
   String sql = "";
   boolean key=false;
   try {
      String dburl = "jdbc:mysql://localhost:3306/jspboarddb?characterEncoding=utf8&serverTimezone=UTC";
      String dbid = "root";
      String dbpw = "1234";

      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(dburl, dbid, dbpw);

      sql="select * from users";
      pstmt=conn.prepareStatement(sql);
      rs=pstmt.executeQuery(); // db 연결
      while (rs.next() == true) {
         db_Id=rs.getString("id");
         db_Pw=rs.getString("password");   // users 테이블에서 id와 pw를 가져옴
         if(getId.equals(db_Id)&&getPw.equals(db_Pw)){   // login폼에서 입력한 id와 pw가 user 테이블에 있는 id와 pw와 같으면 key값  true 
        	 key=true;
         }
      }
      if(key==true){
    	  	bbsDAO.setid(getId); // true면 받아온 id를 bbs의 id로 set
   	   		response.sendRedirect("main_board.jsp?id="+getId);
      }
      else{
    	    PrintWriter script = response.getWriter();              // PrintWriter 객체가 필요
			script.println("<script>");
			script.println("alert('아이디와 비밀번호를 다시 확인하세요.')");  // 자바스크립트에서 화면에 알림을 띄울 때 사용
			script.println("history.back()");                       // 이전 화면으로
			script.println("</script>");
      }
   } catch (Exception e) {
      e.printStackTrace();

   }
   
   
%>