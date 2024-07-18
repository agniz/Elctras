 <%@ page import="com.electra.stringUtils.StringUtils" %>
 <article class="passwordTab">
 <section class="passwordContainer">
                    <h1>Change Password</h1>
                    <form action="${pageContext.request.contextPath}<%= StringUtils.ADMIN_CHANGE_PASSWORD_SERVLET %>" method="post" class="changePasswordForm">
                        <label for="current">Current Password</label>
                        <div class="passwordField">
                            <input data-id="1" class="passInput" type="password" name="currentPassword" id="current">
                            <button data-id="1" class="showPassword">
                                 <img class="passImage" data-id="1"
                                    src="${pageContext.request.contextPath}/resources/images/loginRegister/showPassword.png"
                                    alt="icon">
                              
                            </button>
                        </div>
                        <label for="newPass">New Password</label>
                        <div class="passwordField">
                            <input data-id="2" class="passInput" type="password" name="newPassword" id="newPass">
                            <button data-id="2" class="showPassword">
                                 <img class="passImage" data-id="2"
                                                            src="${pageContext.request.contextPath}/resources/images/loginRegister/showPassword.png"
                                                            alt="icon">
                               
                            </button>
                            <p class="passwordP danger hide">Password is weak, try using special character numbers and
                                uppercase
                                letters also</p>
                        </div>
                        <label for="rePass">Retype New Password</label>
                        <div class="passwordField">
                            <input data-id="3" class="passInput" type="password" name="rePassword" id="rePass">
                            <button data-id="3" class="showPassword">
                                 <img class="passImage" data-id="3"
                                                                src="${pageContext.request.contextPath}/resources/images/loginRegister/showPassword.png"
                                                                alt="icon">
                                
                            </button>
                            <p class="repasswordP danger hide">Password not matched</p>
                        </div>
                        <button class="pwBtn" type="submit">Change Password</button>
                    </form>
                </section>
 </article>
 