<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<%
		UserDetails user = (UserDetails) session.getAttribute("UserD");
		%>
		<a class="navbar-brand" href="index.jsp"> <img alt="" height=40px
			width=95px src="Images/enotelogo.jpeg"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a href="index.jsp"
					class="nav-link active btn-flex" aria-current="page" href="#"><i
						class="fa-solid fa-house"></i>Home</a></li>
				<%
				if (user != null) {
				%>
				<li class="nav-item"><a class="nav-link active btn-flex"
					href="addNotes.jsp"> <i class="fa-solid fa-file-lines"></i>AddNotes
				</a></li>
				<li class="nav-item"><a class="nav-link active btn-flex"
					href="showNotesServlet"><i class="fa-solid fa-book"></i>ShowNotes</a></li>
				<%
				}
				%>

				<!-- 				<li class="nav-item dropdown"><a -->
				<!-- 					class="nav-link dropdown-toggle" href="#" id="navbarDropdown" -->
				<!-- 					role="button" data-bs-toggle="dropdown" aria-expanded="false"> -->
				<!-- 						More </a> -->
				<!-- 					<ul class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
				<!-- 						<li><a class="dropdown-item" href="#">Action</a></li> -->
				<!-- 						<li><a class="dropdown-item" href="#">Another action</a></li> -->
				<!-- 						<li><hr class="dropdown-divider"></li> -->
				<!-- 						<li><a class="dropdown-item" href="#">Something else here</a></li> -->
				<!-- 					</ul></li> -->
			</ul>

			<%
			if (user != null) {
			%>
			<div class="d-flex">

				<a href="" style="text-decoration: none" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<button class="btn btn-outline-light btn-flex" type="submit">
						<i class="fa-solid fa-user"></i><%=user.getName()%>
					</button>
				</a> <a href="logoutservlet" style="text-decoration: none"><button
						class="btn btn-outline-light btn-flex" type="submit">
						<i class="fa-solid fa-right-from-bracket"></i>LogOut
					</button></a>
			</div>
			<%
			} else {
			%>
			<div class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-primary" type="submit">Search</button>

				<a href="login.jsp" style="text-decoration: none">
					<button class="btn btn-outline-light btn-flex" type="submit">
						<i class="fa-solid fa-right-to-bracket"></i>Login
					</button>
				</a> <a href="register.jsp" style="text-decoration: none"><button
						class="btn btn-outline-light btn-flex" type="submit">
						<i class="fa-solid fa-user-plus"></i>Register
					</button></a>
			</div>
			<%
			}
			%>



		</div>

		<!-- Button trigger modal -->

		<!-- Modal -->
		<%
		if (user != null) {
		%>


		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
							title</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<div class="container text-center">
							<i class="fa-sharp fa-solid fa-circle-user fa-5x"></i>
							<h5></h5>

							<table class="table">
								<tbody>
									<tr>
										<td>User Id:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Full Name:</td>
										<td><%=user.getName()%></td>
									</tr>
									<tr>
										<td>Email Id:</td>
										<td><%=user.getEmail()%></td>
									</tr>
								</tbody>
							</table>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>


						</div>

						<!-- 					<div class="modal-footer"> -->
						<!-- 						<button type="button" class="btn btn-secondary" -->
						<!-- 							data-bs-dismiss="modal">Close</button> -->
						<!-- 						<button type="button" class="btn btn-primary">Save -->
						<!-- 							changes</button> -->
						<!-- 					</div> -->

					</div>
				</div>
			</div>
		</div>
		<%
	
		}
		%>
	</div>



</nav>