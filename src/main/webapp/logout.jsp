<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <%@ page language="java" session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // Invalidate the current session to log out the user
    session.invalidate();
    // Redirect to login page after logout
    response.sendRedirect("login.jsp");
%>
 
</body>
</html>