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
      .hero-section {
            position: relative;
            height: 100vh;
            background: url('${pageContext.request.contextPath}/Images/bg-disaster.jpg') no-repeat center center/cover;
        }
        
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border:2px solid #2471a3;
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            color: white;
        }
        .login-container h2 {
            font-size: 1.8rem;
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #ff7f50;
            border: none;
            color: white;
            padding: 10px;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
        .btn-custom:hover {
            background-color: #e06b38;
            color: white;
            font-weight: bold;
        }
        .form-select, .form-control {
            margin-bottom: 15px;
        }
        .form-label {
            color: #ffffff;
        }
        .register-link {
            color: white;
            text-decoration: none;
        }
        .register-link:hover {
            color:  #ff7f50;
            text-decoration: underline;
        }
        .invalid-feedback {
            display: none;
            color: #dc3545;
        }
        .form-control.is-invalid, .form-select.is-invalid {
            border-color: #dc3545;
        }
        .form-control.is-invalid:focus, .form-select.is-invalid:focus {
            box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25);
        }
        .was-validated .form-control:invalid, .was-validated .form-select:invalid {
            border-color: #dc3545;
        }
        .was-validated .form-control:invalid ~ .invalid-feedback,
        .was-validated .form-select:invalid ~ .invalid-feedback {
            display: block;
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
</head>
<body>

        <div class="hero-section">
        
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
    <div class="login-container">
        <h2 style="color:#ff7f50">Login</h2>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post" novalidate>
            <div class="mb-3">
                <label for="loginUserType" class="form-label">User Type</label>
                <select class="form-select" id="loginUserType" name="userType" required>
                    <option value="" disabled selected>Select user type</option>
                    <option value="admin">Admin</option>
                    <option value="volunteer">Volunteer</option>
                    <option value="victim">Victim</option>
                </select>
                <div class="invalid-feedback">Please select a user type.</div>
            </div>
            <div class="mb-3">
                <label for="loginUsername" class="form-label">Username</label>
                <input type="text" class="form-control" id="loginUsername" name="username" required minlength="3">
                <div class="invalid-feedback">Username must be at least 3 characters.</div>
            </div>
            <div class="mb-3">
                <label for="loginPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="loginPassword" name="password" required minlength="6">
                <div class="invalid-feedback">Password must be at least 6 characters.</div>
            </div>
            <button type="submit" class="btn btn-custom w-100">Login</button>
        </form>
        <p class="mt-3 text-center" >Don't have an account? <a href="register.jsp" class="register-link">Register here</a></p>
    </div>
    </div>

    <!-- Bootstrap JS and Custom Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
        (function () {
            'use strict';
            const loginForm = document.getElementById('loginForm');
            loginForm.addEventListener('submit', function (event) {
                event.preventDefault();
                event.stopPropagation();
                let isValid = true;
                const userType = document.getElementById('loginUserType');
                const username = document.getElementById('loginUsername');
                const password = document.getElementById('loginPassword');
                // Reset validation
                loginForm.classList.remove('was-validated');
                userType.classList.remove('is-invalid');
                username.classList.remove('is-invalid');
                password.classList.remove('is-invalid');
                // Validate userType
                if (!userType.value) {
                    userType.classList.add('is-invalid');
                    isValid = false;
                }
                // Validate username
                if (!username.value || username.value.length < 3) {
                    username.classList.add('is-invalid');
                    isValid = false;
                }
                // Validate password
                if (!password.value || password.value.length < 6) {
                    password.classList.add('is-invalid');
                    isValid = false;
                }
                if (isValid) {
                    loginForm.classList.add('was-validated');
                    loginForm.submit();
                } else {
                    loginForm.classList.add('was-validated');
                }
            });
        })();
    </script>
</body>
</html>