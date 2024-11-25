<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@page import="Model.User"%>
 <%@page import="java.util.*"%>
 <%@page import="Model.Cart"%>
 <%@page import="Model.Order"%>
 <%@page import="dao.OrderDao"%>
 <%@page import="connection.DBCon"%>
 <%@page import="java.text.DecimalFormat"%>
 

<%
 DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
    request.setAttribute("person", auth);
    OrderDao orderDao  = new OrderDao(DBCon.getConnection());
	orders = orderDao.userOrders(auth.getId());
}else{
	response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}

%>


<!DOCTYPE html>
<html>
<head>
    <title>Orders</title>
    <%@include file="includes/head.jsp" %>
    <style>
        .order-container {
            margin-top: 30px;
        }
        .card-header {
            background-color: #343a40;
            color: white;
            padding: 15px;
            font-size: 1.5rem;
        }
        .table {
            margin-top: 20px;
        }
        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
            transition: background-color 0.3s;
        }
        .btn-danger:hover {
            background-color: #b52b3a;
        }
        @media (max-width: 768px) {
            .card-header {
                font-size: 1.2rem;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <%@include file="includes/Navbar.jsp" %>
    <div class="container order-container">
        <div class="card-header my-3 text-center">All Orders</div>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Date</th>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (orders != null) {
                    for (Order o : orders) {
                %>
                <tr>
                    <td><%= o.getDate() %></td>
                    <td><%= o.getName() %></td>
                    <td><%= o.getCategory() %></td>
                    <td><%= o.getQunatity() %></td>
                    <td>M$<%= dcf.format(o.getPrice()) %></td>
                    <td>
                        <a class="btn btn-sm btn-danger" href="CancelOrderServlet?id=<%= o.getOrderId() %>">Cancel Order</a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center">No orders available.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    <%@include file="includes/footer.jsp" %>
</body>
</html>
