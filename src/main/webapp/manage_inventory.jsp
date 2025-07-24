<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <style>
        body { background-color: #2471a3; color: white; padding: 30px; }
        .inventory-table { background-color: white; color: black; border-radius: 10px; padding: 20px; }
        h2 { text-align: center; margin-bottom: 30px; }
    </style>
</head>
<body>
    <div class="container">
       <h2><i class="bi bi-box-seam" style="font-size: 2.5rem;"></i> Inventory Management</h2>
        
        <form method="post" action="AddInventoryServlet" class="mb-4">
            <div class="row g-2">
                <div class="col-md-6">
                    <input type="text" name="itemName" placeholder="Item name (e.g., Food)" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <input type="number" name="quantity" placeholder="Quantity" class="form-control" required>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-warning w-100">Add / Update</button>
                </div>
            </div>
        </form>

        <div class="inventory-table">
            <table class="table table-bordered">
                <thead>
                    <tr><th>ID</th><th>Item</th><th>Quantity</th></tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM inventory");
                            while (rs.next()) {
                                out.println("<tr><td>" + rs.getInt("id") + "</td><td>" + rs.getString("item_name") + "</td><td>" + rs.getInt("quantity") + "</td></tr>");
                            }
                            conn.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
