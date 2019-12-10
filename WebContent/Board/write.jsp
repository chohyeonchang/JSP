<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>1랩 게시판</title>
</head>
<body>
	<% 
		String id=request.getParameter("id");

	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">1랩실 게시판</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main_board.jsp?id=<%=id %>">게시판</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">

		<div class="row">

			<form method="post" action="writeAction.jsp?id=<%=id%>">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판

								글쓰기</th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td><input type="text" class="form-control"
								placeholder="글 제목" name="Title" maxlength="50" /></td>

						</tr>

						<tr>

							<td><textarea class="form-control" placeholder="글 내용"
									name="Content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-info pull-right" value="글쓰기" />
			</form>



			<form method="post" action="main_board.jsp?id=<%=id%>">
				<input type="submit" class="btn btn-danger pull-right" value="취소" />
			</form>

			<form method="post" action="fileUploadForm.jsp?id=<%=id%>">
				<input type="submit" class="btn btn-warning pull-right"
					value="파일 업로드" />
			</form>

		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>




