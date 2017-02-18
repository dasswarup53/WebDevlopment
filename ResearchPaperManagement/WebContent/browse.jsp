<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>Insert title here</title>
</head>
<style>
        select {
  padding: 0px;
  height: 32px;
  border-radius: 2px;
            
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}
        
        label {
  display: block;
  margin-bottom: 8px;
}

        
        button {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}
table.imagetable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	width:100%;
	font-size:40px;
	height:300px;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.imagetable th {
	background:#b5cfd2 url('images/cell-blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable td {
	background:#dcddc0 url('images/cell-grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable tr:hover{
	background-color:#ffff99;
}

    </style>
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
				<div class="services" style="padding: 40px 30px 40px 30px;">
					<h2>Browse</h2><br>
				  
         <select>
             <option>Select A Domain</option>
             <option>Image Processing</option>
             <option>Artificial Intelligence and Soft Computing</option>
             <option>Cyber and Network Security</option>
             <option>Cloud Computing</option>
             <option>Software Engineering</option>
             <option>Web Technology</option>
                    </select>
                    <br>
                    <button>Go</button>
								<table class="imagetable">
			<tr>
				<th>NAME</th><th>Domain</th><th>ISSN/ISBN </th><th>Conference</th>
			</tr>
			<% Connection conn;
					try
					{
					Class.forName("com.mysql.jdbc.Driver");
					//String url="jdbc:mysql://localhost:3306/dbppm_new";
					//String username="root";
					//String password="root";
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbppm_new","root","root");
					//Connection conn=DriverManager.getConnection(url,username,password);
			        String query="select faculty.t_name,paper.dom,paper.issn_isbn,conf.j_name from faculty, paper, conf where faculty.t_id = paper.t_id and paper.p_id = conf.p_id;";
					Statement stmt=conn.createStatement();
					ResultSet rs=stmt.executeQuery(query);
					
					while(rs.next())
					{
					
					%>
					    <tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td></tr>
								    
					    
					        <%
					
					}
					%>
					    </table>
					    <%
					    rs.close();
					    stmt.close();
					    conn.close();
					    }
					catch(Exception e)
					{
					    e.printStackTrace();
					    }
					
					
					

%>
			
				</div>
			</div>
		</div>
	</div>
	<div>
				   
	</div>


</body>
</html>