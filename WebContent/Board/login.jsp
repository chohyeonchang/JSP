<%@ page contentType="text/html; charset = utf-8" pageEncoding="utf-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>1랩 게시판</title>
</head>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expaned="false">

			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>

		</button>

		<a class="navbar-brand">1랩실 게시판</a>

	</div>

	<div class="collapse navbar-collapse"
		id="#bs-example-navbar-collapse-1">

		<ul class="nav navbar-nav">

			<li><a href="welcome.jsp">메인</a></li>

		</ul>

		<ul class="dropdown-menu">

			<li class="active"><a href="login.jsp">로그인</a></li>
			<li class="active"><a href="join.jsp">회원가입</a></li>

		</ul>

	</div>

</nav>

<div class="container">

	<div class="col-lg-4"></div>

	<div class="col-lg-4">


		<div class="jumbotron" style="padding-top: 20px;">

			<form method="post" action="login_process.jsp">

				<h3 style="text-align: center;">로그인화면</h3>

				<div class="form-group">

					<input type="text" class="form-control" placeholder="아이디" name="id"
						maxlength="20">

				</div>


				<div class="form-group">

					<input type="password" class="form-control" placeholder="비밀번호"
						name="passwd" maxlength="20">

				</div>

				<input type="submit" class="btn btn-info form-control" value="로그인">
			</form>
			<form method="post" action="join.jsp">
				<input type="submit" class="btn btn-Warning form-control"
					value="회원가입">
			</form>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
