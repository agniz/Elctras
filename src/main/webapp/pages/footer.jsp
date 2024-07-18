<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.time.LocalDate" %>
          <%@ page import="com.electra.stringUtils.StringUtils" %>
      <%@ page import="com.electra.model.CategoryModel" %>
      <%@ page import="com.electra.controller.dao.CategoryDao" %>
      <%@ page import="java.util.List" %>
      
      <%
      CategoryDao catDao = new CategoryDao();
      List <CategoryModel> categories = catDao.getAllCategories();
      %>
      
        <footer>
        <section class="container">
            <article class="features">
                <div class="singleFeature">
                    <i class="fa-solid fa-truck"></i>
                    <div>
                        <p class="featureTitle">Free Shipping on Order Rs.2000</p>

                        <p class="featureText">Delivery Moves so Quickly</p>
                    </div>
                </div>
                <div class="singleFeature">
                    <img src="${pageContext.request.contextPath}/resources/images/footerIcons/return.png" alt="return">
                    <div>
                        <p class="featureTitle">Easy & Fast Return</p>

                        <p class="featureText">30 Days Free Return Policy</p>
                    </div>
                </div>
                <div class="singleFeature">
                    <img src="${pageContext.request.contextPath}/resources/images/footerIcons/support.png" alt="support">
                    <div>
                        <p class="featureTitle">24/7 Customer Support</p>

                        <p class="featureText">Online Help By Our Agents</p>
                    </div>
                </div>
                <div class="singleFeature">
                    <img src="${pageContext.request.contextPath}/resources/images/footerIcons/card.png" alt="card">
                    <div>
                        <p class="featureTitle">100% Secure Payments</p>

                        <p class="featureText">Esewa/Khalti/MasterCard/</p>
                    </div>
                </div>
            </article>
            <article class="links">
                <section class="linkRows">
                    <div class="row">
                        <h3>company</h3>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Affiliates</a></li>
                            <li><a href="#">Blog</a></li>
                        </ul>
                    </div>
                    <div class="row">
                        <h3>Shop</h3>
                        <ul>
                        <%for (CategoryModel cat:categories){ %>
                        <li><a href="#"><%out.println(cat.getCategoryName());%></a></li>
                        <%} %>
                        </ul>
                    </div>
                    <div class="row">
                        <h3>support</h3>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Frequently Asked Questions</a></li>
                            <li><a href="#">Privacy</a></li>
                        </ul>
                    </div>
                </section>
                <section class="linkRows linkColumn">
                    <h2>Get Rs.500 off in <span class="underline">your first order</span> </h2>
                    <div class="socialIcons">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-x-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>
                </section>
            </article>
            <article class="info">
                <div class="footerLogo">
                    <img height="50px" width="50px" src="${pageContext.request.contextPath}/resources/images/logo/electra.png" alt="logo">
                    <h2>Electra</h2>
                </div>
                <div class="comInfo">
                    <div class="contactDetails">
                        <p><span>Phone: </span>9823102475</p>
                        <p><span>Email:</span> info.electra@gmail.com</p>
                    </div>
                    <p class="copyright">
                        Copyright &copy; <%= LocalDate.now().getYear() %> Electra. All right reserved.
                    </p>
                </div>
                <div class="paymentPatners">
                    <img width="100px" height="50px" src="${pageContext.request.contextPath}/resources/images/footerIcons/esewa.png" alt="esewa">
                    <img width="100px" height="50px" src="${pageContext.request.contextPath}/resources/images/footerIcons/khalti.png" alt="khalti">
                    <img width="100px" height="50px"src="${pageContext.request.contextPath}/resources/images/footerIcons/mastercard.png" alt="mastercard">
                </div>
            </article>

        </section>
    </footer>