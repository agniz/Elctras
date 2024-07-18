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
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/aboutUs.css">
         
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

         <section class="container about">
            <article class="business">
                <h1 class="businessName">About Electra</h1>
                <p class="businessText">Discover Electra, your ultimate online destination for a vast selection of tech
                    accessories that seamlessly integrate
                    into your daily life. From the cutting-edge laptops and smartphones that power your digital world to
                    the
                    immersive
                    gaming items and wearable technology that keep you connected and entertained, Electra offers a
                    curated
                    assortment of
                    products designed to elevate your tech experience. Our commitment to quality and innovation ensures
                    that
                    every item in
                    our catalog is selected with care, guaranteeing that our customers have access to the latest and
                    most
                    reliable tech
                    accessories. Whether you're enhancing your productivity with a new laptop, staying connected with
                    the
                    latest smartphones
                    and accessories, or exploring the world gaming, Electra is your go-to source for all things tech.
                    Join
                    us in navigating
                    the exciting landscape of technology and let us help you find the perfect accessory to enrich your
                    digital journey.</p>
            </article>
            <article class="aboutUs">
                <div class="contactRow firstRow">
                    <div class="person">
                        <div class="perImage">
                            <img src="${pageContext.request.contextPath}/resources//images/aboutUs/nilakwebsite.jpg" alt="">
                        </div>
                        <h1>Nilak Pathak</h1>
                        <p>nilakpathak14@gmail.com</p>
                    </div>
                    <div class="person">
                        <div class="perImage">
                            <img src="${pageContext.request.contextPath}/resources//images/aboutUs/utsab.jpeg" alt="">
                        </div>
                        <h1>Utsab Devkota</h1>
                        <p>info.utsab10@gmail.com</p>
                    </div>
                </div>
                <div class="contactRow secondRow">
                    <div class="person">
                        <div class="perImage">
                            <img src="${pageContext.request.contextPath}/resources//images/aboutUs/biswas.jpeg" alt="">
                        </div>
                        <h1>Biswas B.K</h1>
                        <p>lohanibiswas1@gmail.com</p>
                    </div>
                    <div class="person">
                        <div class="perImage">
                            <img src="${pageContext.request.contextPath}/resources//images/aboutUs/agniz.jpeg" alt="">
                        </div>
                        <h1>Agniz Panthy</h1>
                        <p>asragniz553@gmail.com</p>
                    </div>
                    <div class="person">
                        <div class="perImage">
                            <img src="${pageContext.request.contextPath}/resources//images/aboutUs/mandeep.jpeg" alt="">
                        </div>
                        <h1>Mandeep Raj Bhandari</h1>
                        <p>mandeeprajbhandari12@gmail.com</p>
                    </div>
                </div>
            </article>
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