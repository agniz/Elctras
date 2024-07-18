<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.electra.controller.dao.CartDao" %>
       <%@ page import="com.electra.controller.dao.UserDao" %>
          <%@ page import="com.electra.controller.dao.ProductDao" %>
       <%@ page import="com.electra.model.CartModel" %>
        <%@ page import="java.util.List" %>
         <%@ page import="com.electra.stringUtils.StringUtils" %>
          <%@ page import="com.electra.model.UserModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/reset.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/variable.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/nav.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/footer.css">
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/checkout.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/cart.css">
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
<input type="hidden" id="status" value="${sessionScope.status}">
 <%
 request.getSession().removeAttribute("status");

	UserDao userDao = new UserDao();
	String userName = (String) session.getAttribute("name");
	UserModel singleUser = userDao.getUserDetailByUserName(userName);
	int userId = userDao.getUserId(userName);
		CartDao cartDao = new CartDao();
		List <CartModel> cart = cartDao.getAllCartItems(userId);

 %>

  <jsp:include page = "navbar.jsp"/>
  <main>
<jsp:include page = "cart.jsp"/>
        <section class="container checkoutCont">
        <a class="back" href="${pageContext.request.contextPath}/pages/index.jsp">
                    <i class="fa-solid fa-arrow-left"></i>
                    Back</a>
            <form class="checkout" action="${pageContext.request.contextPath}<%= StringUtils.CHECKOUT_SERVLET %>" method="post" >
            
                <article class="shippingAddressForm">
                    <h1 class="topic">Payment Details</h1>
                    <section class="paymentForm">
                        <div class="cardDetail">
                            <h2 class="innerTopic">Card Details</h2>
                            <label for="cardName fullLabel">Card Holder Name</label>
                            <input required class="fullInput" type="text" id="cardName" name="cardName">
                            <label class="fullInput" for="cardNumber fullLabel">Card Number</label>
                            <input required class="fullInput" type="text" name="cardNumber"
                                placeholder="XXXX   XXXX  XXXX  XXXX" id="cardNumber">
                            <div class="row">
                                <div class="labelCont">
                                    <label for="expiry">Expiry Date</label>
                                    <label for="CVC">CVC</label>
                                </div>
                                <div class="inputCont">
                                    <input required placeholder="MM/YY" type="text" name="expiry" id="expiry">
                                    <input required type="number" name="CVC" placeholder="XXX" id="CVC">
                                </div>
                            </div>



                        </div>

                        <div class="shippingDetails">
                            <h2 class="innerTopic">Shipping Details</h2>
                            <div class="row">
                                <div class="labelCont">
                                    <label for="name">Name</label>
                                    <label class="num" for="number">Mobile Number</label>
                                </div>
                                <div class="inputCont">
                                    <input required value="<%= singleUser.getFullName() %>" type="text" id="name" name="name">
                                    <input required value="<%= singleUser.getPhoneNumber() %>" type="tel" name="number" id="number">
                                </div>


                            </div>
                            <label class="fullLabel" for="email">Email</label>
                            <input required value="<%= singleUser.getEmail() %>" class="fullInput" type="email" name="email" id="email">
                            <label class="fullLabel" for="address">Address</label>
                            <input required class="fullInput" type="text" name="address" id="address">
                            <label class="fullLabel" for="special">Any Special Message</label>
                            <input class="fullInput" type="text" name="special" id="special">
                        </div>

                    </section>
                </article>
                <article class="orderDetail">
                    <h1 class="topic">Order Summary</h1>
                    <div class="orderContainer">
                        <div class="singleOrderContainer">
                          <%
                          double subTotal = 0.00;
                    for(CartModel cartM:cart){ 
                    	  subTotal += cartM.getProductPrice() * cartM.getProductQuantity();
                    %>
                  
                       <section class="singleOrder">
                                <article class="itemDetail">
                                    <div class="itemImageContainer">
                                        <img class="itemImage" src="${pageContext.request.contextPath}/resources/images/products/<% out.print(cartM.getProductImage()); %>" alt="<% out.println(cartM.getProductName()); %>">
                                    </div>
                                    <div class="orderDetails">
                                        <h2 class="itemName"><%out.print(cartM.getProductName()); %></h2>
                                        <p class="itemPrice">Rs <span class="priceNum"><%out.print(cartM.getProductPrice()); %></span></p>
                                    </div>
                                </article>
                                <p class="itemQuantity">X <%out.print(cartM.getProductQuantity()); %></p>

                            </section>
                       
                       <%} %>
                            
                        </div>


                        <div class="subDetail">
                            <div class="subTotal sameLine">
                                <h4 class="amountText">Subtotal</h4>
                               
                                <p class="subTotalAmount amount">Rs  <span class="priceNum"><%= subTotal %></span> </p>
                            </div>
                            <div class="shipping sameLine">
                                <h4 class="amountText">Shipping</h4>
                                <p class="subTotalAmount amount">Rs 150</p>
                            </div>
                            <div class="line"></div>
                            <div class="total sameLine">
                                <h4 class="amountText">Total</h4>
                                <p class="totalAmount amount">Rs <span class="priceNum"><%= subTotal + 150 %></span></p>
                            </div>
                        </div>
                        <button class="checkOut" type="submit">Checkout</button>
                    </div>

                </article>
            </form>

        </section>

    </main>
     <jsp:include page = "footer.jsp"/>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/cart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/formatPrice.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/searchModel.js"></script>
<script>

// show linksFor users
const linkContainer = document.querySelector('.userLinks');
const btn = document.querySelector('.profile')
if(linkContainer){
    btn.addEventListener('click', () => {
        linkContainer.classList.toggle('hidden')
    })
}

const status = document.getElementById("status").value;
if(status == "cartAdded"){
	swal("Added", "Product has been added to cart sucessfully","success")
}else if(status == "error"){
	swal("Opps", "Something went wrong","error")
}else if(status == "server"){
	swal("Error", "Internal Server Error","error")
}else if(status == "default"){
	swal("Opps", "Something Went Wrong","error")
}else if(status =="deleteSuccess"){
	swal("Deleted","Product removed Sucessfully","success")
}else if(status =="Deletefailed"){
	swal("Error","Error removing Product","error")
}else if(status =="updateSuccess"){
	swal("Updated","Quantity updated Sucessfully","success")
}else if(status =="updatefailed"){
	swal("Error","Error updating quanity","error")
}else if(status =="orderPlacedFailed"){
	swal("Sorry","Your Order is not placed. Try Again,","error")
}
</script>
</html>