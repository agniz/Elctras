<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.electra.controller.dao.CartDao" %>
       <%@ page import="com.electra.controller.dao.UserDao" %>
          <%@ page import="com.electra.controller.dao.ProductDao" %>
       <%@ page import="com.electra.model.CartModel" %>
        <%@ page import="java.util.List" %>
         <%@ page import="com.electra.stringUtils.StringUtils" %>
    <%
// if customer is logged in
if (session.getAttribute("name") != null && "customer".equals(session.getAttribute("type"))) {
%>
 <div class="cartModel hidden">
            <section class=" cartAbsolute">
                <section class="cartContainer">
		<%
		UserDao userDao = new UserDao();
		ProductDao productDao = new ProductDao();
		String userName = (String) session.getAttribute("name");
		int userId = userDao.getUserId(userName);
      		CartDao cartDao = new CartDao();
      		List <CartModel> cart = cartDao.getAllCartItems(userId);
      	%>
                    <article class="cartTop">
                        <p>
                            <i class=" closeCart fa-solid fa-xmark"></i>
                            <span>Your Cart</span>
                        </p>
                        <p><%= cart.size()%> items</p>
                    </article>
                    <article class="cartMain">
                    <%
                    for(CartModel cartM:cart){ %>
                     <article class="cartProduct">
                            <div class="cartImage">
                                <img src="${pageContext.request.contextPath}/resources/images/products/<% out.print(cartM.getProductImage()); %>" alt="<% out.println(cartM.getProductName()); %>">
                            </div>
                            <div class="cartDescription">

                                <div class="sec1">
                                    <h1 class="cartPName"><%out.print(cartM.getProductName()); %></h1>
                                    <p class="cartPPrice">Rs <span class="priceNum"><%out.print(cartM.getProductPrice()); %></span> </p>
                                </div>
                                <form action="${pageContext.request.contextPath}<%= StringUtils.EDIT_CART_QUANTITY_SERVLET %>?productId=<%= cartM.getProductId() %>&userId=<%= userId %>" method="post">
                                <div class="sec2">
                                
                                    <div class="qtySection">
                                        <button class="minus-btn">-</button>
                                        <% int stock = productDao.getProductStock(cartM.getProductId()) ;%>
                                        <input type="text" name="quantity" class="cartQuantity" data-max="<%=stock %>" readonly value="<%out.print(cartM.getProductQuantity()); %>">
                                        <button class="plus-btn">+</button>
                                    </div>
                                    <div class="cartButton">
                                        <button type="submit" class="updateQCart hidden cartNBtn ">Update</button>
                                        <a href="${pageContext.request.contextPath}<%= StringUtils.DELETE_CART_SERVLET %>?productId=<%= cartM.getProductId() %>&userId=<%= userId %>" class="cartNBtn">Remove</a>

                                    </div>
                                </div>
                                </form>
                            </div>
                        </article>
                    <%} %>

                       

                       
                     
               
                      

                    </article>
                    <article class="cartBottom">
                        <div>
                        <%if(cart.size()==0){ %>
                         <a href="${pageContext.request.contextPath}/pages/shop.jsp">Add Items in Cart</a>
                        <%}else{%>
                        <a href="${pageContext.request.contextPath}/pages/checkout.jsp">CheckOut</a>
                        <%}%>
                           
                        </div>
                    </article>
                </section>

            </section>
        </div>
<%} else{ %>
        <div class="cartModel hidden">

            <div class="cartErrorMessage">
                <i class=" closeCart closeCartMsg fa-solid fa-xmark"></i>
                <h1>Please register or login before accessing the cart feature</h1>
                <div class="btnContainer">
                    <button class="cartLogin" onclick="window.location.href = '${pageContext.request.contextPath}/pages/login.jsp';">Login</button>
                    <button class="cartRegister" onclick="window.location.href = '${pageContext.request.contextPath}/pages/register.jsp';">Register</button>
                </div>
            </div>


        </div>
<%} %>
       