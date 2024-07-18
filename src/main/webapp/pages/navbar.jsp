<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.electra.stringUtils.StringUtils" %>
<header>
<%
// if customer is logged in
if (session.getAttribute("name") != null && "customer".equals(session.getAttribute("type"))) {
%>
<div class="profileButton">
            <button class="signIn profile">
                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                    <path
                        d="M17.4 12.072c1.344-1.32 2.088-3.12 2.088-4.992 0-3.888-3.144-7.032-7.032-7.032s-7.056 3.144-7.056 7.032c0 1.872 0.744 3.672 2.088 4.992-3.792 1.896-6.312 6.216-6.312 10.92 0 0.576 0.456 1.032 1.032 1.032h20.52c0.576 0 1.032-0.456 1.032-1.032-0.048-4.704-2.568-9.024-6.36-10.92zM14.976 11.4l-0.096 0.024c-0.048 0.024-0.096 0.048-0.144 0.072l-0.024 0.024c-0.744 0.384-1.488 0.576-2.304 0.576-2.76 0-4.992-2.232-4.992-4.992s2.256-5.016 5.016-5.016c2.76 0 4.992 2.232 4.992 4.992 0 1.776-0.936 3.432-2.448 4.32zM9.456 13.44c0.936 0.456 1.944 0.672 2.976 0.672s2.040-0.216 2.976-0.672c3.336 1.104 5.832 4.56 6.192 8.52h-18.336c0.384-3.96 2.88-7.416 6.192-8.52z">
                    </path>
                </svg>
               <%=session.getAttribute("name") %></button>
            <ul class="userLinks hidden">
                <li><a href="${pageContext.request.contextPath}/pages/customer.jsp">
                        <i class="fa-regular fa-id-card"></i>
                        My Profile</a></li>
           
                <li><a href="<%=request.getContextPath()%>/LogoutServlet">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        Log Out</a></li>
            </ul>
            <button class="cart">
                <i class="fa-solid fa-cart-shopping fa-bounce"></i>
            </button>
        </div>
<%
// if customer is not logged in
} else {
%>
    <div class="profileButton">
            <button class="signIn" onclick="window.location.href = '${pageContext.request.contextPath}/pages/login.jsp';">
                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                    <path
                        d="M17.4 12.072c1.344-1.32 2.088-3.12 2.088-4.992 0-3.888-3.144-7.032-7.032-7.032s-7.056 3.144-7.056 7.032c0 1.872 0.744 3.672 2.088 4.992-3.792 1.896-6.312 6.216-6.312 10.92 0 0.576 0.456 1.032 1.032 1.032h20.52c0.576 0 1.032-0.456 1.032-1.032-0.048-4.704-2.568-9.024-6.36-10.92zM14.976 11.4l-0.096 0.024c-0.048 0.024-0.096 0.048-0.144 0.072l-0.024 0.024c-0.744 0.384-1.488 0.576-2.304 0.576-2.76 0-4.992-2.232-4.992-4.992s2.256-5.016 5.016-5.016c2.76 0 4.992 2.232 4.992 4.992 0 1.776-0.936 3.432-2.448 4.32zM9.456 13.44c0.936 0.456 1.944 0.672 2.976 0.672s2.040-0.216 2.976-0.672c3.336 1.104 5.832 4.56 6.192 8.52h-18.336c0.384-3.96 2.88-7.416 6.192-8.52z">
                    </path>
                </svg>
                Sign In</button>
            <button class="cart">
                <i class="fa-solid fa-cart-shopping fa-bounce"></i>
                
            </button>
        </div>
<%
}
%>
        <nav class="navigation">
            <section style="cursor:pointer;" onclick="window.location.href = '${pageContext.request.contextPath}/pages/index.jsp'"   class="nav-left">
                <img width="40px" height="40px" src="${pageContext.request.contextPath}/resources/images/logo/electra.png" alt="logo">
             
                <span>Electra</span>
            </section>
            <section class="nav-center">
                <ul class="navLinks">
                    <li><a href="${pageContext.request.contextPath}/pages/index.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/pages/shop.jsp">Shop</a></li>
                    <li><a href="${pageContext.request.contextPath}/pages/contact.jsp">Contact Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/pages/aboutUs.jsp">About Us</a></li>

                </ul>
            </section>
            <section class="nav-right">
                <div>
                    <button class="searchButton">
                        <i class="search fa-solid fa-magnifying-glass"></i>
                    </button>

                </div>
            </section>
        </nav>
        <!-- search bar model -->
        <div class="model hidden">
        <form action="${pageContext.request.contextPath}<%= StringUtils.SEARCH_PRODUCT_SERVLET %>" method="post">>
       
            <section class="searchBarModel">
            <input placeholder="Search Here...." type="text" class="searchBarr" name="search" required>
                <button class="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                 <button class="cross"><i class="fa-solid fa-xmark"></i></button>              
            </section>
             </form>
        </div>
    </header>