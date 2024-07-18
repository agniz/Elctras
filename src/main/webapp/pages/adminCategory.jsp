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
  <section class="form hidden">
                <form action="${pageContext.request.contextPath}<%= StringUtils.ADD_CATEGORY %>" method="post" enctype="multipart/form-data" class="addCategoryForm">
                    <button class="close">
                        <i class="fa-solid fa-xmark close" style="color: #ff0000;"></i>
                    </button>
                    <h1>Add Category</h1>
                    <div class="name">
                        <label for="catName">Category Name</label>
                        <input required type="text" name="catName" id="catName">
                    </div>
                    <div class="image">
                        <label class="catImage" for="catImage">Upload Image</label>
                        <img width="50px" class="userImage hidden" height="50px" src="/" alt="">
                        <input required class="hidden imageInput" type="file" accept="image/*" name="catImage"
                            id="catImage">
                    </div>
                    <div class="button">
                        <button class="submitCat" type="submit">Add</button>
                        <button class="resetCat" type="reset">Cancel</button>
                    </div>
                </form>
            </section>
            <article class="category">
                <div class="categoryTop">
                       <p class="totalCategory">Total Categories: <%= categories.size() %></p>
                    <a href="" class="openForm" title="Add Category">
                        <i class="fa-solid fa-circle-plus"></i>
                        Add New Category
                    </a>
                </div>
                <div class="categoryTable">
                    <table class="content-table">
                        <thead>
                            <tr>
                                <th>S.N</th>
                                <th>Category Name</th>
                                <th>Category Image</th>
                                <th>Category ID </th>
                                <th>Total Products</th>
                          
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        int count = 1;
                        for(CategoryModel cat:categories){
                        %>
                            <tr class="active-row">
                           
                                <td><%=count++ %></td>
                                <td><%out.println(cat.getCategoryName());%></td>
                                 <td> 
                               <img width="80px" src="${pageContext.request.contextPath}/resources/images/category/<% out.println(cat.getCategoryImage()); %>" alt="<% out.println(cat.getCategoryName()); %>">
   								</td>
                                <td><%out.println(cat.getCategoryId()); %></td>
                              
                                <td>10</td>
                            </tr>
                            
                            <%
                        }
                            %>
                           
                        </tbody>
                    </table>
                </div>


            </article>
            