<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ page import="com.electra.stringUtils.StringUtils" %>
      <%@ page import="com.electra.model.CategoryModel" %>
      <%@ page import="com.electra.controller.dao.CategoryDao" %>
      <%@ page import="java.util.List" %>
      <%@ page import="com.electra.controller.dao.ProductDao" %>
      <%@ page import="com.electra.model.ProductModel" %>
      <%
      	CategoryDao catDao = new CategoryDao();
      	List <CategoryModel> categories = catDao.getAllCategories();
      
      	ProductDao pDao = new ProductDao();
      	List <ProductModel> products = pDao.getAllProdcuts();
      %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electra</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/reset.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/variable.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/nav.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/footer.css">
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/contact.css">
         
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/cart.css">
			  <link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>

<body>
<input type="hidden" id="status" value="${sessionScope.status}">
 <%
 request.getSession().removeAttribute("status");

 %>
   <jsp:include page="navbar.jsp">
    <jsp:param name="activePage" value="home"/>
</jsp:include>
    <main>


  <jsp:include page = "cart.jsp"/>

 <section class="contactPage">
            <!--Adding Details of Business-->
            <section class="container businessDetail">
                <div class="details">
                    <h1>GET IN TOUCH</h1>
                    <h2>Visit our shop or contact us today</h2>
                    <h3>Head Office</h3>
                    <ul>
                        <li>
                            <i class="fa-solid fa-location-dot"></i>
                            <p>Pokhara-12-Hospital_Chowk</p>
                        </li>
                        <li>
                            <i class="fa-solid fa-envelope"></i>
                            <p>info.electra@gmail.com</p>
                        </li>
                        <li class="Phone">
                            <i class="fa-solid fa-phone"></i>
                            <p>9823102475</p>
                        </li>

                    </ul>
                </div>
                <!--Adding Map by showing our Location-->
                <div class="map">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14063.007118096028!2d83.99162893009357!3d28.21485312134921!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39959434ad2a5bf9%3A0xf4e7f9c749f63113!2sInformatics%20College%20Pokhara!5e0!3m2!1sen!2snp!4v1673676550969!5m2!1sen!2snp"
                        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </section>
            <section class="container contactForm">
                <form class="formElementContact" action="#">
                    <p>Leave a Message</p>
                    <h2>We would to love to hear form you</h2>
                    <div class="formDetail">
                        <label for="fullName">Full Name</label>
                        <input placeholder="Enter full name" type="text" name="fullName" id="fullName">
                        <label for="email">Email</label>
                        <input placeholder="Enter Email" type="email" name="email" id="email">
                        <label for="phone">Contact Number</label>
                        <input placeholder="Enter contact number" type="text" name="phone" id="phone">
                        <label for="message">Message</label>
                        <textarea rows="8" name="message" id="message"></textarea>
                    </div>
                    <button class="send">Send</button>
                </form>
            </section>
        </section>


       
    </main>
    <jsp:include page = "footer.jsp"/>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/formatPrice.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/cart.js"></script>
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
    }else if(status =="orderPlaced"){
    	swal("Confirm","Your Order has been Confirmed","success")
    }else if(status =="login"){
    	swal("Please Login","Login before using cart feature","error")
    }

</script>

</html>