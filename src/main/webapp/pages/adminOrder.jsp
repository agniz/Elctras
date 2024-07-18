<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ page import="com.electra.stringUtils.StringUtils" %>
           <%@ page import="com.electra.controller.dao.OrderDetailsDao" %>
            <%@ page import="com.electra.model.OrderDetailsModel" %>
            <%@ page import="java.util.List" %>
           
           
<%if (session.getAttribute("name") == null){
	response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
} 
OrderDetailsDao orderDao = new OrderDetailsDao();
List <OrderDetailsModel> orders = orderDao.getAllOrders();
%>
 <article class="order">
                    <section class="orderTop">
                        <p>Total Orders: <%= orders.size() %></p>
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
                                    <th>Update Status</th>
                                    

                                </tr>
                            </thead>
                            <tbody>
                             <%
                            int num = 1;
                            for(OrderDetailsModel order:orders){ 
                            %>
                                   <tr class="active-row">
                                    <td><%=num++ %></td>
                                    <td><%out.print(order.getOrderId()); %></td>
                                    <td><%out.print(order.getCustomerUserName()); %></td>
                                    <td><%out.print(order.getProduct_name()); %></td>
                                    <td><%out.print(order.getOrderProductQuantity()); %></td>
                                    <td>Rs <span class="priceNum"><%out.print(order.getTotalAmount()); %></span></td>
                                    <td class="date"> 
                                    <%out.print(order.getOrder_date()); %>
                                    </td>
                                  
                                    <td>
                                       <form action="${pageContext.request.contextPath}<%= StringUtils.UPDATE_ORDER_STATUS %>" method="post">
										    <input type="hidden" name="orderId" value="<%= order.getOrderDetailId() %>">
										    <select name="orderStatus" class="selectOrderStatus" onchange="this.form.submit()">
										        <option value="0" <%= order.getOrderStatus() == 0 ? "selected" : "" %>>Pending</option>
										        <option value="1" <%= order.getOrderStatus() == 1 ? "selected" : "" %>>Shipping</option>
										        <option value="2" <%= order.getOrderStatus() == 2 ? "selected" : "" %>>Delivered</option>
										    </select>
										</form>
                                       
                                    </td>
                                </tr>
                            <%} %>
                         


                            </tbody>
                        </table>
                    </div>
                </article>