<nav class="navbar navbar-expand-lg bg-body-tertiary">
<div class="container">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Online Shopping Basket</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cart.jsp">Basket<span class="badge" style="background-color: black; color: white;">${cart_list.size()}</span>
          </a>
        </li>
        <% if (auth != null ) { %>
				<li class="nav-item">
          <a class="nav-link" href="orders.jsp">Shopping-Receipt</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="LogoutServlet">Logout</a>
          
        </li>
				<%
				} else {
				%>
				<li class="nav-item">
         
               <a class="nav-link" href="login.jsp">Login</a>
               </li>
				<%
				}
				%>
        
        
      </ul>
    </div>
  </div>
  </div>
</nav>