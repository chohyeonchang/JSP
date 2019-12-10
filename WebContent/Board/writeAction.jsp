<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1랩 게시판</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String Title=request.getParameter("Title");           // 글쓰기 폼(wirte.jsp) 에서  제목(Title)과 내용(Content)를 가져옴
		String Content=request.getParameter("Content");
		Bbs bbs = new Bbs();
	%>

	<%
			if (Title == null || Content == null || Title =="" || Content =="") {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')"); // 제목이나 내용 둘중에 하나라도 입력이 안된 경우
				script.println("history.back()");
				script.println("</script>");

			} else {

				BbsDAO a = new BbsDAO(); 
				int result = a.write(Title,id, Content);        // posts 테이블에 제목, 아이디, 내용을 Insert

				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");

				} else {
					response.sendRedirect("main_board.jsp?id="+id);
				
				}
			}
	%>
</body>
</html>
