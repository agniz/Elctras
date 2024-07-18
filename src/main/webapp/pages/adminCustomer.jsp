<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ page import="com.electra.stringUtils.StringUtils" %>
                <%@ page import="com.electra.controller.dao.UserDao" %>
            <%@ page import="com.electra.model.UserModel" %>
            <%@ page import="java.util.List" %>
<%if (session.getAttribute("name") == null){
	response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
}
	UserDao userDao = new UserDao();
List <UserModel> user = userDao.getAllUsers() ;
%>
 <article class="order">
                    <section class="orderTop">
                        <p>Total Users: <%= user.size() %></p>
                    </section>
                    <div class="mainTable">
                        <table class="content-table">
                            <thead>
                                <tr>
                                    <th>S.N</th>
                                    <th>User FullName</th>
                                    <th>User Email </th>
                                    <th>User Contact</th>
                                    <th>Username</th>
                                    <th>User Type</th>
                                   
                                    

                                </tr>
                            </thead>
                            <tbody>
                             <%
                            int num = 1;
                            for(UserModel users: user){ 
                            %>
                                   <tr class="active-row">
                                    <td><%=num++ %></td>
                                    <td><%out.print(users.getFullName()); %></td>
                                    <td><%out.print(users.getEmail()); %></td>
                                    <td><%out.print(users.getPhoneNumber()); %></td>
                                    <td><%out.print(users.getUsername()); %></td>
                                    <%if(users.getUserType() == 0){ %>
                                    <td>Customer</td>
                                    <%}else if(users.getUserType() == 1){ %>
                                    <td>Admin</td>
                                    <%} %>
                                    
                                    
                                </tr>
                            <%} %>
                         


                            </tbody>
                        </table>
                    </div>
                </article>