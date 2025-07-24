package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/disaster_relief";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");

           
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            
            String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                out.println("<script>alert('Message sent successfully!'); window.location='contact.jsp';</script>");
            } else {
                out.println("<script>alert('Something went wrong. Please try again.'); window.location='contact.jsp';</script>");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='contact.jsp';</script>");
        }
    }
}
