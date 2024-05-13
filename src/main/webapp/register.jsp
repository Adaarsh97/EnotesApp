<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
		<br>
		<div class="container-fluid div-color">
			<div class="row">
				<div class="col-md-4 offset-md-6 ">
					<div class="card mt-5">
						<div class="card-header text-center text-white bg-custom">
							<i class="fa fa-user-plus fa-3x " aria-hidden="true"> </i>
							<h4>Registeration</h4>
						</div>

						<%
						String regMsg = (String) session.getAttribute("reg-success");
						if (regMsg != null) {
						%>
						<div class="alert alert-success" role="alert"><%=regMsg%>Login
							<a href="login.jsp">Click Here</a>
						</div>
						<%
						session.removeAttribute("reg-success");
						}
						%>

						<%
						String FailedMsg = (String) session.getAttribute("failed-msg");
						if (FailedMsg != null) {
						%>

						<div class="alert alert-danger" role="alert"></div>
						<%=FailedMsg%>

						<%
						session.removeAttribute("failed-msg");
						}
						%>

						<div class="card-body">
							<form action="UserServlet" method="post">
								<div class="form-group">
									<label for="exampleInputName1">Enter Name</label> <input
										type="text" class="form-control" id="exampleInputName1"
										aria-describedby="nameHelp" placeholder="Write your name"
										name="fname">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Enter Email</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Write your email"
										name="uemail">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Enter Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Create your Password"
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
	</div>

	<%@ include file="AllContent/footer.jsp"%>
</body>
</html>