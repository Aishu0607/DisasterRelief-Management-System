package com.admin;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/viewRequests")
public class ViewRequestsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String[]> requests = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM requests")) {

            while (rs.next()) {
                String[] row = {
                    String.valueOf(rs.getInt("id")),
                    rs.getString("username"),
                    rs.getString("help_type"),
                    rs.getString("status"),
                    rs.getString("date_requested")
                };
                requests.add(row);
            }

            request.setAttribute("requestList", requests);
            RequestDispatcher rd = request.getRequestDispatcher("view_requests.jsp");
            rd.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        }
    }
}
