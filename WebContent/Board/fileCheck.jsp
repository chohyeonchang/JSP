<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="bbs.FileDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";
	request.setCharacterEncoding("utf-8");
	name = request.getParameter("name");
	subject = request.getParameter("subject");
	filename1 = request.getParameter("filename1");
	filename2 = request.getParameter("filename2");
	
	if("null".equals(filename1))  // null값 공백(" ")으로 대치
		filename1 = " ";
	if("null".equals(filename2))
		filename2 = " ";

%>
<body>
	<h3>업로드 파일 확인</h3>
	올린사람 :<%=name%><br /> 제목 :<%=subject%><br /> 파일명1 : <%=filename1%>
	<br /> 파일명2 : <%=filename2%>
	<br />
	<form method="post" action="main_board.jsp?id=<%=name%>">
		<input type="submit" value="메인으로" />
	</form>

	<%
		FileDAO fd = new FileDAO();
		BbsDAO a = new BbsDAO(); 
		
		int result = fd.upload(name, subject, filename1, filename2);
		if (result == -1) {
			PrintWriter script = response.getWriter();          
			script.println("<script>");
			script.println("alert('파일 업로드 실패')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			a.write(subject, name, filename1+"\n"+filename2);
		}
	%>
</body>