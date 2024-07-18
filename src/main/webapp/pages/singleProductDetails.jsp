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
      
      // Getting product id from url
      String productId = request.getParameter("productId");
      
      ProductDao productDao = new ProductDao();
      ProductModel singleProduct = productDao.getProductDetailById(productId);
      
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
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/singleProductDetails.css">
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
    <% if(singleProduct !=null){ %>
            <section class="singleProductContainer container">
                <a class="back" href="${pageContext.request.contextPath}/pages/shop.jsp">
                    <i class="fa-solid fa-arrow-left"></i>
                    Back</a>
            <div class="sImage">
                <img src="${pageContext.request.contextPath}/resources/images/products/<% out.print(singleProduct.getProductImage()); %>" alt="<%= singleProduct.getProductName()%>">
            </div>
            <article class="singleProductDetails">
                <div class="generalDetails">
                    <p class="singleProductCategory"><%=singleProduct.getProductCategoryName() %></p>
                    <h1 class="productTitle"><%=singleProduct.getProductName()%></h1>
                    <p class="singleProductPrice">Rs <span class="priceNum"><%= singleProduct.getProductPrice() %></span></p>
                </div>
                <div class="singleProductDescription">
                <section class="row">
                 <div class="singleDesc">
                        <h3><%=singleProduct.getProductDescriptionTitle1() %></h3>
                         <p><%=singleProduct.getProductDescriptionText1() %></p>
                    </div>
                     <div class="singleDesc">
                        <h3><%=singleProduct.getProductDescriptionTitle2() %></h3>
                         <p><%=singleProduct.getProductDescriptionText2() %></p>
                    </div>
                     <div class="singleDesc">
                        <h3><%=singleProduct.getProductDescriptionTitle3() %></h3>
                         <p><%=singleProduct.getProductDescriptionText3() %></p>
                    </div>
                </section>
                  <section class="row">
                    <%if(singleProduct.getProductDescriptionTitle4()!=null && singleProduct.getProductDescriptionText4()!=null ){ %>
                           <div class="singleDesc">
                        <h3><%=singleProduct.getProductDescriptionTitle4() %></h3>
                         <p><%=singleProduct.getProductDescriptionText4() %></p>
                    </div>
                    <%}
    				if(singleProduct.getProductDescriptionTitle5()!=null && singleProduct.getProductDescriptionText5()!=null ){	
    				%>
    				 <div class="singleDesc">
                        <h3><%=singleProduct.getProductDescriptionTitle5() %></h3>
                         <p><%=singleProduct.getProductDescriptionText5() %></p>
                    </div>
    				<%} %>
                  </section>
                   
                </div>
                <form action="${pageContext.request.contextPath}<%= StringUtils.CART_SERVLET %>?productId=<%= request.getParameter("productId") %>" method="post" class="cartForm">
                    <input required oninput="validateQuantity()" placeholder="Quantity" type="number"
                        name="quantity" id="quantity">
                    <button type="submit">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <p>Add to Cart</p>
                    </button>
                </form>
            </article>
        </section>
    <%} else{%>
    <section class="container">
    <p>This product is not available</p>
    </section>
    <%} %>
        <!-- Trending Items -->
        <section class="trendingItems container">
            <h1>Our <span class="designHeading">
                    Trending Items
                </span>
            </h1>
            <div class="trendingItemsContainer">
            <%for(ProductModel product:products){ %>
            <%if(product.getTrendingItem() == 1){ %>
                         <article class="singleProduct">
                    <div class="image">
                        <img  src="${pageContext.request.contextPath}/resources/images/products/<% out.print(product.getProductImage()); %>" alt="<% out.println(product.getProductName()); %>">
                        <a class="quickView" href="${pageContext.request.contextPath}/pages/singleProductDetails.jsp?productId=<%out.print(product.getProductId());%>">
                            <i class="fa-solid fa-eye"></i>
                            Quick View
                        </a>
                    </div>
                    <div class="details">
                        <p class="detailCategory"><%out.print(product.getProductCategoryName()); %></p>
                        <p class="detailProductName"><%out.print(product.getProductName());  %></p>
                        <p class="detailProductPrice">Rs <span class="priceNum"><%out.print(product.getProductPrice()); %></span></p>
                    </div>
                    <form action="${pageContext.request.contextPath}<%= StringUtils.CART_SERVLET %>?productId=<%out.print(product.getProductId()); %>" method="post" class="cartForm">
                    <input type="hidden" value="1" name="quantity" id="quantity">
                    <button type="submit" class="addCart">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span>Add To Cart</span>
                    </button>
                </form>
                </article>
            <%} %>
               
            <%} %>
            
               
            </div>


        </section>
    </main>
    <jsp:include page = "footer.jsp"/>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/formatPrice.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/cart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/searchModel.js"></script>
<script>

// script for scroll on mouse drag
const dragContainer = document.querySelectorAll('.trendingItemsContainer')
dragContainer.forEach((container) => {
    let isDragging = false;

    const dragging = e => {
        if (!isDragging) return;
        e.preventDefault();
        container.scrollLeft -= e.movementX;
    }
    const dragStop = () => {
        isDragging = false;
    }

    container.addEventListener("mousedown", () => isDragging = true);
    container.addEventListener("mousemove", dragging)
    document.addEventListener("mouseup", dragStop);
})



    // show linksFor users
    const linkContainer = document.querySelector('.userLinks');
    const btn = document.querySelector('.profile')
    if(linkContainer){
        btn.addEventListener('click', () => {
            linkContainer.classList.toggle('hidden')
        })
    }
    
    // script for managing stock while use enters quantity
    
    const minValue = 1;
    const maxValue = <%=singleProduct.getStock()%>;

    document.getElementById('quantity').setAttribute('min', minValue);
    document.getElementById('quantity').setAttribute('max', maxValue);

    function validateQuantity() {
        const input = document.getElementById('quantity');
        const quantity = input.value;

        if (quantity < minValue) {
            input.setCustomValidity("Quantity cant be less than 1");
        } else if (quantity > maxValue) {
            input.setCustomValidity("Only "+ maxValue +" stock remaining");
        } else {
            input.setCustomValidity('');
        }
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
    }else if(status =="login"){
    	swal("Please Login","Login before using cart feature","error")
    }

</script>

</html>