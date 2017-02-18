<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
	<% 
		boolean found = false;
		for(Cookie cookie : request.getCookies()) {
			if(cookie.getName().equals("username")) {
				found = true;
			}				
		}
		if(found)
			response.sendRedirect("admin_view.jsp");
	%>
<html>
<head>
	<meta charset="UTF-8">
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
			<div class="body">
				<div class="about">
					<h2>Administrator</h2>
                    
                     <form action="Login" method="post">
      
        <h1>Administrator Authentication</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Verification</legend>
            <label  id="Admin_uid">Username:</label>
          <input type="text" name="username">
           <label  id="Admin_pwd">Password:</label>
          <input type="password" name="password">
          <button type="submit">Login</button>
          <p align="center">Not registered? Sign up here for free!</p> 
        </fieldset>
      </form>
      <form action="SignUp.jsp">
      	<fieldset>
      		<button type="submit">Sign Up</button>
      	</fieldset>
      </form>
					   
				</div>
			</div>
		</div>
	</div>
</body> 
</html>