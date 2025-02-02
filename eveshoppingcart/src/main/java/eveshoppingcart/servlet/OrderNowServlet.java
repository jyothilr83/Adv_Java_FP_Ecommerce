package eveshoppingcart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.eveshoppingcart.connection.DbCon;
import com.eveshoppingcart.model.*;


import eveshoppingcart.doa.OrderDao;



@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            // Check if the user is authenticated
            User auth = (User) request.getSession().getAttribute("auth");
            if (auth != null) {
                // Debug: Check user ID
                System.out.println("Authenticated User ID: " + auth.getId());

                // Parse product ID and quantity
                String productId = request.getParameter("id");
                int productQuantity = 1;
                try {
                    productQuantity = Integer.parseInt(request.getParameter("quantity"));
                    if (productQuantity <= 0) productQuantity = 1;
                } catch (NumberFormatException e) {
                    System.out.println("Invalid quantity, defaulting to 1");
                }

                // Debug: Product and Quantity
                System.out.println("Product ID: " + productId);
                System.out.println("Quantity: " + productQuantity);

                // Set up the order model
                Order orderModel = new Order();
                orderModel.setId(Integer.parseInt(productId));
                orderModel.setUid(auth.getId());
                orderModel.setQuantity(productQuantity);
                orderModel.setDate(formatter.format(date));

                // Insert the order into the database
                OrderDao orderDao = new OrderDao(DbCon.getConnection());
                boolean result = orderDao.insertOrder(orderModel);

                if (result) {
                    // Remove the item from cart if order was successful
                    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                    if (cart_list != null) {
                        cart_list.removeIf(cartItem -> cartItem.getId() == Integer.parseInt(productId));
                    }

                    // Redirect to order.jsp
                    response.sendRedirect("order.jsp");
                } else {
                    // Log failure and inform the user
                    System.out.println("Order insertion failed in OrderDao.");
                    out.print("Order failed. Please try again.");
                }
            } else {
                // Redirect to login if the user is not authenticated
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception occurred: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Use doPost to handle POST requests and delegate to doGet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

