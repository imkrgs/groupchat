<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
html, body {
	height: 100%;
	background-color: rgb(16, 7, 25);
}

body {
	margin: 0;
	padding: 0;
	background-size: cover;
	font-family: sans-serif;
}

.box {
	position: absolute;
	top: 70%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 25rem;
	padding: 2.5rem;
	box-sizing: border-box;
	background: rgb(16, 7, 25);
	border-radius: 0.625rem;
}

.box h2 {
	margin: 0 0 1.875rem;
	padding: 0;
	color: #fff;
	text-align: center;
}

.box .inputBox {
	position: relative;
}

.box .inputBox input {
	width: 100%;
	padding: 0.625rem 0;
	font-size: 1rem;
	color: #fff;
	letter-spacing: 0.062rem;
	margin-bottom: 1.875rem;
	border: none;
	border-bottom: 0.065rem solid #fff;
	outline: none;
	background: transparent;
}

.box .inputBox label {
	position: absolute;
	top: 0;
	left: 0;
	padding: 0.625rem 0;
	font-size: 1rem;
	color: #fff;
	pointer-events: none;
	transition: 0.5s;
}

.box .inputBox input:focus ~ label, .box .inputBox input:valid ~ label,
	.box .inputBox input:not([value=""]) ~ label {
	top: -1.125rem;
	left: 0;
	color: #03a9f4;
	font-size: 0.75rem;
}

.box input[type="submit"] {
	border: none;
	outline: none;
	color: #fff;
	background-color: #bebebe;
	padding: 0.625rem 1.25rem;
	cursor: pointer;
	border-radius: 0.312rem;
	font-size: 1rem;
}

.box input[type="submit"]:hover {
	background-color: #75447b;
}

.footer {
	padding-left: 40%;
	position: absolute;
	bottom: 0;
}

.main-content {
	text-align: center;
	margin-top: 10%;
}
</style>
<title>Group Chat</title>
</head>
<body>
	<!--nav bar starts -->

	<nav class="navbar sticky-top navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <i class="fa-solid fa-comments"></i>
				Group Chat
			</a>
			<ul class="narbar-nav">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="#" style="color: white"><i class="fa-solid fa-user"></i>
						user </a></li>
			</ul>
		</div>
	</nav>

	<!--nav bar ends -->

	<!--heading -->
	<div class="main-content" style="color: white">
		<h1>
			<span> Welcome Strangers To Meet Another Stranger </span> <br /> <br />
			<span> Set User Name And get Started !!!!!</span>
		</h1>
	</div>
	<!--heading ends here -->

	<!--user form -->
	<div class="box">
		<form action="/groupchat/setuser">
			<div class="inputBox">
				<input type="text" name="user" id="user" required autocomplete="off"
					onkeyup="this.setAttribute('value', this.value);" value="" />
					<label>User Name</label>
			</div>
			<input  class="btn" type="submit" />
		</form>
	</div>
	<!--user form ends -->

	<!--footer starts here -->
	<footer class="footer">
		<div class="container text-center">
			<small>Copyright &copy; Group Chat Created By IMKRGS</small>
		</div>
	</footer>
	<!--footer ends here -->
</body>
</html>
