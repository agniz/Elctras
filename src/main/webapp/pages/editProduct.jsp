<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.electra.stringUtils.StringUtils" %>
      <%@ page import="com.electra.model.CategoryModel" %>
       <%@ page import="com.electra.model.ProductModel" %>
      <%@ page import="com.electra.controller.dao.CategoryDao" %>
        <%@ page import="com.electra.controller.dao.ProductDao" %>
      <%@ page import="java.util.List" %>
<%if (session.getAttribute("name") == null){
	response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
} %>
   <%
      CategoryDao catDao = new CategoryDao();
   ProductDao productDao = new ProductDao();
      List <CategoryModel> categories = catDao.getAllCategories();
      String productId = request.getParameter("productId");
      ProductModel singleProduct = productDao.getProductDetailById(productId);
      %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin DashBoard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/variable.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/editProduct.css">
            <link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>

<body>
<input type="hidden" id="status" value="${sessionScope.status}">
 <%
 request.getSession().removeAttribute("status");

 %>
    <main>
        <aside>
            <section class="sideBar">
                <div class="logo">
                   <img src="${pageContext.request.contextPath}/resources/images/logo/electra.png" alt="logo">
                    <h1>Electra</h1>
                </div>
                <article class="sidebarLinksContainer">
                    <ul class="sideBarLinks">
                        <li data-id="dashboard" class=" sideLinks">
                            <i class="bx bxs-dashboard mr-3"></i>
                            DashBoard
                        </li>
                        <li data-id="category" class="sideLinks">
                            <i class="fa-solid fa-table-list"></i>
                            Category
                        </li>
                        <li data-id="product" class="active sideLinks">
                            <i class="fa-solid fa-laptop"></i>
                            Product
                        </li>
                        <li data-id="order" class="sideLinks">
                            <i class="fa-solid fa-file-invoice"></i>

                            Orders
                        </li>
                        <li data-id="customer" class="sideLinks">
                            <i class="fa-solid fa-user"></i>
                            Customers
                        </li>

                    </ul>
                </article>
            </section>
        </aside>
        <section class="mainContent">
            <article class="top">
                <h1>Edit Product</h1>
                <a href="${pageContext.request.contextPath}/pages/adminPanel.jsp">
                    <i class="fa-solid fa-arrow-left"></i>
                    Back To Admin Page</a>
            </article>

            <section class="formContainer">
                <form  action="${pageContext.request.contextPath}<%= StringUtils.EDIT_PRODUCT_SERVLET %>?image=<%=singleProduct.getProductImage() %>&productId=<%= request.getParameter("productId") %>" method="post" enctype="multipart/form-data" class="productDetails">
                    <div class="firstCol col">
                        <section class="general formSection">
                            <h2>General Information</h2>
                            <article class="inputContainer">
                                <div class="inputField">
                                    <label for="productName">Product Name</label>
                                    <input value="<%=singleProduct.getProductName()%>" placeholder="Product Name" type="text" name="productName" id="productName"
                                        required>
                                </div>
                                <div class="inputField">
                                    <label for="category">Select Category</label>
						<select required class="selectCat" name="category" id="category">
							    <option value="" disabled>Choose Category</option>
							    <% for(CategoryModel cat : categories) { %>
									<option class="selectOption" value="<%= cat.getCategoryId() %>" <%= singleProduct.getProductCategoryName().equals(cat.getCategoryName()) ? "selected" : "" %>><%= cat.getCategoryName() %></option>

							    <% } %>                                    
							</select>
                                </div>
                            </article>
                        </section>
                        <section class="description formSection">
                            <h2>Description</h2>
                            <p class="msg">Fill at least 3</p>
                            <article class="inputContainer">
                                <div class="inputField">
                                    <label>Description Title</label>
                                    <input value="<%=singleProduct.getProductDescriptionTitle1() %>" class="gap" placeholder="Title 1" type="text" name="productDescriptionTitle1"
                                        required>
                                    <input value="<%=singleProduct.getProductDescriptionTitle2() %>" class="gap" placeholder="Title 2" type="text" name="productDescriptionTitle2"
                                        required>
                                    <input value="<%=singleProduct.getProductDescriptionTitle3() %>" class="gap" placeholder="Title 3" type="text" name="productDescriptionTitle3"
                                        required>
                                    <input <%= singleProduct.getProductDescriptionTitle4() != null ? "value='" + singleProduct.getProductDescriptionTitle4() + "'" : "" %> class="gap" placeholder="Title 4" type="text" name="productDescriptionTitle4">
									<input <%= singleProduct.getProductDescriptionTitle5() != null ? "value='" + singleProduct.getProductDescriptionTitle5() + "'" : "" %> class="gap" placeholder="Title 5" type="text" name="productDescriptionTitle5">
                                </div>
                                <div class="inputField">
                                    <label>Description Text</label>
                                    <input value="<%=singleProduct.getProductDescriptionText1() %>" class="gap" placeholder="Text for Title 1" type="text"
                                        name="productDescriptionText1" required>
                                    <input value="<%=singleProduct.getProductDescriptionText2() %>"  class="gap" placeholder="Text for Title 2" type="text"
                                        name="productDescriptionText2" required>
                                    <input value="<%=singleProduct.getProductDescriptionText3() %>" class="gap" placeholder="Text for Title 3" type="text"
                                        name="productDescriptionText3" required>
                                    <input <%= singleProduct.getProductDescriptionText4() != null ? "value='" + singleProduct.getProductDescriptionText4() + "'" : "" %> class="gap" placeholder="Text for Title 4" type="text" name="productDescriptionText4">
									<input <%= singleProduct.getProductDescriptionText5() != null ? "value='" + singleProduct.getProductDescriptionText5() + "'" : "" %> class="gap" placeholder="Text for Title 5" type="text" name="productDescriptionText5">
                                </div>
                            </article>
                            <section class="btn">
                                <a class="clear" href='${pageContext.request.contextPath}/pages/adminPanel.jsp' class="clear">Cancel</a>
                                <button class="publish" type="submit">Update</button>
                            </section>
                        </section>
                    </div>
                    <div class="secondCol col">
                        <section class="formSection">
                            <h3>Product Image</h3>
                            <div class="image">
                                <label class="productImage" for="productImage">Upload Image</label>
                                <img class="userImage" src="${pageContext.request.contextPath}/resources/images/products/<% out.print(singleProduct.getProductImage()); %>" alt="<%= singleProduct.getProductName()%>">
                                <input class="hidden imageInput" type="file" accept="image/*" name="productImage"
                                    id="productImage">
                            </div>
                        </section>
                        <section class="priceSection smallSection">
                            <label for="price">Price</label>
                            <input value="<%= singleProduct.getProductPrice() %>" required placeholder="Price (in Rs)" type="number" name="price" autocomplete="off"
                                id="price">
                        </section>
                        <section class="stockSection smallSection">
                            <label for="stock">Quantity</label>
                            <input value="<%=singleProduct.getStock()%>" required placeholder="Total Stock" type="number" name="stock" autocomplete="off"
                                id="stock">
                        </section>
                        <section class="special">
                            <div class="checkBox">
                                <input  <%= singleProduct.getFeaturedItem() == 1 ? "checked" : "" %> value="yes" type="checkbox" name="feature" id="feature">
                                <label class="checkbox-label" for="feature">Featured Product</label>
                            </div>
                            <div class="checkBox">
                                <input <%= singleProduct.getTrendingItem() == 1 ? "checked" : "" %> value="yes" type="checkbox" name="trending" id="trending">
                                <label class="checkbox-label" for="trending">Trending Product</label>
                            </div>
                        </section>
                    </div>
                </form>
            </section>
        </section>
    </main>



</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>



    // add form when clicking


    const image = document.querySelector('.userImage')
    const imageInput = document.querySelector('.imageInput')
    const resetButton = document.querySelector('.clear');
    

    imageInput.addEventListener('change', () => {
        image.classList.remove('hidden')
     
        image.src = URL.createObjectURL(imageInput.files[0]);
        image.classList.add('containImage')
    })

    resetButton.addEventListener('click', () => {
        image.classList.remove('containImage');
     
        image.src = null;
        if (!image.classList.contains('containImage')) {
            image.classList.add('hidden')
        }
    })

     // show success and error message
     const status = document.getElementById("status").value;
    if(status == "success"){
    	swal("Added", "Product Added Sucessfully","success")
    }else if(status == "failed"){
    	swal("Opps", "Failed to add product","error")
    }else if(status == "exists"){
    	swal("Error", "This product Exist Already","error")
    }else if(status == "server"){
    	swal("Error", "Internal Server Error","error")
    }else if(status == "default"){
    	swal("Opps", "Something Went Wrong","error")
    }

</script>

</html>