<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
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
		String id=request.getParameter("id");                     
		int number = 0;
		if(request.getParameter("number") != null){
			number = Integer.parseInt(request.getParameter("number"));
		}
		Bbs bbs = new BbsDAO().getnumber(number);                  // Bbs의 number 셋팅

		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(number);                        // 게시글 DB에서 삭제
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
				bbsDAO.delete_comment(number);                     // number게시글이 삭제되면 그 number의 댓글도 같이 삭제 
				bbsDAO.update_comment(number);                     // 삭제 후 댓글 pagenumber 업데이트
				bbsDAO.rewrite_number();                           // 게시글 번호 재배열
				response.sendRedirect("main_board.jsp?id="+id);
			}
	%>
</body>
</html>
