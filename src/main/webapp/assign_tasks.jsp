<%@ page import="java.sql.*, java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Assign Tasks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="padding: 30px; background-color: #f0f8ff;">

<h2 style="background-color: #2471a3;
           color: white;
            padding: 20px;">🧾 Assign Tasks to Volunteers</h2>

<table class="table table-bordered">
    <thead class="table-light">
        <tr>
            <th>Request ID</th>
            <th>Username</th>
            <th>Help Type</th>
            <th>Description</th>
            <th>Status</th>
            <th>Assign To Volunteer</th>
            <th>Action</th>
            <th>Assigned or not</th>
        </tr>
    </thead>
    <tbody>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root");

    String requestSql = "SELECT r.id, r.username, r.help_type, r.description, " +
            "(SELECT t.status FROM tasks t WHERE t.request_id = r.id ORDER BY t.assigned_date DESC LIMIT 1) AS status " +
            "FROM requests r";

    PreparedStatement ps = conn.prepareStatement(requestSql);
    ResultSet rs = ps.executeQuery();

    // Load volunteers only once
    ArrayList<String[]> volunteerList = new ArrayList<>();
    Statement st2 = conn.createStatement();
    ResultSet volunteersRs = st2.executeQuery("SELECT id, username FROM users WHERE userType = 'volunteer'");
    while (volunteersRs.next()) {
        volunteerList.add(new String[]{volunteersRs.getString("id"), volunteersRs.getString("username")});
    }

    while (rs.next()) {
        int requestId = rs.getInt("id");
%>
    <tr>
        <form method="post" action="AssignTaskServlet">
            <td><%= requestId %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("help_type") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <select name="volunteer_id" class="form-select" required>
                    <% for (String[] vol : volunteerList) { %>
                        <option value="<%= vol[0] %>"><%= vol[1] %></option>
                    <% } %>
                </select>
            </td>
            <td>
                <input type="hidden" name="request_id" value="<%= requestId %>">
                <button type="submit" class="btn btn-success">Assign</button>
            </td>
            <td>
				  <% 
				    String status = rs.getString("status");
				    if ("Assigned".equals(status)) { 
				  %>
				     <span style="color: red;"> Assigned</span>

				  <% 
				    } else if ("Completed".equals(status)) { 
				  %>
				      ✅ Completed
				  <% 
				    } else { 
				  %>
				      ⏳ Pending
				  <% } %>
				</td>

            
        </form>
    </tr>
<%
    }

    conn.close();
%>
    </tbody>
</table>

</body>
</html>
