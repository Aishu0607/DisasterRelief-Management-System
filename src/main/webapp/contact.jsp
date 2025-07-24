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
        .contact-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 12px;
            max-width: 800px;
            margin: 50px auto;
        }
        h2, h4 {
            color: #ff7f50;
        }
         .form-control {
            background-color: rgba(255, 255, 255, 0.8);
            color: #000;
        }
        .form-control::placeholder {
            color: #555;
        }
    </style>
</head>
<body>
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
                     <a class="nav-link nav-btn" href="index.jsp" onclick="return confirmLogout();">← Back</a>
                        </li>
                   </ul>
                </div>
            </div>
        </nav>
   
   <!-- Form -->
   <div class="contact-container">
    <h2 class="text-center mb-4">Contact Us</h2>

    <p>If you have any questions, suggestions, or need support, feel free to contact us. We're here to help!</p>

    <form action="${pageContext.request.contextPath}/contact" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Your Name</label>
            <input type="text" class="form-control" id="name" name="name" required placeholder="Enter your name">
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Your Email</label>
            <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
        </div>

        <div class="mb-3">
            <label for="message" class="form-label">Your Message</label>
            <textarea class="form-control" id="message" name="message" rows="5" required placeholder="Type your message here..."></textarea>
        </div>

        <button type="submit" class="btn btn-warning w-100">Send Message</button>
    </form>

    <div class="mt-4">
        <h4>Reach Us</h4>
        <p>Email: support@disasterrelief.org</p>
        <p>Phone: +91-9876543210</p>
        <p>Address: Relief Coordination Center, Pune, India</p>
    </div>
</div>
     
        
</body>
</html>