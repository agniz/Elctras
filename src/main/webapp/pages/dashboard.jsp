<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page import="com.electra.model.CategoryModel" %>
      <%@ page import="com.electra.controller.dao.CategoryDao" %>
      <%@ page import="java.util.List" %>
      <%@ page import="com.electra.stringUtils.StringUtils" %>
     <%@ page import="com.electra.controller.dao.ProductDao" %>
          <%@ page import="com.electra.controller.dao.OrderDetailsDao" %>
          <%@ page import="com.electra.model.OrderDetailsModel" %>
     <%@ page import="com.electra.model.ProductModel" %>
            <%@ page import="com.electra.controller.dao.UserDao" %>
            <%@ page import="com.electra.model.UserModel" %>
<%if (session.getAttribute("name") == null){
	response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
} %>
       <%
      CategoryDao catDao = new CategoryDao();
      List <CategoryModel> categories = catDao.getAllCategories();
      
      ProductDao pDao = new ProductDao();
      List <ProductModel> products = pDao.getAllProdcuts();
      
      OrderDetailsDao orderDao = new OrderDetailsDao();
      List <OrderDetailsModel> orders = orderDao.getAllOrders();
      
  	UserDao userDao = new UserDao();
  	List <UserModel> user = userDao.getAllUsers() ;
      %>
            <article class="dashboard">
                <div class="box">
                    <p class="number"><%= products.size() %></p>
                    <p class="text">Total Products</p>
                </div>
                <div class="box">
                    <p class="number"> <%= categories.size() %></p>
                    <p class="text">Total Category</p>
                </div>
                <div class="box">
                    <p class="number"><%= user.size() %></p>
                    <p class="text">Total Customers</p>
                </div>
                <div class="box">
                    <p class="number"><%= orders.size() %></p>
                    <p class="text">Total Orders</p>
                </div>
             
             
            </article>
           <article class="order">
    <section class="orderTop">
        <p>Pending Orders</p>
    </section>
    <div class="mainTable">
        <table class="content-table">
            <thead>
                <tr>
                    <th>S.N</th>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                int num = 1;
                for (OrderDetailsModel order : orders) {
                    if (order.getOrderStatus() == 0) { // Only display if order status is 0
                %>
                        <tr class="active-row">
                            <td><%= num++ %></td>
                            <td><% out.print(order.getOrderId()); %></td>
                            <td><% out.print(order.getCustomerUserName()); %></td>
                            <td><% out.print(order.getProduct_name()); %></td>
                            <td><% out.print(order.getOrderProductQuantity()); %></td>
                            <td>Rs <span class="priceNum"><% out.print(order.getTotalAmount()); %></span></td>
                            <td class="date">
                                <% out.print(order.getOrder_date()); %>
                            </td>
                        </tr>
                <% 
                    } 
                } 
                %>
            </tbody>
        </table>
    </div>
</article>
            