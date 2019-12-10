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
		bbsDAO.delete_comment(number);                        // 해당 number 에 있는 댓글 모두 삭제
		response.sendRedirect("view.jsp?id="+id+"&number="+number);  
	%>
</body>
</html>