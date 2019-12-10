<%@ page contentType="text/html; charset = utf-8" pageEncoding="utf-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>

	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcome.jsp">Welcome</a>
			</div>
		</div>
	</nav>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<br>
				<br>
				<p align="center">
					<font size="6">1랩실 게시판에 오신 것을 환영합니다 !</font>
				</p>
				<p align="center">
					<font size="6">Welcome to 1Lab Board !</font>
				</p>
			</h1>
			<h1>
				<p align="center">
					<font size="5"><a href="./login.jsp">게시판으로 !</a></font>
				</p>
			</h1>

		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

		<div style="text-align: right">
			<button type="button" class="btn btn-info btn-lg pull-right"
				disabled="disabled">현창</button>
			<button type="button" class="btn btn-success btn-lg pull-right"
				disabled="disabled">성은</button>
			<button type="button" class="btn btn-warning btn-lg pull-right"
				disabled="disabled">선영</button>
			<button type="button" class="btn btn-danger btn-lg pull-right"
				disabled="disabled">현아</button>
		</div>
	</div>

</body>
</html>