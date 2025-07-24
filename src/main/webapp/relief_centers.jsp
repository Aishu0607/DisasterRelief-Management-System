<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Relief Centers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <style>
        body { background-color: #2471a3; color: white; padding: 30px; }
        .relief-box { background-color: white; color: black; padding: 20px; border-radius: 10px; }
        h2 { text-align: center; margin-bottom: 30px; }
    </style>
</head>
<body>
    <div class="container">
        <h2> <i class="bi bi-hospital text-danger" style="font-size: 3.5rem;"></i> 
		  Relief Centers
		</h2>

        <form method="post" action="AddReliefCenterServlet" class="mb-4">
            <div class="row g-2">
                <div class="col-md-4">
                    <input type="text" name="centerName" placeholder="Center Name" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <input type="text" name="location" placeholder="Location" class="form-control" required>
                </div>
                <div class="col-md-2">
                    <input type="number" name="capacity" placeholder="Capacity" class="form-control" required>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-warning w-100">Add Center</button>
                </div>
            </div>
        </form>

        <div class="relief-box">
            <table class="table table-bordered">
                <thead>
                    <tr><th>ID</th><th>Name</th><th>Location</th><th>Capacity</th></tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root");
                            ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM centers");
                            while (rs.next()) {
                                out.println("<tr><td>" + rs.getInt("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getString("location") + "</td><td>" + rs.getInt("capacity") + "</td></tr>");
                            }
                            conn.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
