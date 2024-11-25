<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<%@page import="dao.UserDao"%>
<%@page import="connection.DBCon"%>
<%@page import="java.util.*"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");

    List<User> users = null;
    if (auth != null) {
        UserDao userDao = new UserDao(DBCon.getConnection());
        users = userDao.getAllUsers();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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
    <h1 class="text-center my-4">Delete Users</h1>
    <div class="container">
        <div class="card">
            <div class="card-header text-center">All Users</div>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">User Id</th>
                        <th scope="col">User Name</th>
                        <th scope="col">User Email</th>
                        <th scope="col">User Password</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (users != null && !users.isEmpty()) { %>
                        <% for (User u : users) { %>
                            <tr>
                                <td><%= u.getId() %></td>
                                <td><%= u.getName() %></td>
                                <td><%= u.getEmail() %></td>
                                <td><%= u.getPassword() %></td>
                                <td>
                                    <a class="btn btn-sm btn-danger" href="DelUsersServlet?id=<%= u.getId() %>">Delete</a>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="5" class="text-center">No Users available.</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
