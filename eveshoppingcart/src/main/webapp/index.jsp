<%@page import="java.util.List"%>
<%@page import="eveshoppingcart.doa.ProductDao" %>
<%@page import="com.eveshoppingcart.connection.DbCon" %>
<%@page import="com.eveshoppingcart.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   User auth = (User)request.getSession().getAttribute("auth");
   if(auth!=null){
	   request.setAttribute("auth", auth);
   }
   ProductDao pd = new ProductDao(DbCon.getConnection());
   List<Product> products = pd.getAllProducts();
   %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to my Shopping Cart</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container">
	<div class="card-header my-3">All Products</div>
	<div class="row">
	<%
	if(!products.isEmpty()){
		for(Product p:products){%>
			<div class="col-md-3">
			<div class="card w-100" style="width: 18rem;">
		  		<img src="product-images/<%= p.getImage() %>" class="card-img-top" alt="Card Image">
		  		<div class="card-body">
		    <h5 class="card-title"><%= p.getName()%></h5>
		    <h5 class="price">Price: $<%= p.getPrice() %></h5>
		    <h5 class="category">Category: <%= p.getCategory() %></h5>
		    <div class="mt-3 d-flex justify-content-between">
		    <a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark">Add to Cart</a>
		    <a href="order-now?quantity=1&id=<%=p.getId() %>"class="btn btn-primary">Buy Now</a>
		   		 </div>
		    	</div>
		  	</div>
			</div>
		<%}
	}
	%>
	
</div>

</div>


<%@include file="includes/footer.jsp" %>
</body>
</html>