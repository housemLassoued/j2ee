<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<%@page import="dao.UserDao"%>
<%@page import="connection.DBCon"%>
<%
    // Récupérer l'ID du produit à modifier
    int userId = Integer.parseInt(request.getParameter("id"));
    UserDao userDAO = new UserDao(DBCon.getConnection());
    User user = userDAO.getSingleUser(userId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h3>Edit User</h3>
        <form action="UpdateUserServlet" method="post">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= user.getName() %>" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>
            
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="text" class="form-control" id="password" name="password" value="<%= user.getPassword() %>" required>
            </div>
            <button type="submit" class="btn btn-success">Update User</button>
        </form>
    </div>
    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
