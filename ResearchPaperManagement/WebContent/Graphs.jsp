<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/style_from.css" type="text/css">
<title>Graphs</title>
</head>
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
						<a href="http://localhost:8080/ResearchPaperManagement/portfolio.jsp">Analysis</a>
					</li>
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/admin.jsp">Admin</a>
					</li>
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/Graphs.jsp">Graphs</a>
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
				<div class="about">
					<frameset cols="50%,50%">
					</frameset>
<body>

</body>
</html>