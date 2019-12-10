<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
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
		String id = request.getParameter("id");
		int number = 0;
		if (request.getParameter("number") != null) {
			number = Integer.parseInt(request.getParameter("number"));
		}
		Bbs bbs = new BbsDAO().getnumber(number);
%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="collapse navbar-collapse"

			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="welcome.jsp?id=<%=id %>">메인</a></li>
				<li class="active"><a href="main_board.jsp?id=<%=id %>">게시판</a></li>

			</ul>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=id%>님<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="chatting.jsp">채팅하기(성은이꺼랑 연결)</a></li>
						<li><a href="login.jsp">로그아웃</a></li>

					</ul>

				</li>

			</ul>

		</div>

	</nav>
	<div class="container">

		<div class="row">

			<form method="post" action="updateAction.jsp?number=<%= number %>&id=<%=id%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">글 수정 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="Title2" maxlength="50" value="<%= bbs.getTitle() %>" ></td>
						</tr>

						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="Content2" maxlength="2048" style="height: 350px;" ><%= bbs.getContent() %></textarea></td>
						</tr>
					</tbody>
				</table>	
				
				<button type="submit" class="btn btn-info pull-right" >글수정</button>
			</form>
			
			<form method="post" action="main_board.jsp?id=<%=id%>">
				<input type="submit" class="btn btn-danger" value="취소" />
			</form>
		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
