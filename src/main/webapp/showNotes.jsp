<%@page import="com.User.post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.User.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<style type="text/css">
.back-img {
	background: url("Images/Savenotes.jpg");
	background-position: center; /* Center the background image */
	background-repeat: no-repeat; /* Do not repeat the background image */
	width: 100%;
	height: 95vh;
}

#addnotes {
	align-items: center;
	margin-left: 900px;
}

body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin: 50px;
}

.form-container {
	background-color: white;
	border-radius: 20px;
	max-width: 600px;
	margin: 0 auto;
	max-width: 600px
}

h1 {
	font-size: 24px;
	margin-bottom: 10px;
}

p {
	font-size: 16px;
	margin-bottom: 20px;
}

.button-container {
	margin-top: 20px;
}

.button-container button {
	margin: 0 10px;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button-container button.primary {
	background-color: #007bff;
	color: white;
}

.button-container button.secondary {
	background-color: #6c757d;
	color: white;
}
 .dynamic-div {
       display: inline-block; /* or inline-flex */
        width: auto;
        max-width: 100%; /* Set a maximum width */
        height: 1000px; /* Set a fixed or maximum height */
        border: 1px solid black; /* for visualization purposes */
        padding: 10px; /* optional */
        overflow: auto; /* Add scroll bars when content overflows */
    }
</style>


<link rel="stylesheet" href="CSS/style.css">
<%@ include file="AllContent/allCSS.jsp"%>

</head>
<body>


	<%@ include file="AllContent/navbar.jsp"%>

	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-warning" role="alert">updateMsg</div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>


	<%
	String wrongMsg = (String) session.getAttribute("wrongMsg");
	if (wrongMsg != null) {
	%>
	<div class="alert alert-warning" role="alert">wrongMsg</div>
	<%
	session.removeAttribute("wrongMsg");
	}
	%>


	<%
	String DeleteMsg = (String) session.getAttribute("DeleteMsg");
	if (DeleteMsg != null) {
	%>
	<div class="alert alert-warning" role="alert">DeleteMsg</div>
	<%
	session.removeAttribute("DeleteMsg");
	}
	%>


	<%
	ArrayList<post> userPost = (ArrayList<post>) session.getAttribute("UserPosts");
	UserDetails user1 = new UserDetails();
	%>
	<div class="container-fluid back-img dynamic-div">
		<%
		for (post posts : userPost) {
		%>
		<br>
		<div class="form-container">
			<h3><%=posts.getTitle()%></h3>
			<p><%=posts.getContent()%></p>
			<div class="button-container" style="display: inline-block;">

				<form action="edit.jsp" method="post">
					<input type="hidden" name="postId" value="<%=posts.getId()%>">
					<button type="submit" class="primary">Edit</button>
				</form>
				<form action="DeleteServlet?noteid=<%=posts.getId()%>" method="get">
					<input type="hidden" name="postId" value="<%=posts.getId()%>">
					<button type="submit" class="secondary">Delete</button>
				</form>
			</div>
		</div>
		<%
		}
		%>
	</div>

	<%@ include file="AllContent/footer.jsp"%>


</body>
</html>