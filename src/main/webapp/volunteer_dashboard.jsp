<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volunteer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
 /* Navbar styles */
        .navbar {
            background-color: #2471a3 !important;
            padding: 2px 2px;
        }
        .navbar-collapse {
            display: flex;
            justify-content: space-between;
        }
        .nav-btn {
            margin-left: 20px;
            color: white !important;
            background-color: transparent;
            padding: 2px 10px;
            font-size: 1.1rem;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            font-weight: bold;
            text-decoration: underline;
        }
        .nav-btn:hover {
            background-color: #ff7f50;
            color: white !important;
            border: 1px solid #ff7f50;
        }
        /* Auto-scrolling quote text */
        .quote-container {
            flex-grow: 1;
            width: 100%;
            overflow: hidden;
            margin-left: 5px;
            border-left: 3px solid #ff7f50;
            padding: 2px 6px;
        }
        .quote-text {
            display: inline-block;
            font-style: italic;
            color: white;
            font-size: 1.1rem;
            white-space: nowrap;
            animation: marquee 15s linear infinite;
        }
        @keyframes marquee {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }
        .quote-text:hover {
            animation-play-state: paused;
        }
</style>

<script>
    function confirmLogout() {
        return confirm("Are you sure you want to logout?");
    }
</script>

</head>
<body style="background-color: #f8f9fa; padding: 20px;">

<%
    String volunteerUsername = (String) session.getAttribute("username");
    if (volunteerUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int taskCount = 0;
%>

  <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><img src="${pageContext.request.contextPath}/Images/logo2.jpg" alt="Navbar Logo" width="120" height="80"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav quote-nav">
                        <li class="nav-item">
                            <div class="quote-container">
                                <span class="quote-text">Stay positive, work hard, make it happen! Your dreams are within reach, keep pushing forward with determination and courage!</span>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                     <a class="nav-link nav-btn" href="logout.jsp" onclick="return confirmLogout();">Logout</a>
                        </li>
                   </ul>
                </div>
            </div>
        </nav>

<div class="container">
    <h2 style=" background-color: #f5cba7;
                 color: black;
                 padding:20px;
                 margin-top:10px;" >Welcome, <%= volunteerUsername %>!</h2>

    <div class="row mb-4">
        <div class="col">
            <div class="card text-white bg-primary mb-3">
                <div style="background-color: #2471a3;
                            color:white;
                           " class="card-body">
                    <h5 class="card-title">Assigned Tasks</h5>
                    <p class="card-text">
                    
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root");

                                String sql = "SELECT COUNT(*) AS task_count FROM tasks t " +
                                             "JOIN requests r ON t.request_id = r.id " +
                                             "JOIN users u ON t.volunteer_id = u.id " +
                                             "WHERE u.username = ?";
                                PreparedStatement pst = con.prepareStatement(sql);
                                pst.setString(1, volunteerUsername);
                                ResultSet rs = pst.executeQuery();
                                if (rs.next()) {
                                    taskCount = rs.getInt("task_count");
                                    out.println(taskCount);
                                }
                                con.close();
                            } catch (Exception e) {
                                out.println("Error: " + e.getMessage());
                            }
                        %>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <h4>Task List</h4>
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Task ID</th>
                <th>Victim Username</th>
                <th>Help Type</th>
                <th>Description</th>
                <th>Assigned Date</th>
                <th>Status</th>
                
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/disaster_relief", "root", "root");

                String query = "SELECT t.task_id, r.username, r.help_type, r.description, t.assigned_date, t.status " +
                               "FROM tasks t " +
                               "JOIN requests r ON t.request_id = r.id " +
                               "JOIN users u ON t.volunteer_id = u.id " +
                               "WHERE u.username = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, volunteerUsername);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("task_id") %></td>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("help_type") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getTimestamp("assigned_date") %></td>
                <td>
				    <%= rs.getString("status") %>
				    <% if ("Assigned".equals(rs.getString("status"))) { %>
				        <form action="MarkTaskCompletedServlet" method="post" style="display:inline;">
				            <input type="hidden" name="taskId" value="<%= rs.getInt("task_id") %>"/>
				            <button type="submit" class="btn btn-success btn-sm ms-2">Mark as Completed</button>
				        </form>
				    <% } %>
				</td>
                
            </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
