<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/style_from.css" type="text/css">
</head>
<body>
	<div class="border">
		<div id="bg" style="background-size:120% 100%; ">
			background
		</div>
		<div class="page">
			<div class="sidebar">
				<a href="index.jsp" id="logo"><img src="images/logo.png" alt="logo"></a>
				<ul>
					<li class="selected">
						<a href="http://localhost:8080/ResearchPaperManagement/index.jsp">Home</a>
					</li>
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/details.jsp">Add Details</a>
					</li>
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/browse.jsp">Browse</a>
					</li>
					
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/admin.jsp">Admin</a>
					</li>
					
					<%
						for (Cookie cookie : request.getCookies()) {
							if(cookie.getName().equals("username")) {
					%>
					<li>
						<a href="redirect.jsp">Logout</a>
					</li>
					<% } } %>
				</ul>
				
			</div>
	<div class = "body">
		<div class = "about">
			<h2 align="center">Please enter your details to sign up</h2>
			<form action="SignUp" method="post">
			<fieldset>
				 <legend><span class="number">1</span>UserName</legend>
				 <label>Enter UserName:</label>
				 <input type="text" name="username">
				 <legend><span class="number">2</span>Password</legend>
				 <label>Enter Password:</label>
				 <input type="password">
				 <legend><span class="number">3</span>Re-type Password</legend>
				 <label>Enter Password again:</label>
				 <input type="password" name="password">
				 <button type="submit">Submit Details</button>
			</fieldset>
			</form>
		</div>
	</div> 
</body>
</html>