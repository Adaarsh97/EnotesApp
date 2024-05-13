<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Credentials</title>

<style type="text/css">
.back-img {
	background: url("Images/LoginRegister.jpg");
	background-size: cover; /* Cover the entire viewport */
	background-position: center; /* Center the background image */
	background-repeat: no-repeat; /* Do not repeat the background image */
	width: 100%;
	height: 61.5vh;
}
</style>

<link rel="stylesheet" href="CSS/style.css">
<%@ include file="AllContent/allCSS.jsp"%>


</head>
<body>

	<%@ include file="AllContent/navbar.jsp"%>

	<div class="container-fluid back-img">
		<br> <br>
		<div class="container-fluid div-color">
			<div class="row">
				<div class="col-md-4 offset-md-6 ">
					<div class="card mt-5">
						<div class="card-header text-center text-white bg-custom">
							<i class="fa fa-user fa-3x " aria-hidden="true"> </i>
							<h4>Login</h4>
								<%
						String regMsg = (String) session.getAttribute("login-failed");
						if (regMsg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=regMsg%>
							<a href="login.jsp">Click Here</a>
						</div>
						<%} %>
						<%
						session.removeAttribute("login-failed");
					%>
						</div>
						<div class="card-body">
							<form action="loginServlet" method="post">

								<div class="form-group">
									<label for="exampleInputEmail1">Enter Email</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Write your email"
										name="uemail">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Enter Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Write your Password"
										name="upassword"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										password with anyone else.</small>
								</div>

								<button type="submit" class="btn btn-primary btn-block">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="AllContent/footer.jsp"%>




</body>
</html>