<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
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
        
          body {
            background: url('${pageContext.request.contextPath}/Images/bg-disaster.jpg') no-repeat center center/cover;
            color: white;
            min-height: 100vh;
        }
        .about-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 12px;
            max-width: 800px;
            margin: 50px auto;
        }
        h2, h4 {
            color: #ff7f50;
        }
    </style>
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
                     <a class="nav-link nav-btn" href="index.jsp" onclick="return confirmLogout();">← Back</a>
                        </li>
                   </ul>
                </div>
            </div>
        </nav>

<div class="about-container">
    <h2 class="text-center mb-4">About Us</h2>

    <p>
        Welcome to the <strong>Disaster Relief Management System</strong> – a digital platform designed to support
        communities during times of crisis. Whether it's a natural disaster like floods or earthquakes, or other emergencies,
        our system helps connect victims, volunteers, and administrators to respond quickly and effectively.
    </p>

    <h4 class="mt-4">What We Do</h4>
    <ul>
        <li>Register and track victim help requests</li>
        <li>Assign tasks to volunteers in real-time</li>
        <li>Manage inventory and relief supplies efficiently</li>
        <li>Monitor activities at relief centers</li>
        <li>Generate reports for analysis and future planning</li>
    </ul>

    <h4 class="mt-4">Our Mission</h4>
    <p>
        To provide a fast, reliable, and easy-to-use platform that helps manage disaster response, reduce human suffering,
        and ensure timely delivery of relief to those who need it most.
    </p>
</div>

</body>
</html>