<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Chatting</title>
</head>
<body>

   	<table border="1" class="table table-striped" style="text-align:center; border:1px solid #dddddd">
      <tr>
         <td width="100">아이디</td>
         <td width="100">채팅</td>
      </tr>
      <%
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         String str = "";
         String sql = "";
         String id = "";
         try {
            String dburl = "jdbc:mysql://localhost:3306/boarddb";
            String dbid = "root";
            String dbpw = "939496";

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dburl, dbid, dbpw);

            sql = "select * from users";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            String getID = request.getParameter("id");

            while (rs.next()) {
               id = rs.getString("id");
               if (getID.equals(id) == false) {
      %>
      <tr>
         <td width="100"><%=id%></td>
         <td width="100"><a href="Chatting.jsp?myID=<%=getID %>&friendID=<%=id %>" target="_blank" >들어가기</a></td>
      </tr>
      <%
         }
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            if (rs != null) {
               try {
                  rs.close();
               } catch (SQLException sqle) {
               }
            }
            if (pstmt != null) {
               try {
                  pstmt.close();
               } catch (SQLException sqle) {
               }
            }
            if (conn != null) {
               try {
                  conn.close();
               } catch (SQLException sqle) {
               }
            }
         }
      %>
   </table>

</body>
</html>