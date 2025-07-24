<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Help Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #2471a3; color: white; padding: 20px; }
        .table { background-color: white; color: black; border-radius: 10px; }
        h2 { text-align: center; color: white; margin-bottom: 30px; }
    </style>
</head>
<body>

    <h2>📄 Victim Help Requests</h2>
    <div class="container">
        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>Request ID</th>
                    <th>Username</th>
                    <th>Help Type</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/disaster_relief", "root", "root");

                    String sql = "SELECT id, username, help_type, description, status, date_requested FROM requests";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("id") + "</td>");
                        out.println("<td>" + rs.getString("username") + "</td>");
                        out.println("<td>" + rs.getString("help_type") + "</td>");
                        out.println("<td>" + rs.getString("description") + "</td>");
                        out.println("<td>" + rs.getString("status") + "</td>");
                        out.println("<td>" + rs.getString("date_requested") + "</td>");
                        out.println("</tr>");
                    }

                    conn.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>
