<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="d-flex flex-column p-3 bg-dark text-white" style="width: 250px; height: 100vh;">
    <h3 class="text-center mb-4">Admin Panel</h3>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item"><a href="view_requests.jsp" class="nav-link text-white">📨 View Requests</a></li>
        <li class="nav-item"><a href="assign_tasks.jsp" class="nav-link text-white">📝 Assign Tasks</a></li>
        <li class="nav-item"><a href="manage_inventory.jsp" class="nav-link text-white">📦 Inventory</a></li>
        <li class="nav-item"><a href="relief_centers.jsp" class="nav-link text-white">🏠 Relief Centers</a></li>
        <li class="nav-item"><a href="reports.jsp" class="nav-link text-white">📊 Reports</a></li>
        <li class="nav-item"><a href="logout.jsp" class="nav-link text-danger">🚪 Logout</a></li>
    </ul>
</div>
   
</body>
</html>