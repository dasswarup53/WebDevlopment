<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	for (Cookie cookie : request.getCookies()) {
		if(cookie.getName().equals("username")) {
			cookie.setMaxAge(0);
            response.addCookie(cookie);
            response.sendRedirect("details.jsp");
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

</body>
</html>