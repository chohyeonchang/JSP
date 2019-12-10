<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.UsersDAO" %> 
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1렙 게시판</title>
</head>
<body>

	<%
	   request.setCharacterEncoding("utf-8");
	   String getnewId = request.getParameter("userID");            // 회원가입 폼(userID,userPassword)에서 입력한 id와 pw를 받음
	   String getnewPw = request.getParameter("userPassword");

		if (getnewId == null || getnewPw == null || getnewId == "" || getnewPw == ""){     
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");    // 내용이 하나라도 공백일 경우 
				script.println("history.back()");
				script.println("</script>");
			} 
		else{
				
			UsersDAO userDAO = new UsersDAO();
			int result = userDAO.join(getnewId,getnewPw);            // Users 테이블에 새로운 id와 pw 추가
				
			if(result == -1){ 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");     // Users 테이블에 같은 id가 있을 경우 
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 가입이 완료되었습니다.')");
				script.println("history.go(-2)");
				script.println("</script>");
				
	
				}

			}

			%>
</body>
</body>
</html>
