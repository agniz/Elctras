package com.electra.controller.servlet;

import java.io.File;
//import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.electra.controller.dao.CategoryDao;
import com.electra.model.CategoryModel;
import com.electra.stringUtils.StringUtils;

@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.ADD_CATEGORY})
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	CategoryDao categoryDao = new CategoryDao();

    public AddCategory() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		String categoryName = request.getParameter("catName");

		
		Part file = request.getPart("catImage");
		String imageFileName = file.getSubmittedFileName();

		 String uplodPath = "D:/Informatics/Java/Eclipse/Electra/src/main/webapp/resources/images/category/"+File.separator+imageFileName;
		

		 
		 try {
			 FileOutputStream fos = new FileOutputStream(uplodPath);
			 InputStream is = file.getInputStream();
			 
			 byte [] data = new byte[is.available()];
			 is.read(data);
			 fos.write(data);
			 fos.close(); 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 CategoryModel category = new CategoryModel(categoryName,imageFileName);
		 int result = categoryDao.addCategory(category);
		 switch(result) {
		 case 1->{
			 request.getSession().setAttribute("status", "success");
			    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
				
		 }
		 case 0 ->{
			
			 request.getSession().setAttribute("status", "failed");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
				
		 }
		 case -2 ->{
			
			 request.getSession().setAttribute("status", "exists");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
			
		 }
		 default ->{
			 
			 request.getSession().setAttribute("status", "failed");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
				
		 }
		 }
		 

		
	}

}
