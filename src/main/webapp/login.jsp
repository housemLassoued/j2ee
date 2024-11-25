<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<%@page import="Model.Cart"%>
 <%@page import="java.util.*"%>

<%
         User auth = (User) request.getSession().getAttribute("auth");
         if (auth != null) {
         request.setAttribute("person", auth);
            }
         ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
     	if (cart_list != null) {
     		request.setAttribute("cart_list", cart_list);
     	}

%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%@include file="includes/head.jsp" %>
<style>
/* Style for the card */
.card {
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    overflow: hidden;
}

/* Card header */
.card-header {
    font-size: 18px;
    padding: 15px;
    font-weight: bold;
}

/* Form fields */
.form-group label {
    font-weight: bold;
}

/* Stylish button */
.btn-danger {
    background-color: #e63946;
    border: none;
    font-size: 16px;
    padding: 12px 20px;
    border-radius: 25px;
    transition: transform 0.2s ease-in-out, background-color 0.3s ease;
}

/* Button hover effect */
.btn-danger:hover {
    background-color: #b00020;
    transform: scale(1.05);
}

/* Center alignment */
.text-center {
    margin-top: 20px;
}
</style>
</head>
<body>
<%@include file="includes/Navbar.jsp" %>
<div class="container">
    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">You Can Login Here</div>
        <div class="card-body">
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="login-email" placeholder="Enter your Email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="login-password" placeholder="Enter your Password" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-danger">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
