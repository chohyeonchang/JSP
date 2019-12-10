<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>1랩 게시판</title>
</head>
<body>
	
	<% 
		String id = request.getParameter("id");
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}

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
				<li class="active"><a href="main_board.jsp?id=<%=id %>">게시판</a></li>  <!--id값 전달 -->

			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=id%>님<span class="caret"></span></a> <!-- dropdown 메뉴  -->
					<ul class="dropdown-menu">
						<li><a href="ChattingList.jsp?id=<%=id%>">채팅하기(성은이꺼랑연결)</a>
						<li><a href="login.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		
		</div>
	</nav>
	
	<div class="container">
		<div class = "row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd"> 
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs>list = bbsDAO.getList(pageNumber);    // List에 posts 테이블의 내용을 담음 Limit 10개
							int date = 0;
							
							for (int i = 0; i < list.size(); i++) {             // list에 10개가 담겨있으니 10번 반복해서 10개만 출력
								date = 3 + Integer.parseInt(list.get(i).getDate().substring(11, 13));
					%>
						<tr>
						    <td><%=list.get(i).getnumber()%></td>              <!--  posts 테이블의 첫번째 열 (number) 의 data들 -->
							<td><a href="view.jsp?id=<%=id %>&number=<%=list.get(i).getnumber()%>">  <%=list.get(i).getTitle()%></a></td>       <!--  posts 테이블의 두번째 열 (Title) 의 data들 -->               
							<td><%=list.get(i).getUserID()%></td>               <!--  posts 테이블의 세번째 열 (userID) 의 data들 -->
							<td><%=list.get(i).getDate().substring(0, 11) + date + "시" + list.get(i).getDate().substring(14, 16) + "분"%></td>        <!--  posts 테이블의 네번째 열 (Date) 의 data들 -->
						</tr>
						<%
							}
						%>								
				</tbody>
			</table>
			<% 		
					if (pageNumber != 1) {                                         // 첫번째 페이지가 아니면 다음버튼이 있고 누르면 -1
			%>
				<a href="main_board.jsp?pageNumber=<%=pageNumber - 1%>&id=<%=id%>"   
					class="btn btn-success btn-arrow-left">다음</a>
				<%
					}
					if (bbsDAO.nextPage(pageNumber)) {                             
				%>
				<a href="main_board.jsp?pageNumber=<%=pageNumber + 1%>&id=<%=id %>"
					class="btn btn-success btn-arrow-left">이전</a>
				<%
					}
				%>
		
			<a href = "write.jsp?id=<%=id%>" class="btn btn-info pull-right">글쓰기</a>
	
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
