package com.example;

import org.mindrot.jbcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(RegisterServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔹 Get all form values
        String userType = request.getParameter("userType");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String location = request.getParameter("location");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        LOGGER.info("Registration attempt: userType=" + userType + ", username=" + username + ", email=" + email);

        // 🔹 Validate all fields
        if (userType == null || !(userType.equals("volunteer") || userType.equals("victim"))) {
            request.setAttribute("error", "Please select a valid user type.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (username == null || username.trim().length() < 3) {
            request.setAttribute("error", "Username must be at least 3 characters.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (email == null || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            request.setAttribute("error", "Invalid email address.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (phone == null || !phone.matches("^\\d{10}$")) {
            request.setAttribute("error", "Phone number must be exactly 10 digits.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (location == null || location.trim().isEmpty()) {
            request.setAttribute("error", "Location cannot be empty.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (password == null || password.length() < 6 || !password.equals(confirmPassword)) {
            request.setAttribute("error", "Password must be at least 6 characters and match the confirmation.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 🔐 Hash the password
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // 🔹 Insert into database
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO users (userType, username, email, phone, location, password) VALUES (?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, userType);
            stmt.setString(2, username);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, location);
            stmt.setString(6, hashedPassword);

            int rows = stmt.executeUpdate();
            LOGGER.info("User registered successfully. Rows affected: " + rows);
            response.sendRedirect("register.jsp?success=Registration%20successful");

        } catch (SQLException e) {
            LOGGER.severe("Register DB error: " + e.getMessage());
            if ("23000".equals(e.getSQLState())) {
                request.setAttribute("error", "Username or email already exists.");
            } else {
                request.setAttribute("error", "Database error: " + e.getMessage());
            }
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
