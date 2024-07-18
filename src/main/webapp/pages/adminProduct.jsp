<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ page import="com.electra.stringUtils.StringUtils" %>
           <%@ page import="com.electra.controller.dao.ProductDao" %>
           <%@ page import="com.electra.model.ProductModel" %>
           <%@ page import="java.util.List" %>
<%if (session.getAttribute("name") == null){
	response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
} 
ProductDao pDao = new ProductDao();
List <ProductModel> products = pDao.getAllProdcuts();
%>
 
 <article class="product">
                    <section class="productTop">
                        <p>Total Products: <%= products.size() %></p>
                        <div class="search">
                            <form class="searchForm" action="#">
                                <input placeholder="Search Product" type="search" name="search">
                                <button class="searchBtn" type="submit">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </form>
                        </div>
                        <a href="${pageContext.request.contextPath}/pages/addProduct.jsp" class="addProductLink">
                            <i class="fa-solid fa-circle-plus"></i>
                            Add New Product
                        </a>
                    </section>
                    <div class="mainTable">
                        <table class="content-table">
                            <thead>
                                <tr>
                                    <th>S.N</th>
                                    <th>Product Name</th>
                                    <th>Product Image</th>
                                    <th>Product ID</th>
                                    <th>Product Price</th>
                                    <th>Category Name</th>
                                    <th>In stock</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% 
                            int num = 1;
                            for(ProductModel product:products){ 
                            
                            %>
                               <tr class="active-row">
                                    <td><%= num++ %></td>
                                    <td><%out.print(product.getProductName());  %></td>
                                    <td>  <img width="80"  src="${pageContext.request.contextPath}/resources/images/products/<% out.print(product.getProductImage()); %>" alt="<% out.println(product.getProductName()); %>"></td>
                                    <td><%out.print(product.getProductId()); %></td>
                                    <td>Rs <span class="priceNum"><%out.print(product.getProductPrice()); %></span> </td>
                                    <td><%out.print(product.getProductCategoryName()); %></td>
                                    <td><%out.print(product.getStock()); %></td>
                                    <td class="action">
                                        <a class="actionBtn edit" href="${pageContext.request.contextPath}/pages/editProduct.jsp?productId=<%out.print(product.getProductId());%>">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                            <p class="hover edt">Edit</p>
                                        </a>
                                         <a class="actionBtn delete" href="${pageContext.request.contextPath}<%= StringUtils.DELETE_PRODUCT_SERVLET %>?productId=<%out.print(product.getProductId());%>">
                                            <i class="fa-solid fa-trash"></i>
                                            <p class="hover dlt">Delete</p>
                                        </a>
                                    </td>
                                </tr>
                            <% } %>
                             

                               

                            </tbody>
                        </table>
                    </div>
                </article>