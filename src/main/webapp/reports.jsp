<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
   
    <style>
        body { background-color: #2471a3; color: white; padding: 30px; }
        .card { background: white; color: black; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.2); }
        h2 { text-align: center; margin-bottom: 30px; }
    </style>
</head>
<body>
    <div class="container">
        <h2 style="background-color: #2471a3; padding: 15px;">
		  <i class="bi bi-bar-chart text-white" style="font-size: 2.5rem;"></i> 
		  <span style="color: white;">System Reports</span>
		</h2>

        <div class="row g-3">
            <%
                int totalRequests = 0, totalVolunteers = 0, totalItems = 0, totalCenters = 0;
                try {
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root");

                    Statement st = conn.createStatement();
                    ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM requests"); rs1.next(); totalRequests = rs1.getInt(1);
                    ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM users WHERE userType='volunteer'"); rs2.next(); totalVolunteers = rs2.getInt(1);
                    ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM inventory"); rs3.next(); totalItems = rs3.getInt(1);
                    ResultSet rs4 = st.executeQuery("SELECT COUNT(*) FROM centers"); rs4.next(); totalCenters = rs4.getInt(1);

                    conn.close();
                } catch (Exception e) {
                    out.println("<p>Error loading reports: " + e.getMessage() + "</p>");
                }
            %>

            <div class="col-md-3"><div class="card text-center"><h5>Total Requests</h5><h3><%= totalRequests %></h3></div></div>
            <div class="col-md-3"><div class="card text-center"><h5>Total Volunteers</h5><h3><%= totalVolunteers %></h3></div></div>
            <div class="col-md-3"><div class="card text-center"><h5>Inventory Items</h5><h3><%= totalItems %></h3></div></div>
            <div class="col-md-3"><div class="card text-center"><h5>Relief Centers</h5><h3><%= totalCenters %></h3></div></div>
        </div>
    </div>
</body>
</html>
