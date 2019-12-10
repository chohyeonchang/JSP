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
	
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String Title2=request.getParameter("Title2");              // 수정(update) 폼에서의 제목 (Title2) 과 내용(Content2)를 받아옴
		String Content2=request.getParameter("Content2");
		
		int number = 0;
		if (request.getParameter("number") != null) {             
			number = Integer.parseInt(request.getParameter("number"));
		}
		Bbs bbs = new BbsDAO().getnumber(number);
		
		if (Title2 == null || Content2 == null || Title2.equals("") || Content2.equals("") ) {
			PrintWriter script = response.getWriter();          
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");          // 제목과 내용중에 하나라도 입력이 안됬을 경우 
			script.println("history.back()");
			script.println("</script>");
			}
		else {
				BbsDAO BbsDAO = new BbsDAO();
				int result = BbsDAO.update(number, Title2, Content2);// posts 테이블에서 해당 number의 제목과 내용을 update 

				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					response.sendRedirect("main_board.jsp?id="+id);
					
				}
			}

	%>
</body>
</html>
