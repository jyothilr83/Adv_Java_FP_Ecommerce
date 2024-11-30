<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
   User auth = (User) request.getSession().getAttribute("auth");
   if (auth != null) {
       request.setAttribute("auth", auth);
   }
%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - Indian Essence</title>
    <%@ include file="includes/head.jsp" %>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    
    <div class="container my-5">
        <h2 class="text-center">About Us</h2>
        <p class="lead text-center">Welcome to Indian Essence! Where tradition meets modernity, and every piece tells a story.</p>
        
        <!-- Brand Story -->
        <div class="row my-4">
            <div class="col-md-12 text-center">
                <h3>Our Story</h3>
                <p>
                    Indian Essence began with a dream to bring the rich heritage of Indian artistry to the world. From humble beginnings as a small family business, we have grown into a trusted name for high-quality jewellery and clutches that exude elegance and charm. 
                </p>
            </div>
        </div>

        <!-- Mission & Values -->
        <div class="row">
            <div class="col-md-6">
                <h3>Our Mission</h3>
                <p>
                    At Indian Essence, our mission is to provide a unique shopping experience by offering premium quality jewellery and clutches, blending tradition with modern style. We aim to inspire confidence and elegance with every piece we create.
                </p>
            </div>
            <div class="col-md-6">
                <h3>Our Values</h3>
                <ul>
                    <li><strong>Quality:</strong> We use the finest materials to craft each piece of jewellery and clutch.</li>
                    <li><strong>Customer Satisfaction:</strong> We believe in delivering excellent customer service and products.</li>
                    <li><strong>Creativity:</strong> Our designs reflect creativity and timeless beauty.</li>
                    <li><strong>Sustainability:</strong> We care about the environment and strive to source materials responsibly.</li>
                </ul>
            </div>
        </div>
        
        <!-- Why Choose Us -->
        <div class="row my-4">
            <div class="col-md-12 text-center">
                <h3>Why Choose Us?</h3>
                <p>
                    We take pride in our craftsmanship and our ability to deliver products that not only look stunning but also hold sentimental value for our customers. Whether you're searching for a unique gift or a statement piece, Indian Essence is your trusted partner.
                </p>
            </div>
        </div>

        <!-- Call-to-Action -->
        <div class="row">
            <div class="col-md-12 text-center">
                <h4>Let Indian Essence add a touch of elegance to your wardrobe. Explore our collections today!</h4>
                <a href="products.jsp" class="btn btn-primary mt-3">Shop Now</a>
            </div>
        </div>
    </div>
    
    <%@ include file="includes/footer.jsp" %>
</body>
</html>