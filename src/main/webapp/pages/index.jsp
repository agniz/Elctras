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
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/index.css">
         
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



        <!-- hero section -->
        <section class="hero-container">
            <article class="hero">
                <div class="heroImage">
                    <img src="${pageContext.request.contextPath}/resources/images/mockups/VR.png" alt="VR">
                </div>
                <article class="text">
                    <p class="smText">Shop smart gadgets for a smarter life</p>
                    <h1 class="bText">The <span class="animate-text">
                            Ultimate
                            <svg class="line-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 150"
                                preserveAspectRatio="none">
                                <path class="line" d="M5.5 128.883C149.207 118.384 400.838 103.383 800.5 125.883">
                                </path>
                            </svg>
                        </span> VR Experience on a budget</h1>
                    <button class="hero-btn">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span>Buy Now</span>
                    </button>
                </article>
            </article>
        </section>

        <!-- Category show section -->
   
        <section class="category container">
             <%
        for(CategoryModel cat:categories){
        %>
                    <article class="singleCategory">
                <div class="categoryDetails">
                    <h2><%out.println(cat.getCategoryName());%></h2>
                    <p>100 Products</p>
                </div>
                <div class="categoryImage">
                    <img data-id="<%out.println(cat.getCategoryId());%>" width=200  src="${pageContext.request.contextPath}/resources/images/category/<% out.println(cat.getCategoryImage()); %>" alt="<% out.println(cat.getCategoryName()); %>">
                </div>
            </article>
        <%
        }
        %>
        </section>

        <!-- brands section -->

        <section class="showBrands">
            <article class="scroller">
                <img src="${pageContext.request.contextPath}/resources/images/Brands/apple.jpeg" alt="apple">
                <img src="${pageContext.request.contextPath}/resources/images/Brands/asus.jpeg" alt="asus">
                <img src="${pageContext.request.contextPath}/resources/images/Brands/dell.jpeg" alt="dell">
                <img src="${pageContext.request.contextPath}/resources/images/Brands/lg.jpeg" alt="lg">
                <img src="${pageContext.request.contextPath}/resources/images/Brands/samsung.jpeg" alt="samsung">
                <img src="${pageContext.request.contextPath}/resources/images/Brands/sony.jpeg" alt="sony">
               
            </article>

        </section>

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

        <section class="exclusiveProduct">
            <article class="exclusiveProductContainer container">
                <div class="exclusiveProductImage">
                    <img src="${pageContext.request.contextPath}/resources/images/products/smartBand4.png" alt="smartBand4">
                </div>
                <div class="exclusiveProductText">
                    <span>Exclusively Available on Electra</span>
                    <h2>Smart Band 4</h2>
                    <p>The MI Smart Band 4 features a larger AMOLED, color and full-touch display with adjustable
                        brightness, so everything is clear as can be.</p>
                    <a class="hero-btn" href="${pageContext.request.contextPath}/pages/singleProductDetails.jsp?productId=45">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span>Buy Now</span>
                    </a>
                </div>
            </article>
        </section>

        <section class="trendingItems container">
            <h1> <span class="designHeading">
                    Featured Items
                </span> For You
            </h1>
            <div class="trendingItemsContainer">
                <%for(ProductModel product:products){ %>
            <%if(product.getFeaturedItem() == 1){ %>
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
    // script for smooth brand scroll
    const brands = document.querySelector('.showBrands');
    const scroll = brands.querySelector('.scroller');
    const scrollerContent = Array.from(scroll.children);

    scrollerContent.forEach(item => {
        const duplicatedItems = item.cloneNode(true);
        scroll.appendChild(duplicatedItems)
    })

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