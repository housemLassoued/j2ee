<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<%@page import="Model.Cart"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductDao"%>
<%@page import="connection.DBCon"%>
<%
         User auth = (User) request.getSession().getAttribute("auth");
         if (auth != null) {
         request.setAttribute("person", auth);
            }
         DecimalFormat dcf = new DecimalFormat("#.##");
         request.setAttribute("dcf", dcf);
         ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
         List<Cart> cartProduct = null;
         if (cart_list != null) {
         	ProductDao pDao = new ProductDao(DBCon.getConnection());
         	cartProduct = pDao.getCartProducts(cart_list);
         	double total = pDao.getTotalCartPrice(cart_list);
         	request.setAttribute("total", total);
         	request.setAttribute("cart_list", cart_list);
         }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Products Page</title>
    <%@include file="includes/head.jsp" %>
    <style>
        .cart-container {
            margin-top: 30px;
        }
        .total-price-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .total-price-container h3 {
            font-size: 1.5rem;
            color: #333;
        }
        .btn-checkout {
            background-color: red;
            border-color: red;
            color: white;
            transition: background-color 0.2s;
        }
        .btn-checkout:hover {
            background-color: darkred;
            border-color: darkred;
        }
        .table {
            margin-top: 20px;
        }
        .btn-incre, .btn-decre {
            color: #007bff;
            font-size: 1.2rem;
        }
        .btn-incre:hover, .btn-decre:hover {
            color: darkblue;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-danger:hover {
            background-color: #b52b3a;
        }
        @media (max-width: 768px) {
            .total-price-container h3 {
                font-size: 1.2rem;
            }
            .btn-checkout {
                font-size: 0.9rem;
                padding: 5px 10px;
            }
        }
    </style>
</head>
<body>
    <%@include file="includes/Navbar.jsp" %>
    <div class="container cart-container">
        <div class="total-price-container">
            <h3>Total Price: M$ ${(total > 0) ? dcf.format(total) : 0}</h3>
            <a class="btn btn-checkout" href="CheckOutServlet">Check Out</a>
        </div>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Buy Now</th>
                    <th scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (cart_list != null) {
                    for (Cart c : cartProduct) {
                %>
                <tr>
                    <td><%=c.getName()%></td>
                    <td><%=c.getCategory()%></td>
                    <td>M$<%= dcf.format(c.getPrice()) %></td>
                    <td>
                        <form action="OrderNowServlet" method="post" class="form-inline">
                            <input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
                            <div class="d-flex align-items-center">
                                <a class="btn btn-link btn-incre" href="QuantityIncDecServlet?action=inc&id=<%=c.getId()%>">
                                    <i class="fas fa-plus-square"></i>
                                </a>
                                <input type="text" name="quantity" class="form-control text-center mx-2" style="width: 50px;" value="<%=c.getQuantity()%>" readonly>
                                <a class="btn btn-link btn-decre" href="QuantityIncDecServlet?action=dec&id=<%=c.getId()%>">
                                    <i class="fas fa-minus-square"></i>
                                </a>
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm mt-2">Buy</button>
                        </form>
                    </td>
                    <td>
                        <a href="RemoveFromCartServlet?id=<%=c.getId() %>" class="btn btn-danger btn-sm">Remove</a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">Your cart is empty.</td>
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
