<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.electra.stringUtils.StringUtils" %>
    <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/variable.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/login.css">
  <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <title>Log In & Register Form</title>
</head>

<body>
<input type="hidden" id="status" value="${sessionScope.status}">
 <%
 request.getSession().removeAttribute("status");

 %>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <!-- Log In form -->
                <form action="${pageContext.request.contextPath}<%= StringUtils.LOGIN_SERVLET %>" method="post" class="sign-in-form">
                    <h2 class="title">Log In</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <!-- username input -->
                        <input required type="text" name="username" placeholder="Username" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <!-- password input -->
                        <div class="passwordField">
                        <input data-id="1" required type="password" placeholder="password" class="password" name="password">
                        <button data-id="1" class="showPassword">
                            <img class="passImage" data-id="1" src="${pageContext.request.contextPath}/resources/images/loginRegister/showPassword.png" alt="icon">
                        </button>
                        </div>
                    </div>
                    <input required type="submit" value="Login" class="btn solid" />
                </form>
                        
            </div>
        </div>

        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>New To Electra ?</h3>
                    <p>
                        Discover the latest tech, form smartphones to smart home devices. Browse our handpicked
                        collection to
                        discover the perfect gadget to improve your life
                    </p>
                    <button onclick="window.location.href='${pageContext.request.contextPath}/pages/register.jsp'" class="btn transparent" id="sign-up-btn">
                        Register
                    </button>
                </div>
                <img src="${pageContext.request.contextPath}/resources/images/loginRegister/login.svg" class="image" alt="register" />
            </div>

        </div>
    </div>
    </body>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

const passwordBtn = document.querySelectorAll(".showPassword");
const passwordField = document.querySelectorAll('.password');


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

 // to show sucess and error message
        const status = document.getElementById("status").value;
        if(status == "notFound"){
        	swal("Error", "Username and Passowrd not matched","error")
        }else if(status == "error"){
        	swal("Opps", "Something is error","error")
        }else if(status == "notExist"){
        	swal("Error","This user doesnot exist, Please register the user first","error")
        }else if(status =="notMatch"){
        	swal("Error", "Incorrect password" ,"error")
        }

</script>
</html>