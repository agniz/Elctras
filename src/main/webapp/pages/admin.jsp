
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/variable.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/customer.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/changePassword.css">
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/customerProfile.css">
  
       
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
                <a class="back" href="${pageContext.request.contextPath}/pages/adminPanel.jsp">
                    <i class="fa-solid fa-arrow-left"></i>
                    Back</a>
                <article class="sidebarLinksContainer">
                    <ul class="sideBarLinks">
                        <li data-id="info" class="active sideLinks">
                            My Profile
                        </li>

                        <li data-id="changePassword" class="sideLinks">
                            Change Password
                        </li>
                       
                    </ul>
                </article>
            </section>
        </aside>
        <section class="mainContent">

            <!-- info -->
            <article class=" tabs" data-id="info">
              <jsp:include page = "adminProfile.jsp"/>
            </article>

          
            <!-- changePassword -->
            <article class="tabs hide" data-id="changePassword">
              <jsp:include page = "adminPassword.jsp"/>
            </article>
        </section>
    </main>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {

        // Select profile links container
        const container = document.querySelector('.userLinks');



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
                    localStorage.setItem('activeTabCustomer', id);
                }
            });
        });

        // Retrieve active tab from local storage
        const activeTab = localStorage.getItem('activeTabCustomer');
        if (activeTab) {
            setActiveTab(activeTab);
        }
    });


    // show-hide password
    const passwordBtn = document.querySelectorAll(".showPassword");
    const passwordField = document.querySelectorAll('.passInput');


    passwordBtn.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            passwordField.forEach(field => {
                if (field.dataset.id === btn.dataset.id) {
                    if (field.type === "password") {
                        field.type = "text"
                         btn.querySelector('.passImage').src = "${pageContext.request.contextPath}/resources/images/loginRegister/hidePassword.png";
                       

                    } else {
                        field.type = "password"
                         btn.querySelector('.passImage').src = "${pageContext.request.contextPath}/resources/images/loginRegister/showPassword.png";
                      

                    }
                }
            })
        })
    })
    const password = document.querySelector('input[name="newPassword"]')
    const rePassword = document.querySelector('input[name="rePassword"]');
    const btn = document.querySelector('.submitBtn')
    const rePasswordMsg = document.querySelector('.repasswordP')
    const passwordMsg = document.querySelector('.passwordP')
    // password validation
    function validatePassword(password) {
        const regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/;
        return regex.test(password);
    }

    password.addEventListener('change', (e) => {
        const value = e.target.value;
        if (validatePassword(value)) {

            passwordMsg.classList.add('hide')
            btn.disabled = false;
        } else {

            passwordMsg.classList.remove('hide')
            btn.disabled = true;
        }

    })

    rePassword.addEventListener('change', (e) => {
        const value = e.target.value;
        const userPassword = password.value
        if (userPassword === value) {
            rePasswordMsg.classList.add('hide')
            btn.disabled = false
        } else {
            rePasswordMsg.classList.remove('hide')
            btn.disabled = true
        }
    })

     // show success and error message
     const status = document.getElementById("status").value;
    if(status == "pwChangeSuccess"){
    	swal("Changed", "Password Changed Sucessfully","success")
    }else if(status == "failed"){
    	swal("Opps", "Failed to do task, Please Try Again","error")
    }else if(status == "exists"){
    	swal("Error", "This product Exist Already","error")
    }else if(status == "server"){
    	swal("Error", "Internal Server Error, Please Try Again","error")
    }else if(status == "default"){
    	swal("Opps", "Something Went Wrong","error")
    }else if(status == "worngPassword"){
    	swal("Opps", "Current Password did not match","error")
    }else if(status == "checkPass"){
    	swal("Opps", "Invalid new Password","error")
    }else if(status == "success"){
    	swal("Saved", "Your Profile has been updated","success")
    }else if(status =="fullName"){
    	swal("Opps","Invalid name","error")
    }else if(status =="username"){
    	swal("Opps","Invalid username, msut be of length of atleast 6 and no special character","error")
    }else if(status =="phoneNumber"){
    	swal("Opps","Invalid number","error")
    }else if(status =="usernameExist"){
    	swal("Opps","This username already exists","error")
    }else if(status =="phoneNumberExist"){
    	swal("Opps","This Phone Number already exists","error")
    }else if(status =="emailExist"){
    	swal("Opps","This email already exists","error")
    }
</script>
</html>