<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>파일 업로드</title>
</head>
<%
	String id = request.getParameter("id");
%>

<body>
	<form action="fileUploadAction.jsp?id=<%=id%>" method="post"
		enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<td colspan="2">파일 업로드 폼</td>
			</tr>
			<tr>
				<td>올린 사람:</td>
				<td><input type="text" name="name" value=<%=id%>></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>파일명1:</td>
				<td><input type="file" name="fileName1"></td>
			</tr>
			<tr>
				<td>파일명2:</td>
				<td><input type="file" name="fileName2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="전송"></td>
			</tr>

		</table>
	</form>
</body>
</html>