package com.admin;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddReliefCenterServlet")
public class AddReliefCenterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String centerName = request.getParameter("centerName");
        String location = request.getParameter("location");
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root")) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO centers (name, location, capacity) VALUES (?, ?, ?)");
            ps.setString(1, centerName);
            ps.setString(2, location);
            ps.setInt(3, capacity);
            ps.executeUpdate();

            response.sendRedirect("relief_centers.jsp?success=Center%20Added");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("relief_centers.jsp").forward(request, response);
        }
    }
}
