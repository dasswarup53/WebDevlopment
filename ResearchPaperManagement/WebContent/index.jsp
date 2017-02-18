<html>
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div class="border">
		<div id="bg" style="background-size:120% 100%; ">
			background
		</div>
		<div class="page">
			<div class="sidebar">
				<a href="index.jsp" id="logo" class="logo"><img src="images/logo.png" alt="logo"></a>
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
				<div>
					<h2 align="center">Welcome to Research Paper Management System</h2>
					<p align="center">
						Feel free to browse and upload your papers.We really appreciate your work.
					</p>
				
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>