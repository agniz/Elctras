<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.electra.stringUtils.StringUtils" %>
      <%@ page import="com.electra.model.CategoryModel" %>
      <%@ page import="com.electra.controller.dao.CategoryDao" %>
      <%@ page import="java.util.List" %>
<%if (session.getAttribute("name") == null){
	response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
} %>
   <%
      CategoryDao catDao = new CategoryDao();
      List <CategoryModel> categories = catDao.getAllCategories();
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/addProduct.css">
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
                <h1>Create a New Product</h1>
                <a href="${pageContext.request.contextPath}/pages/adminPanel.jsp">
                    <i class="fa-solid fa-arrow-left"></i>
                    Back To Admin Page</a>
            </article>

            <section class="formContainer">
                <form  action="${pageContext.request.contextPath}<%= StringUtils.ADD_PRODUCT %>" method="post" enctype="multipart/form-data" class="productDetails">
                    <div class="firstCol col">
                        <section class="general formSection">
                            <h2>General Information</h2>
                            <article class="inputContainer">
                                <div class="inputField">
                                    <label for="productName">Product Name</label>
                                    <input placeholder="Product Name" type="text" name="productName" id="productName"
                                        required>
                                </div>
                                <div class="inputField">
                                    <label for="category">Select Category</label>
                                    <select required class="selectCat" name="category" id="category">
                                    <option value="catID" selected disabled>Choose Category</option>
                                     <%
                                     for(CategoryModel cat:categories){
                                     %>
                                      <option class="selectOption" value="<%out.print(cat.getCategoryId()); %>"><%out.println(cat.getCategoryName());%></option>
                                     <%} %>                                    
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
                                    <input class="gap" placeholder="Title 1" type="text" name="productDescriptionTitle1"
                                        required>
                                    <input class="gap" placeholder="Title 2" type="text" name="productDescriptionTitle2"
                                        required>
                                    <input class="gap" placeholder="Title 3" type="text" name="productDescriptionTitle3"
                                        required>
                                    <input class="gap" placeholder="Title 4" type="text"
                                        name="productDescriptionTitle4">
                                    <input class="gap" placeholder="Title 5" type="text"
                                        name="productDescriptionTitle5">
                                </div>
                                <div class="inputField">
                                    <label>Description Text</label>
                                    <input class="gap" placeholder="Text for Title 1" type="text"
                                        name="productDescriptionText1" required>
                                    <input class="gap" placeholder="Text for Title 2" type="text"
                                        name="productDescriptionText2" required>
                                    <input class="gap" placeholder="Text for Title 3" type="text"
                                        name="productDescriptionText3" required>
                                    <input class="gap" placeholder="Text for Title 4" type="text"
                                        name="productDescriptionText4">
                                    <input class="gap" placeholder="Text for Title 5" type="text"
                                        name="productDescriptionText5">
                                </div>
                            </article>
                            <section class="btn">
                                <button class="clear" type="reset">Clear</button>
                                <button class="publish" type="submit">Publish</button>
                            </section>
                        </section>
                    </div>
                    <div class="secondCol col">
                        <section class="formSection">
                            <h3>Product Image</h3>
                            <div class="image">
                                <label class="productImage" for="productImage">Upload Image</label>
                                <p class="text"><i class="fa-solid fa-circle-exclamation"></i> Pay attention to
                                    the
                                    quality of the image you add (important)</p>
                                <img class="userImage hidden" src="/" alt="">
                                <input required class="hidden imageInput" type="file" accept="image/*" name="productImage"
                                    id="productImage">
                            </div>
                        </section>
                        <section class="priceSection smallSection">
                            <label for="price">Price</label>
                            <input required placeholder="Price (in Rs)" type="number" name="price" autocomplete="off"
                                id="price">
                        </section>
                        <section class="stockSection smallSection">
                            <label for="stock">Quantity</label>
                            <input required placeholder="Total Stock" type="number" name="stock" autocomplete="off"
                                id="stock">
                        </section>
                        <section class="special">
                            <div class="checkBox">
                                <input value="yes" type="checkbox" name="feature" id="feature">
                                <label class="checkbox-label" for="feature">Featured Product</label>
                            </div>
                            <div class="checkBox">
                                <input value="yes" type="checkbox" name="trending" id="trending">
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
    const text = document.querySelector('.text')

    imageInput.addEventListener('change', () => {
        image.classList.remove('hidden')
        text.classList.add('hide')
        image.src = URL.createObjectURL(imageInput.files[0]);
        image.classList.add('containImage')
    })

    resetButton.addEventListener('click', () => {
        image.classList.remove('containImage');
        text.classList.remove('hide')
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