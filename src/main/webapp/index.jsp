<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>

<style type="text/css">
.back-img {
	background: url("Images/Notes.jpg");
	background-size: cover; /* Cover the entire viewport */
	background-position: center; /* Center the background image */
	background-repeat: no-repeat; /* Do not repeat the background image */
	width: 100%;
	height: 92vh;
}
</style>
<link rel="stylesheet" href="CSS/style.css">
<%@ include file="AllContent/allCSS.jsp"%>

</head>
<body>


	<%@ include file="AllContent/navbar.jsp"%>

	<div class="container-fluid back-img">
		<br> <br> <br>
		<div class="hero-text">

			<h1
				style="font-family: Georgia, serif; color: white; text-align: center;">
				Each new day is a blank page in the diary of your life.</h1>
			<br> <a href="login.jsp" style="text-decoration: none">
				<button class="btn btn-info btn-lg btn-flex" type="submit">
					<i class="fa-solid fa-user"></i>Login
				</button>
			</a> <a href="register.jsp" style="text-decoration: none">
				<button class="btn btn-info btn-lg btn-flex" type="submit">
					<i class="fa-solid fa-user-plus"></i>Register
				</button>
			</a>
		</div>
	</div>
	<%@ include file="AllContent/footer.jsp"%>


</body>
</html>