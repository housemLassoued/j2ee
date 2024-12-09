<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<%@page import="Model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="connection.DBCon"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
User auth = (User) request.getSession().getAttribute("auth");

List<Product> products = null;
if (auth != null) {
    ProductDao productDao = new ProductDao(DBCon.getConnection());
    products = productDao.getAllProducts();
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Products</title>
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
    <h1 class="text-center my-4">Update Products</h1>
    <div class="container">
        <div class="card">
            <div class="card-header text-center">All Products</div>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Product Id</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Product Category</th>
                        <th scope="col">Product Price</th>
                        <th scope="col">Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if (products != null && !products.isEmpty()) {
                        for (Product p : products) {
                    %>
                    <tr>
                        <td><%= p.getId() %></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getCategory() %></td>
                        <td>$<%= dcf.format(p.getPrice()) %></td>
                        <td>
                            <a class="btn btn-sm btn-danger" href="EditProduct.jsp?id=<%= p.getId() %>">Update</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No products available.</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
