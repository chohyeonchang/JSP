<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.util.ArrayList"%>
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
				<li class="active"><a href="main_board.jsp?id=<%=id%>">게시판</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=id%>님<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="chatting.jsp">채팅하기(성은이꺼랑 연결)</a></li>
						<li><a href="login.jsp">로그아웃</a></li>
					</ul></li>

			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">글 보기
						</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=bbs.getTitle()%></td>
					</tr>

					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID()%></td>
					</tr>

					<tr>
						<td>작성일</td>
						<td colspan="2"><%=bbs.getDate().substring(0, 11) + bbs.getDate().substring(11, 13) + "시"
					+ bbs.getDate().substring(14, 16) + "분"%></td>
					</tr>

					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: center;"><pre><%=bbs.getContent()%></pre></td>
					</tr>

				</tbody>

			</table>

			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">댓글</th>
				</thead>
				
				<tbody>

					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list2 = bbsDAO.show_comment(number); // comment 테이블에서 해당 number의 댓글을 List에 불러와 저장
						for (int i = 0; i < list2.size(); i++) { // commet 테이블에서 해당 number에 들어있는 댓글의 갯수만큼 출력
					%>
					<tr>
						<td><%=list2.get(i).getPost_id()%></td>            <!-- comment 테이블의 첫번째 열 (id) -->
						<td><%=list2.get(i).getPost_content()%></td>       <!-- comment 테이블의 두번째 열 (content) -->
						<%
							}
						%>
				</tbody>
			</table>
			
			<form method="post"
				action="comment_writeAction.jsp?id=<%=id%>&number=<%=number%>">
				<textarea placeholder="댓글을 입력하세요" class="form-control col-sm-5"
					name="comment" cols="50" rows="4"></textarea>
				<%
					String comment = (String) application.getAttribute("comment"); // 댓글입력시 comment_writeAction.jsp로 값 전달
				%>
				<input class="btn btn-success pull-right" name="comment"
					type="submit" value="댓글달기" />
			</form>
			
			<a href="main_board.jsp?id=<%=id%>" class="btn btn-info">글목록</a>
			<%
				if (id.equals(bbs.getUserID())) {  // 글쓴 사람의 아이디와 로그인한 사람의 아이디가 같은 경우에만 수정/삭제/댓글모두삭제 버튼이 보임
			%>
			<a href="update.jsp?number=<%=number%>&id=<%=id%>"
				class="btn btn-warning">글수정</a> <a
				onclick="return confirm ('정말로 삭제하시겠습니까?')"
				href="deleteAction.jsp?number=<%=number%>&id=<%=id%>"
				class="btn btn-danger">글삭제</a> <a
				onclick="return confirm ('댓글들을 모두 지우시겠습니까?')"
				href="comment_deleteAction.jsp?number=<%=number%>&id=<%=id%>"
				class="btn btn-danger pull-right">댓글모두삭제</a>
			<%
				}
			%>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
