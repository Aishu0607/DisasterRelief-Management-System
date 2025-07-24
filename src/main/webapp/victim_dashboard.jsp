<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    if (session.getAttribute("username") == null || !"victim".equals(session.getAttribute("userType"))) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Victim Dashboard - RapidRelief</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('${pageContext.request.contextPath}/Images/bg-disaster2.jpg') no-repeat center center/cover;
            color: white;
            min-height: 100vh;
        }
        .dashboard-box {
            max-width: 600px;
            margin: 50px auto;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 25px;
            border-radius: 12px;
        }
        .dashboard-box h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-label {
            color: #fff;
        }
        .form-select, .form-control {
            margin-bottom: 15px;
        }
        .btn-submit {
            background-color: #ff7f50;
            color: white;
            border: none;
        }
        .btn-submit:hover {
            background-color: #e06b38;
            font-weight: bold;
        }
        
        /* Navbar styles */
        .navbar {
            background-color: #2471a3 !important;
            padding: 2px 2px;
        }
        .navbar-collapse {
            display: flex;
            justify-content: space-between;
        }
        .nav-btn {
            margin-left: 20px;
            color: white !important;
            background-color: transparent;
            padding: 2px 10px;
            font-size: 1.1rem;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            font-weight: bold;
            text-decoration: underline;
        }
        .nav-btn:hover {
            background-color: #ff7f50;
            color: white !important;
            border: 1px solid #ff7f50;
        }
        /* Auto-scrolling quote text */
        .quote-container {
            flex-grow: 1;
            width: 100%;
            overflow: hidden;
            margin-left: 5px;
            border-left: 3px solid #ff7f50;
            padding: 2px 6px;
        }
        .quote-text {
            display: inline-block;
            font-style: italic;
            color: white;
            font-size: 1.1rem;
            white-space: nowrap;
            animation: marquee 15s linear infinite;
        }
        @keyframes marquee {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }
        .quote-text:hover {
            animation-play-state: paused;
        }
    </style>
    
    <script>
     function confirmLogout(){
    	 return confirm("Are you sure you want to logout?");
     }
    </script>
</head>
<body>
<% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top: 20px;">
        <%= request.getAttribute("message") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>


<nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><img src="${pageContext.request.contextPath}/Images/logo2.jpg" alt="Navbar Logo" width="120" height="80"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav quote-nav">
                        <li class="nav-item">
                            <div class="quote-container">
                                <span class="quote-text">Stay positive, work hard, make it happen! Your dreams are within reach, keep pushing forward with determination and courage!</span>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                     <a class="nav-link nav-btn" href="logout.jsp" onclick="return confirmLogout();">Logout</a>
                        </li>
                   </ul>
                </div>
            </div>
        </nav>
        
           
    <div class="dashboard-box">
    <h2 style=" background-color: #f5cba7;
                 color: black;
                 padding:15px;
                 margin-top:10px;" >Welcome, <%= username %>!</h2>
     
        <h2>Submit Help Request</h2>

        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("message") %></div>
        <% } %>

        <form action="SubmitRequestServlet" method="post">
            <div class="mb-3">
                <label for="helpType" class="form-label">Type of Help Needed</label>
                <select class="form-select" name="helpType" id="helpType" required>
                    <option value="" disabled selected>Select one</option>
                    <option value="Food">Food</option>
                    <option value="Water">Water</option>
                    <option value="Shelter">Shelter</option>
                    <option value="Medical">Medical</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Describe your situation</label>
                <textarea class="form-control" name="description" id="description" rows="4" required></textarea>
            </div>

            <button type="submit" class="btn btn-submit w-100">Submit Request</button>
        </form>
    </div>
</body>
</html>
