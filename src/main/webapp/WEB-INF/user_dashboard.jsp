
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
</head>
<body>
    <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
    <p>You are logged in as a <%= session.getAttribute("userType") %>.</p>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
</body>
</html>