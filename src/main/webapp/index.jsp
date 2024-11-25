
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="connection.DBCon"%>
    <%@page import="Model.User"%>
    <%@page import="Model.Product"%>
    <%@page import="Model.Cart"%>
    <%@page import="dao.ProductDao"%>
    <%@page import="java.util.*"%>
    <%
         User auth = (User) request.getSession().getAttribute("auth");
         if (auth != null) {
         request.setAttribute("person", auth);
            }
         ProductDao pd = new ProductDao(DBCon.getConnection());
         List<Product> products = pd.getAllProducts();
         ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
         if (cart_list != null) {
         	request.setAttribute("cart_list", cart_list);
         }

%>

<!DOCTYPE html>
<html>
<head>
    <title>Do Shopping With Us</title>
    <%@include file="includes/head.jsp" %>
    <style>
        .card {
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .btn-dark {
            background-color: #343a40;
        }
        .btn-dark:hover {
            background-color: #495057;
        }
        .btn-primary {
            background-color: red; /* Change primary button to red */
            border-color: red;
        }
        .btn-primary:hover {
            background-color: darkred; /* Darker red on hover */
            border-color: darkred;
        }
        .container {
            margin-top: 20px;
        }
        .card-header {
            background-color: red !important; /* Change header to red */
            color: white;
        }
    </style>
</head>
<body>
<%@include file="includes/Navbar.jsp" %>
<div class="container">
    <div class="text-center my-4">
        <h1>Welcome to Our Store!</h1>
        <p>Browse our collection of high-quality products and enjoy a seamless shopping experience.</p>
    </div>
    <div class="card-header my-3">All Products</div>
    <div class="row row-cols-1 row-cols-md-3 g-4"> <!-- Ensure 3 cards per row -->
        <%
        if (!products.isEmpty()) {
            for (Product p : products) {
        %>
        <div class="col">
            <div class="card">
                <img class="card-img-top" src="product-images/<%=p.getImage() %>" alt="<%=p.getName() %>">
                <div class="card-body">
                    <h5 class="card-title text-truncate"><%=p.getName() %></h5>
                    <h6 class="price text-success">Price: M$<%=p.getPrice() %></h6>
                    <h6 class="category text-muted">Category: <%=p.getCategory() %></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a class="btn btn-dark" href="AddToCartServlet?id=<%=p.getId()%>">Add to Cart</a>
                        <a class="btn btn-primary" href="OrderNowServlet?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12 text-center">
            <p class="text-muted">There are no products available at the moment.</p>
        </div>
        <%
        }
        %>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
