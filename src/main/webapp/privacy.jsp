<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Privacy Policy - Disaster Relief Management System</title>
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
        .privacy-container {
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

<div class="privacy-container">
    <h2 class="text-center mb-4">Privacy Policy</h2>

    <p>
        At <strong>Disaster Relief Management System</strong>, we value and respect your privacy. This policy outlines how we collect, use, and protect your personal information.
    </p>

    <h4 class="mt-4">Information We Collect</h4>
    <ul>
        <li>Personal details such as name, email, phone number, and location during registration.</li>
        <li>Help requests submitted by victims.</li>
        <li>Volunteer activity and assigned task information.</li>
    </ul>

    <h4 class="mt-4">How We Use Your Information</h4>
    <ul>
        <li>To provide assistance and connect users in need with volunteers.</li>
        <li>To manage and assign tasks efficiently.</li>
        <li>To communicate updates, support, or emergencies related to disaster relief.</li>
    </ul>

    <h4 class="mt-4">Data Security</h4>
    <p>
        We implement appropriate technical and organizational measures to protect your data against unauthorized access, loss, or misuse. All sensitive information is securely stored and only accessible to authorized personnel.
    </p>

    <h4 class="mt-4">Third-Party Sharing</h4>
    <p>
        We do not sell or share your personal information with third parties, except as required by law or with your explicit consent.
    </p>

    <h4 class="mt-4">Your Rights</h4>
    <p>
        You have the right to access, update, or request the deletion of your data at any time. To exercise your rights, please contact us via the <a href="contact.jsp" class="text-warning">Contact Us</a> page.
    </p>

    <h4 class="mt-4">Changes to this Policy</h4>
    <p>
        This privacy policy may be updated occasionally to reflect system changes. We encourage users to review it periodically.
    </p>

    <p class="mt-4"><strong>Effective Date:</strong> July 23, 2025</p>
</div>

</body>
</html>
