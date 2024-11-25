<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Model.User"%>
<%
         User auth = (User) request.getSession().getAttribute("auth");
         if (auth != null) {
         request.setAttribute("person", auth);
            }
         
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Users</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Online Shopping Basket</a>
                <div class="d-flex">
                    <% if (auth != null) { %>
                        <a class="btn btn-outline-danger" href="LogoutServlet">Logout</a>
                    <% } %>
                </div>
            </div>
        </nav>
        <h1 class="text-center mb-4">Add New User</h1>
        <div class="card shadow p-4">
            <form action="AddUserServlet" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label">Id of User:</label>
                    <input type="number" name="id" class="form-control" placeholder="Enter User ID" required>
                </div>
                <div class="mb-3">
                    <label for="nom" class="form-label">Name of User:</label>
                    <input type="text" name="nom" class="form-control" placeholder="Enter User name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email of User:</label>
                    <input type="email" name="email" class="form-control" placeholder="Enter User Email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password of User:</label>
                    <input type="password"  name="password" class="form-control" placeholder="Enter User password" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-danger w-100">Add User</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
