<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - RapidRelief</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    
     body {
            background: url('${pageContext.request.contextPath}/Images/bg-disaster.jpg') no-repeat center center/cover;
            color: white;
            min-height: 100vh;
        }
       
        .register-container {
            max-width: 600px;
            margin: 50px auto;
            padding:20px 30px;
           
            background-color: rgba(0, 0, 0, 0.7);
            border:2px solid #2471a3;
            border-radius: 10px;
            color: white;
        }
        .register-container h2 {
            font-size: 1.8rem;
            text-align: center;
            margin-bottom: 10px;
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
            font-weight: bold;
        }
        .form-select, .form-control {
            margin-bottom: 15px;
        }
        .form-label {
            color: #ffffff;
        }
        .login-link {
            color: white;
            text-decoration: none;
        }
        .login-link:hover {
            color:  #ff7f50;
            text-decoration: underline;
        }
        
        /* Navbar styles */
        .navbar {
            background-color: #2471a3;
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
        
<div class="register-container">
    <h2 class="text-center mb-4" style="color:#ff7f50" >Register</h2>

    <form id="registerForm" action="${pageContext.request.contextPath}/register" method="post" novalidate>
        <div class="row">
            <div class="col-md-6 mb-2">
                <label for="registerUserType" class="form-label">User Type</label>
                <select class="form-select" id="registerUserType" name="userType" required>
                    <option value="" disabled selected>Select user type</option>
                    <option value="volunteer">Volunteer</option>
                    <option value="victim">Victim</option>
                </select>
                <div class="invalid-feedback">Please select a user type.</div>
            </div>

            <div class="col-md-6 mb-2">
                <label for="registerUsername" class="form-label">Username</label>
                <input type="text" class="form-control" id="registerUsername" name="username" required minlength="3">
                <div class="invalid-feedback">Username must be at least 3 characters.</div>
            </div>

            <div class="col-md-6 mb-2">
                <label for="registerEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="registerEmail" name="email" required>
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>

            <div class="col-md-6 mb-2">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" required pattern="\d{10}">
                <div class="invalid-feedback">Enter a valid 10-digit phone number.</div>
            </div>

            <div class="col-md-6 mb-2">
                <label for="location" class="form-label">Location</label>
                <input type="text" class="form-control" id="location" name="location" required>
                <div class="invalid-feedback">Location is required.</div>
            </div>

            <div class="col-md-6 mb-2">
                <label for="registerPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="registerPassword" name="password" required minlength="6">
                <div class="invalid-feedback">Password must be at least 6 characters.</div>
            </div>

            <div class="col-md-6 mb-2">
                <label for="registerConfirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="registerConfirmPassword" name="confirmPassword" required>
                <div class="invalid-feedback">Passwords must match.</div>
            </div>
        </div>

        <button type="submit" class="btn btn-custom w-100">Register</button>
    </form>

    <p class="mt-3 text-center" >Already have an account? <a href="login.jsp" class="login-link" >Login here</a></p>
</div>



<!-- ✅ Success Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content bg-success text-white">
            <div class="modal-header">
                <h5 class="modal-title">🎉 Registration Successful</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                You have registered successfully!
                <a href="login.jsp" class="btn btn-light mt-3 w-100">Login Now</a>
            </div>
        </div>
    </div>
</div>

<!-- ❌ Error Modal -->
<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content bg-danger text-white">
            <div class="modal-header">
                <h5 class="modal-title">⚠️ Registration Failed</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "Something went wrong." %>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ Form Validation Script -->
<script>
    (() => {
        const form = document.getElementById('registerForm');
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            event.stopPropagation();

            let valid = true;

            const userType = document.getElementById('registerUserType');
            const username = document.getElementById('registerUsername');
            const email = document.getElementById('registerEmail');
            const phone = document.getElementById('phone');
            const location = document.getElementById('location');
            const password = document.getElementById('registerPassword');
            const confirmPassword = document.getElementById('registerConfirmPassword');

            // Reset
            form.classList.remove('was-validated');
            [userType, username, email, phone, location, password, confirmPassword].forEach(f => f.classList.remove('is-invalid'));

            if (!userType.value) {
                userType.classList.add('is-invalid');
                valid = false;
            }
            if (!username.value || username.value.length < 3) {
                username.classList.add('is-invalid');
                valid = false;
            }
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!email.value || !emailRegex.test(email.value)) {
                email.classList.add('is-invalid');
                valid = false;
            }
            if (!phone.value || !/^\d{10}$/.test(phone.value)) {
                phone.classList.add('is-invalid');
                valid = false;
            }
            if (!location.value.trim()) {
                location.classList.add('is-invalid');
                valid = false;
            }
            if (!password.value || password.value.length < 6) {
                password.classList.add('is-invalid');
                valid = false;
            }
            if (!confirmPassword.value || confirmPassword.value !== password.value) {
                confirmPassword.classList.add('is-invalid');
                valid = false;
            }

            if (valid) {
                form.classList.add('was-validated');
                form.submit();
            } else {
                form.classList.add('was-validated');
            }
        });
    })();
</script>

<!-- Auto-trigger modals if needed -->
<script>
    window.addEventListener("load", function () {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has("success")) {
            const successModal = new bootstrap.Modal(document.getElementById("successModal"));
            successModal.show();
        }
        <% if (request.getAttribute("error") != null) { %>
        const errorModal = new bootstrap.Modal(document.getElementById("errorModal"));
        errorModal.show();
        <% } %>
    });
</script>

</body>
</html>
