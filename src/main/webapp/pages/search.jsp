<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ page import="com.electra.stringUtils.StringUtils" %>
      <%@ page import="com.electra.model.CategoryModel" %>
       <%@ page import="com.electra.model.ProductModel" %>
      <%@ page import="com.electra.controller.dao.CategoryDao" %>
        <%@ page import="com.electra.controller.dao.ProductDao" %>

        
      <%@ page import="java.util.List" %>
           <%
         String searchParameter = request.getParameter("search");
      CategoryDao catDao = new CategoryDao();
      List <CategoryModel> categories = catDao.getAllCategories();
      
      ProductDao pDao = new ProductDao();
      
      
      
      List <ProductModel> products = pDao.searchProduct(searchParameter);
   
  
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
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/shop.css">
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
        <section class="shopTop">
            <article class="shopHero">
                <div class="shopHeroText">
                    <h1>Your One-Stop Shop <br> for Electronic Rentals</h1>
                    <p>Looking for affordable and convenient electronic <br>rentals? Look no further than Electra</p>
                    <a class="shopBtn" href="#products">Shop Now</a>
                </div>
                <div class="shopHeroImage">
                    <img src="${pageContext.request.contextPath}/resources/images/banner/laptop banner.jpg" alt="">
                </div>
            </article>
        </section>

        <section id="products" class="products">

        
        <% 
      if(products.isEmpty()){ %>
      <h1 class="notFoundMessage">No Such product found</h1>
      
      <%} else{ 
        for(ProductModel product:products){ %>
         <article data-catId = "<%out.print(product.getProductCategoryId()); %>" class="shopSingleProduct">
                <a href="${pageContext.request.contextPath}/pages/singleProductDetails.jsp?productId=<%out.print(product.getProductId());%>">
                    <div class="sProductImage">
                        <img  src="${pageContext.request.contextPath}/resources/images/products/<% out.print(product.getProductImage()); %>" alt="<% out.println(product.getProductName()); %>">
                    </div>
                </a>
                <div class="sProductDetail">
                    <h2 class="sProductName"><%out.print(product.getProductName()); %></h2>
                    <p class="sProductCategoryName"><%out.print(product.getProductCategoryName()); %></p>
                            <p class="sProductPrice">Rs <span class="priceNum"><%out.print(product.getProductPrice()); %></span> </p>

                </div>
            </article>
        <%}} %>
           
            

        </section>
    </main>

        
    <jsp:include page = "footer.jsp"/>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/formatPrice.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/cart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/searchModel.js"></script>
<script>


    

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
    }
</script>

</html>