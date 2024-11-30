<%@page import="com.eveshoppingcart.model.User" %>

<nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color: #FF9A8B;">
  <div class="container">
    <a class="navbar-brand text-white" href="index.jsp">Indian Essence</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="aboutus.jsp">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="contact.jsp">Contact Us</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link text-white" href="cart.jsp">Cart<span class="badge text-bg-danger px1">${cart_list.size()}</span></a>
        </li>
        
        <%
            // Directly access 'auth' object set in the parent page
            
            if(auth != null){
        %>
            <!-- User is logged in -->
            <li class="nav-item"><a class="nav-link text-white" href="order.jsp">Order</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="log-out">Logout</a></li>
        <% } else { %>
            <!-- User is not logged in -->
            <li class="nav-item"><a class="nav-link text-white" href="login.jsp">Login</a></li>
        <% } %>
        
      </ul>
      <form class="d-flex ms-auto">
        <input class="form-control me-2" list="categories" type="search" placeholder="Search Categories" aria-label="Search">
        <datalist id="categories">
          <option value="Jewellery">
          <option value="Clutches">
        </datalist>
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
