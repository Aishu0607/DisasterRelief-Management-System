<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rapid Relief</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles for the landing page */
        .hero-section {
            position: relative;
            height: 100vh;
            background: url('${pageContext.request.contextPath}/Images/hero.jpeg') no-repeat center center/cover;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .hero-content {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            text-align: center;
            color: white;
            width: 100%;
            max-width: 1200px;
        }
        .hero-content img {
            max-width: 400px;
            align-self: flex-start;
        }
        .hero-text {
            align-self: center;
            width: 100%;
        }
        .hero-content h1 {
            font-size: 3.5rem;
            font-weight: bold;
        }
        .hero-content p {
            font-size: 1.8rem;
            font-style: italic;
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
        .dropdown-toggle.nav-btn::after {
            border-top-color: black;
        }
        .dropdown-toggle.nav-btn:hover::after {
            border-top-color: white;
        }
        .dropdown-item:hover {
            background-color: #ff7f50;
            color: white !important;
        }
        .navbar-nav {
            align-items: center;
        }
        .quote-nav {
            flex-grow: 1;
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
        /* Footer styles */
        .footer {
            background-color: #2471a3;
            padding: 20px 0;
            text-align: center;
            font-size: 0.9rem;
            color: white;
        }
        .footer a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            transition: color 0.3s;
        }
        .footer a:hover {
            color: #ff7f50;
        }
        .footer p {
            margin: 5px 0;
            color: white;
        }
    </style>
</head>
<body>
    <div class="main-content">
        <!-- Navbar -->
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
                            <a class="nav-link nav-btn" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-btn" href="register.jsp">Register</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Hero Section -->
        <div class="hero-section">
            <div class="overlay">
                <div class="hero-content">
                    <img src="${pageContext.request.contextPath}/Images/logo.png" alt="Website Logo">
                    <div class="hero-text">
                        <h1>Empowering Help, Inspiring Hope, Fostering Healing</h1>
                        <p>Join us to make a difference in lives through compassion and support!</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p>Together, we inspire change and healing.</p>
                <div>
                    <a href="about.jsp">About Us</a>
                    <a href="contact.jsp">Contact</a>
                    <a href="privacy.jsp">Privacy Policy</a>
                </div>
                <p>© 2025 Help, Hope, Heal. All rights reserved.</p>
            </div>
        </footer>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>