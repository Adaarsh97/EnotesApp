<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");

if (user1 != null) {
%>
<%
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.back-img {
	background: url("Images/AddNotes.jpg");
	background-position: center; /* Center the background image */
	background-repeat: no-repeat; /* Do not repeat the background image */
	width: 100%;
	height: 95vh;
}

/*form*/
.form-container {
	text-align: center;
	width: 300px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-container input[type="text"], .form-container textarea {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.form-container button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>


<link rel="stylesheet" href="CSS/style.css">
<%@ include file="AllContent/allCSS.jsp"%>

</head>
<body>

	<%@ include file="AllContent/navbar.jsp"%>


	<div class="container-fluid back-img">
		<div class="container-fluid p-0">
			<div class="card-mt-3">

				<div class="form-container">
					<h2>Add Notes</h2>
					<p>Tell Me Something...</p>
					<form action="AddServlet" method="post">
						<%
						UserDetails us = (UserDetails) session.getAttribute("UserD");
						int id=us.getId();
						%>
						<input type="hidden" name="uid"  value="<%=us.getId() %>">
>
						<input type="text" name="title" placeholder="Title"
							required="required"><br>
						<textarea name="description" placeholder="Description"
							required="required"></textarea>
						<br>
						<button type="submit">Add</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="AllContent/footer.jsp"%>


</body>
</html>