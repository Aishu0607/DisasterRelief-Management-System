package com.admin;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/AssignTaskServlet")
public class AssignTaskServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int requestId = Integer.parseInt(request.getParameter("request_id"));
	    int volunteerId = Integer.parseInt(request.getParameter("volunteer_id"));

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection conn = DriverManager.getConnection(
	            "jdbc:mysql://localhost:3306/disaster_relief", "root", "root"
	        );

	        // Check if ANY task exists for this request
	        String checkQuery = "SELECT task_id FROM tasks WHERE request_id = ?";
	        PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
	        checkStmt.setInt(1, requestId);
	        ResultSet rs = checkStmt.executeQuery();

	        if (rs.next()) {
	            // Update existing task regardless of status
	            String updateQuery = "UPDATE tasks SET volunteer_id = ?, status = 'Assigned', assigned_date = NOW() WHERE request_id = ?";
	            PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
	            updateStmt.setInt(1, volunteerId);
	            updateStmt.setInt(2, requestId);
	            updateStmt.executeUpdate();
	        } else {
	            // Insert only if absolutely no task exists
	            String insertQuery = "INSERT INTO tasks (request_id, volunteer_id, status, assigned_date) VALUES (?, ?, 'Assigned', NOW())";
	            PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
	            insertStmt.setInt(1, requestId);
	            insertStmt.setInt(2, volunteerId);
	            insertStmt.executeUpdate();
	        }

	        conn.close();
	        response.sendRedirect("assign_tasks.jsp");

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.getWriter().println("Error: " + e.getMessage());
	    }
	}

}











//package com.admin;
//
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.*;
//import java.io.IOException;
//import java.sql.*;
//
//@WebServlet("/AssignTaskServlet")
//public class AssignTaskServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        String requestIdStr = request.getParameter("request_id");
//        String volunteerIdStr = request.getParameter("volunteer_id");
//
//        if (requestIdStr == null || volunteerIdStr == null) {
//            response.getWriter().println("Missing form data. Please try again.");
//            return;
//        } 
//
//        try {
//            int requestId = Integer.parseInt(requestIdStr);
//            int volunteerId = Integer.parseInt(volunteerIdStr);
//
//            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root")) {
//                // ✅ Insert into tasks table with status and assigned_date
//                String insertTask = "INSERT INTO tasks (request_id, volunteer_id, status, assigned_date) VALUES (?, ?, ?, NOW())";
//                PreparedStatement ps = conn.prepareStatement(insertTask);
//                ps.setInt(1, requestId);
//                ps.setInt(2, volunteerId);
//                ps.setString(3, "Assigned");  // ✅ Add status
//                ps.executeUpdate();
//
//                // ✅ Update request status
//                String updateReq = "UPDATE requests SET status = 'Assigned' WHERE id = ?";
//                PreparedStatement updatePs = conn.prepareStatement(updateReq);
//                updatePs.setInt(1, requestId);
//                updatePs.executeUpdate();
//
//                response.sendRedirect("assign_tasks.jsp");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Error assigning task: " + e.getMessage());
//        }
//    }
//}
