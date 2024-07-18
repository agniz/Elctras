<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                  <%@ page import="java.util.List" %>
         <%@ page import="com.electra.stringUtils.StringUtils" %>
          <%@ page import="com.electra.model.UserModel" %>
                 <%@ page import="com.electra.controller.dao.UserDao" %>
                 
               
 <%

	UserDao userDao = new UserDao();
	String userName = (String) session.getAttribute("name");
	UserModel singleUser = userDao.getUserDetailByUserName(userName);
	
 %>
            
  <form class="editUserForm"action="${pageContext.request.contextPath}<%= StringUtils.EDIT_ADMIN_PROFILE_SERVLET  %>" method="post">
                    <section class="profilePage">
                        <article class="profileTop">
                            <div class="image">
                                <i class="fa-solid fa-user"></i>
                            </div>
                            <div class="username">
                                <p>Welcome, <%= singleUser.getUsername() %></p>
                            </div>
                        </article>
                        <div class="line"></div>
                        <article class="profileBottom">
                            <div class="formRow">
                                <label for="fullName">Full Name</label>
                                <input required value="<%= singleUser.getFullName() %>" type="text" name="fullName" id="fullName">
                            </div>
                            <div class="formRow">
                                <label for="email">Email</label>
                                <input required type="email" name="email" id="email" value="<%= singleUser.getEmail() %>">
                            </div>
                            <div class="formRow">
                                <label for="phoneNumber">Phone Number</label>
                                <input required value="<%= singleUser.getPhoneNumber() %>" type="tel" name="phoneNumber" id="phoneNumber">

                            </div>
                            <div class="formRow">
                                <label for="username">Username</label>
                                <input required type="text" id="username" name="username" value="<%= singleUser.getUsername() %>">
                            </div>

                        </article>
                        <button class="editProfileBtn" type="submit">Save Changes</button>
                    </section>
                </form>