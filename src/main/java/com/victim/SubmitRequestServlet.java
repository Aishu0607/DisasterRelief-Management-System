package com.victim;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/SubmitRequestServlet")
public class SubmitRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int victimId = (int) session.getAttribute("userId");
        String helpType = request.getParameter("helpType");
        String description = request.getParameter("description");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root")) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO requests (victim_id, category, description, status, date_requested) VALUES (?, ?, ?, 'Pending', NOW())");
            ps.setInt(1, victimId);
            ps.setString(2, helpType);
            ps.setString(3, description);
            ps.executeUpdate();

            request.setAttribute("message", "Your request has been submitted successfully.");
            request.getRequestDispatcher("victim_dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("victim_dashboard.jsp").forward(request, response);
        }
    }
}
