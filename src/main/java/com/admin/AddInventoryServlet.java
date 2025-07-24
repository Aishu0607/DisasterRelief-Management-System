package com.admin;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddInventoryServlet")
public class AddInventoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemName = request.getParameter("itemName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root")) {
            PreparedStatement check = conn.prepareStatement("SELECT * FROM inventory WHERE item_name=?");
            check.setString(1, itemName);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                PreparedStatement update = conn.prepareStatement("UPDATE inventory SET quantity = quantity + ? WHERE item_name = ?");
                update.setInt(1, quantity);
                update.setString(2, itemName);
                update.executeUpdate();
            } else {
                PreparedStatement insert = conn.prepareStatement("INSERT INTO inventory (item_name, quantity) VALUES (?, ?)");
                insert.setString(1, itemName);
                insert.setInt(2, quantity);
                insert.executeUpdate();
            }

            response.sendRedirect("manage_inventory.jsp?success=Inventory%20Updated");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("manage_inventory.jsp").forward(request, response);
        }
    }
}
