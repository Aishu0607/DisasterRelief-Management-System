<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") == null || !"admin".equals(session.getAttribute("userType"))) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - RapidRelief</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: white; /* consistent with your blue theme */
            color: white;
        }
        .dashboard-container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 30px;
            background-color: #1c5988;
            border-radius: 15px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            color: #333;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.03);
        }
        .btn-custom {
            background-color: #ff7f50;
            color: white;
            font-weight: bold;
            border: none;
        }
        .btn-custom:hover {
            background-color: #e06b38;
            color: white;
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
    function confirmLogout() {
        return confirm("Are you sure you want to logout?");
    }
</script>
</head>

<body>

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
    <div class="dashboard-container">
        <h2>Admin Dashboard - RapidRelief</h2>
        <div class="row g-4">

            <div class="col-md-4">
                <div class="card">
                    <h5>👥 Victim Help Requests</h5>
                    <a href="view_requests.jsp" class="btn btn-custom mt-3">View Requests</a>
                </div>
            </div>

            <div class="col-md-4	">
                <div class="card">
                    <h5>🦸 Assign Volunteer Tasks</h5>
                    <a href="assign_tasks.jsp" class="btn btn-custom mt-3">Assign Tasks</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <h5>📦 Manage Inventory</h5>
                    <a href="manage_inventory.jsp" class="btn btn-custom mt-3">Inventory</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <h5>🏥 Relief Centers</h5>
                    <a href="relief_centers.jsp" class="btn btn-custom mt-3">Manage Centers</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <h5>📊 View Reports</h5>
                    <a href="reports.jsp" class="btn btn-custom mt-3">Reports</a>
                </div>
            </div>

        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
