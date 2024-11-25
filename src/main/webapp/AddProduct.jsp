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
    <title>Add New Products</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
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
        <h1 class="text-center mb-4">Add New Product</h1>
        <div class="card shadow p-4">
            <form action="AddProductstServlet" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label">Id of Product:</label>
                    <input type="number" name="id" class="form-control" placeholder="Enter product ID" required>
                </div>
                <div class="mb-3">
                    <label for="nom" class="form-label">Name of Product:</label>
                    <input type="text" name="nom" class="form-control" placeholder="Enter product name" required>
                </div>
                <div class="mb-3">
                    <label for="category" class="form-label">Category of Product:</label>
                    <input type="text" name="category" class="form-control" placeholder="Enter product category" required>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price of Product:</label>
                    <input type="number" step="0.01" name="price" class="form-control" placeholder="Enter product price" required>
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">Image URL:</label>
                    <input type="text" name="image" class="form-control" placeholder="Enter product image URL" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-danger w-100">Add Product</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
