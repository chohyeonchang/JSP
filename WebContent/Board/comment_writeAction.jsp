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
		String post_content = request.getParameter("comment");               // 게시글 댓글 (post_content)에 입력된 내용을 받아옴
		int number = 0;
		int i = 1;
		if (request.getParameter("number") != null) {
			number = Integer.parseInt(request.getParameter("number"));
		}
		Bbs bbs = new Bbs();
	%>

	<%
			if (post_content == null || post_content == "") {        // 댓글 내용이 공백일 경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')"); 
				script.println("history.back()");
				script.println("</script>");

			} else {

				BbsDAO a = new BbsDAO();
				int result = a.comment_write(i,number, id, post_content);     // 게시글 내용 DB에 쓰기
				++i;
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");

				} else {
					response.sendRedirect("view.jsp?id="+id+"&number="+number);
					
				}
			}
	%>
</body>
</html>
