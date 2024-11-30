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
    <title>Contact Us - Indian Essence</title>
    <%@include file="includes/head.jsp" %>
</head>
<body>
    <%@include file="includes/navbar.jsp" %>
    
    <div class="container my-5">
        <h2 class="text-center">Contact Us</h2>
        <form action="submit-contact" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Your Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Your Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Your Message</label>
                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Send Message</button>
        </form>
    </div>
    
    <%@include file="includes/footer.jsp" %>
</body>
</html>
