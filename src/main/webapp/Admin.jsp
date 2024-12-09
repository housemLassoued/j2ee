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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Online Shopping Basket</a>
            <div class="d-flex">
                <% if (auth != null) { %>
                    <a class="btn btn-outline-danger" href="LogoutServlet">Logout</a>
                <% } %>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <div class="row">
            <!-- Product Management Section -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        Products Management
                    </div>
                    <div class="card-body">
                        <a href="AddProduct.jsp" class="btn btn-success w-100 mb-2">Add New Products</a>
                        <a href="DelProduct.jsp" class="btn btn-danger w-100 mb-2">Delete Products</a>
                        <a href="UpdateProduct.jsp" class="btn btn-warning w-100">Update Products</a>
                    </div>
                </div>
            </div>

            <!-- User Management Section -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-secondary text-white">
                        Users Management
                    </div>
                    <div class="card-body">
                        <a href="AddUser.jsp" class="btn btn-success w-100 mb-2">Add New Users</a>
                        <a href="DelUser.jsp" class="btn btn-danger w-100 mb-2">Delete Users</a>
                        <a href="UpdateUser.jsp" class="btn btn-warning w-100">Update Users</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <%@include file="includes/footer.jsp" %>
</body>
</html>
