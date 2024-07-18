<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.electra.stringUtils.StringUtils" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register To Electra</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/reset.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/variable.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/register.css">
  <link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>

<body>
<input type="hidden" id="status" value="${sessionScope.status}">
 <%
 request.getSession().removeAttribute("status");

 %>
    <section class="registerPage">
        <article class="registerFormContainer">
            <h1>Register To Electra</h1>
              <form action="${pageContext.request.contextPath}<%= StringUtils.REGISTER_SERVLET %>" method="post" class="registerForm">
 
                <div class="inputContainer">
                    <label for="fullName">Full Name:</label>
                   <input required type="text" name="fullName">
                    <p class="fullNameP danger hide">Name cant contain numbers or any special characters</p>
                </div>
                <div class="inputContainer">
                    <label for="email">Email</label>
                     <input required type="email" name="email">
                </div>

                <div class="inputContainer">
                    <label for="phnNumber">Phone Number</label>
                     <input required type="tel" name="phnNumber">
                    <p class="phnNumberP danger hide">Invalid phone number</p>
                </div>

                <div class="inputContainer">
                    <label for="username">User Name</label>
                    <input required type="text" name="username">
                    <p class="usernameP danger hide">Username cant contain any special characters and length should be
                        more than 6</p>
                </div>
                <div class="inputContainer">
                    <label for="password">Password</label>
                    <div class="passwordField">
                        <input data-id="1" required type="password" class="password" name="password">
                        <button data-id="1" class="showPassword">
                            <img class="passImage" data-id="1" src="${pageContext.request.contextPath}/resources//images/loginRegister/showPassword.png" alt="icon">
                        </button>
                        <p class="passwordP danger hide">Password is weak, try using special character numbers and
                            uppercase
                            letters also</p>
                    </div>
                </div>
                <div class="inputContainer">
                    <label for="rePassword">Re-Type Password</label>
                    <div class="passwordField">
                        <input required data-id="2" type="password" class="password" name="rePassword">
                        <button data-id="2" class="showPassword">
                            <img class="passImage" data-id="2" src="${pageContext.request.contextPath}/resources/images/loginRegister/showPassword.png" alt="icon">
                        </button>
                        <p class="repasswordP danger hide">Password not matched</p>
                    </div>
                </div>
                <div class="last">
                    <button  class="submitBtn" type="submit">Register</button>
                </div>
            </form>
        </article>
        <article class="registerDesign">
            <h1>Already a Member?</h1>
            <p>Discover the latest tech, form smart phones to smart home devices. Browse our hand picked collection to
                discover the perfect gadget to improve your life</p>
            <button onclick="window.location.href='${pageContext.request.contextPath}/pages/login.jsp'" class="login">Login</button>
            <img src="${pageContext.request.contextPath}/resources/images/loginRegister/register.svg" alt="" class="designImage">
        </article>
    </section>
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

    function checkFullName(str) {
        const regex = /[^a-zA-Z\s]/;
        return regex.test(str);
    }

    function checkUserName(str) {
        const regex = /[^a-zA-Z0-9]/;
        return regex.test(str)
    }

    function checkPhoneNumber(str) {
        const regex = /[^0-9]/
        return regex.test(str)
    }

    function validatePassword(password) {
        const regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/;
        return regex.test(password);
    }
    const fullName = document.querySelector('input[name="fullName"]')
    const userName = document.querySelector('input[name="username"]')
    const phoneNumber = document.querySelector('input[name="phnNumber"]')
    const password = document.querySelector('input[name="password"]')
    const rePassword = document.querySelector('input[name="rePassword"]');
    const passwordMsg = document.querySelector('.passwordP')
    const fullNameMsg = document.querySelector('.fullNameP')
    const userNameMsg = document.querySelector('.usernameP')
    const phnNumberMsg = document.querySelector('.phnNumberP')
    const rePasswordMsg = document.querySelector('.repasswordP')

    const btn = document.querySelector('.submitBtn')

    fullName.addEventListener('change', (e) => {
        const value = e.target.value
        if (checkFullName(value)) {
            fullNameMsg.classList.remove('hide')
            btn.disabled = true;
        } else {
            fullNameMsg.classList.add('hide')
            btn.disabled = false;
        }
    })
    userName.addEventListener('change', (e) => {
        const value = e.target.value;
        if (value.length < 6 || checkUserName(value)) {
            userNameMsg.classList.remove('hide')
            btn.disabled = true;
        } else {
            userNameMsg.classList.add('hide')
            btn.disabled = false;
        }
    })
    phoneNumber.addEventListener('change', (e) => {
        const value = e.target.value;
        console.log(value);
        if (value.length !== 10 || checkPhoneNumber(value)) {
            phnNumberMsg.classList.remove('hide')
            btn.disabled = true;
        } else {
            phnNumberMsg.classList.add('hide')
            btn.disabled = false;
        }
    })

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

    // to show sucess and error message
        const status = document.getElementById("status").value;
        if(status == "success"){
        	swal("Congrats", "Account Created Sucessfully, Please proceed to login page","success")
        }else if(status == "failed"){
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
        }else if(status =="default"){
        	swal("Opps","Something went wrong","error")
        }
</script>

</html>