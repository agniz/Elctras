<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.electra.stringUtils.StringUtils" %>
<%if (session.getAttribute("name") == null){
	response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
} %>
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
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/adminPanel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/dashboard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/adminCategory.css">
                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/adminOrder.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/adminProduct.css">
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
                        <li data-id="dashboard" class="active sideLinks">
                                <i class="bx bxs-dashboard mr-3"></i>
                                DashBoard
                         </li>
                        <li data-id="category" class="sideLinks">
                                <i class="fa-solid fa-table-list"></i>
                                Category</li>
                        <li data-id="product" class="sideLinks">
                                <i class="fa-solid fa-laptop"></i>
                                Product</li>
                        <li data-id="order" class="sideLinks">
                                <i class="fa-solid fa-file-invoice"></i>

                                Orders</li>
                        <li data-id="customer" class="sideLinks">
                                <i class="fa-solid fa-user"></i>
                                Customers</li>
                    </ul>
                </article>
            </section>
        </aside>
        <section class="mainContent">

            <div class="topPart">
                <h1>Welcome,<%=session.getAttribute("name") %></h1>
                <div class="relative">
                    <button class="profileButton">
                        <img width="40" height="40" src="${pageContext.request.contextPath}/resources/images/mockups/adminProfile.png" alt="">
                    </button>
                    <ul class="profileList hidden">
                        <li><a href="${pageContext.request.contextPath}/pages/admin.jsp">
                          <i class="fa-regular fa-id-card"></i>
                        View Profile</a></li>
                        <li><a href="${pageContext.request.contextPath}/pages/registerAdmin.jsp">
                        <i class="fa-solid fa-user-plus"></i>
                        Add New Admin</a></li>
                        <li><a href="<%=request.getContextPath()%>/LogoutServlet">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        Log Out</a></li>
                    </ul>
                </div>
            </div>
           
       				<!-- DashBoard -->
              <article class=" tabs" data-id="dashboard">
              <jsp:include page = "dashboard.jsp"/>
            </article>
                   <!-- category -->
            <article class="tabs hide" data-id="category">
             <jsp:include page = "adminCategory.jsp"/>
            </article>
                   <!-- product -->
            <article class="tabs hide" data-id="product">
           <jsp:include page = "adminProduct.jsp"/>
            </article>
                   <!-- order -->
			<article class="tabs hide" data-id="order">
             <jsp:include page = "adminOrder.jsp"/>
            </article>
                   <!-- customer -->
			<article class="tabs hide" data-id="customer">
           <jsp:include page = "adminCustomer.jsp"/>
            </article>
        </section>
    </main>

</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Scripts/formatPrice.js"></script>
<script>

document.addEventListener("DOMContentLoaded", function() {
    // Select profile button
    const btn = document.querySelector(".profileButton");
    // Select profile links container
    const container = document.querySelector('.profileList');

    // Logic for showing and hiding profile links on clicking
    btn.addEventListener('click', () => {
    	
        container.classList.toggle('hidden');
    });

    // Select sidebar links and content
    const sidebarLinks = document.querySelectorAll(".sideLinks");
    const tabContent = document.querySelectorAll(".tabs");

    // Function to set active tab
    function setActiveTab(tabId) {
        sidebarLinks.forEach(link => {
            link.classList.remove('active');
            if (link.dataset.id === tabId) {
                link.classList.add('active');
            }
        });
        tabContent.forEach(content => {
            content.classList.add('hide');
            if (content.dataset.id === tabId) {
                content.classList.remove('hide');
            }
        });
    }

    // Event listener for sidebar links
    sidebarLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            const id = e.target.dataset.id;
            if (id) {
                setActiveTab(id);
                // Store active tab in local storage
                localStorage.setItem('activeTabAdmin', id);
            }
        });
    });

    // Retrieve active tab from local storage
    const activeTab = localStorage.getItem('activeTabAdmin');
    if (activeTab) {
        setActiveTab(activeTab);
    }
});


    
    // script for caregory tab
        // add form when clicking


    const form = document.querySelector('.form')
    const openButton = document.querySelector('.openForm')
    const closeButton = document.querySelector('.close')
    const image = document.querySelector('.userImage')
    const imageInput = document.querySelector('.imageInput')
    const resetButton = document.querySelector('.resetCat');
    openButton.addEventListener('click', (e) => {
        e.preventDefault();
        form.classList.remove('hidden')
    })
    closeButton.addEventListener('click', (e) => {
        e.preventDefault();
        form.classList.add('hidden')

    })
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
    	swal("Added", "Category Added Sucessfully","success")
    }else if(status == "failed"){
    	swal("Opps", "Failed to add category","error")
    }else if(status == "exists"){
    	swal("Error", "This category Exist Already","error")
    }else if(status == "server"){
    	swal("Error", "Internal Server Error","error")
    }else if(status == "default"){
    	swal("Opps", "Something Went Wrong","error")
    }else if(status =="deleteSuccess"){
    	swal("Deleted","Product Deleted Sucessfully","success")
    }else if(status =="Deletefailed"){
    	swal("Error","Error Deleting Product","error")
    }else if(status =="successEdit"){
    	swal("Updated","Product Updated Sucessfully","success")
    }else if(status =="failedEdit"){
    	swal("Error","Error Updating Product","error")
    }else if(status =="existsPro"){
    	swal("Error","This product name  Exist Already","error")
    }else if(status =="updated"){
    	swal("Changed","Order Status is changed","success")
    }else if(status =="failedStatus"){
    	swal("Error","Cant change status","error")
    }else if(status == "Adminsuccess"){
    	swal("Congrats", "Account Created Sucessfully, Please proceed to login page","success")
    }else if(status == "Adminfailed"){
    	swal("Opps", "Something is error","error")
    }else if(status =="fullName"){
    	swal("Opps","Invalid name","error")
    }else if(status =="username"){
    	swal("Opps","Invalid username, msut be of length of atleast 6 and no special character","error")
    }else if(status =="phoneNumber"){
    	swal("Opps","Invalid number","error")
    }else if(status =="password"){
    	swal("Opps","Invalid password","error")
    }else if(status =="usernameExist"){
    	swal("Opps","This username already exists","error")
    }else if(status =="phoneNumberExist"){
    	swal("Opps","This Phone Number already exists","error")
    }else if(status =="emailExist"){
    	swal("Opps","This email already exists","error")
    }
    
    

</script>

</html>