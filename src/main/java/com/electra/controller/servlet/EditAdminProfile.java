package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.electra.controller.dao.UserDao;
import com.electra.model.UserModel;
import com.electra.stringUtils.StringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.EDIT_ADMIN_PROFILE_SERVLET })
public class EditAdminProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = new UserDao();
   
    public EditAdminProfile() {
        super();
        
    }

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 
		 String currentUserName = (String) session.getAttribute("name");
		 int userId = userDao.getUserId(currentUserName);
		 
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String phoneNumber = request.getParameter("phoneNumber");
		System.out.print(email);
		
		if(!isValidName(fullName)) {
			 request.getSession().setAttribute("status", "fullName");
			    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
			return;
		}
		
		if(!isValidUsername(username)) {
			 request.getSession().setAttribute("status", "username");
			    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
		return;
		}
		
		if(!isValidPhoneNumber(phoneNumber)) {
			 request.getSession().setAttribute("status", "phoneNumber");
			    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
			return;
		}
		 UserModel usermodel = new UserModel(fullName,phoneNumber,email,username);
		 int result = userDao.editUserDetails(userId, usermodel);
		 
			 switch (result) {
			 case 1 ->{
				 request.getSession().setAttribute("status", "success");
				 session.setAttribute("name",username );
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
			 }
			 case 0->{
				 request.getSession().setAttribute("status", "failed");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
			 }
			 case -2 ->{
				 request.getSession().setAttribute("status", "usernameExist");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
			 }
			 case -3 ->{
				 request.getSession().setAttribute("status", "phoneNumberExist");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
			 }
			 case -4 ->{
				 request.getSession().setAttribute("status", "emailExist");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
			 }
			 default ->{
				 request.getSession().setAttribute("status", "default");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE_PROFILE);
			 }
			 }
			 
		 }
		 	
	  private boolean isValidName(String name) {
	        return !name.matches(".*\\d.*") && !name.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*");
	    } 
	  
	  private boolean isValidUsername(String username) {
		  return username.length() > 6 && !username.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*");
	  }
	  
	  private boolean isValidPhoneNumber(String phoneNumber) {
		  return  phoneNumber.length() == 10;
	  }

}
