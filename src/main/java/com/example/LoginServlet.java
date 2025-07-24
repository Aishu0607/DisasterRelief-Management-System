package com.example;

import org.mindrot.jbcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Logger;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userType = request.getParameter("userType");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // ✅ Basic validation
        if (userType == null || username == null || password == null ||
                username.length() < 3 || password.length() < 6 ||
                !userType.matches("admin|volunteer|victim")) {
            request.setAttribute("error", "Invalid login input.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT password FROM users WHERE username = ? AND userType = ?")) {

            stmt.setString(1, username);
            stmt.setString(2, userType);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password");

                if (BCrypt.checkpw(password, hashedPassword)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("userType", userType);

                    // ✅ Redirect based on user type
                    switch (userType) {
                        case "admin":
                            response.sendRedirect("admin_dashboard.jsp");
                            break;
                        case "volunteer":
                            response.sendRedirect("volunteer_dashboard.jsp");
                            break;
                        case "victim":
                            response.sendRedirect("victim_dashboard.jsp");
                            break;
                        default:
                            request.setAttribute("error", "Unknown user role.");
                            request.getRequestDispatcher("/login.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "Incorrect password.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "User not found.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            LOGGER.severe("Login DB error: " + e.getMessage());
            request.setAttribute("error", "Database connection failed.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}














//package com.example;
//
//import org.mindrot.jbcrypt.BCrypt;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.io.IOException;
//import java.sql.*;
//import java.util.logging.Logger;
//
//@WebServlet("/login")
//public class LoginServlet extends HttpServlet {
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/disaster_relief";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "root";
//    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String userType = request.getParameter("userType");
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        // Validation
//        if (userType == null || username == null || password == null ||
//                username.length() < 3 || password.length() < 6 ||
//                !userType.matches("admin|volunteer|victim")) {
//            request.setAttribute("error", "Invalid login input.");
//            request.getRequestDispatcher("/login.jsp").forward(request, response);
//            return;
//        }
//
//        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//             PreparedStatement stmt = conn.prepareStatement(
//                     "SELECT password FROM users WHERE username = ? AND userType = ?")) {
//
//            stmt.setString(1, username);
//            stmt.setString(2, userType);
//
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                String hashedPassword = rs.getString("password");
//
//                if (BCrypt.checkpw(password, hashedPassword)) {
//                    HttpSession session = request.getSession();
//                    session.setAttribute("username", username);
//                    session.setAttribute("userType", userType);
//
//                    // 🔁 Redirect to role-based dashboards
//                    switch (userType) {
//                        case "admin":
//                            response.sendRedirect("admin_dashboard.jsp");
//                            break;
//                        case "volunteer":
//                            response.sendRedirect("volunteer_dashboard.jsp");
//                            break;
//                        case "victim":
//                            response.sendRedirect("victim_dashboard.jsp");
//                            break;
//                        default:
//                            request.setAttribute("error", "Unknown user role.");
//                            request.getRequestDispatcher("/login.jsp").forward(request, response);
//                    }
//                } else {
//                    request.setAttribute("error", "Incorrect password.");
//                    request.getRequestDispatcher("/login.jsp").forward(request, response);
//                }
//            } else {
//                request.setAttribute("error", "User not found.");
//                request.getRequestDispatcher("/login.jsp").forward(request, response);
//            }
//
//        } catch (SQLException e) {
//            LOGGER.severe("DB Error: " + e.getMessage());
//            request.setAttribute("error", "Database connection failed.");
//            request.getRequestDispatcher("/login.jsp").forward(request, response);
//        }
//    }
//}
