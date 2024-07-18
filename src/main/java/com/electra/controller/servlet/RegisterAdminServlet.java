package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electra.controller.dao.UserDao;
import com.electra.model.UserModel;
import com.electra.stringUtils.StringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.REGISTER_ADMIN_SERVLET })
public class RegisterAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = new UserDao();
   
    public RegisterAdminServlet() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phnNumber");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String reTypePassword  = request.getParameter("rePassword");
		String hashedPassword = userDao.encryptPassword(password);
		int userType = 1;
		
	
		
		if(!isValidName(fullName)) {
			 request.getSession().setAttribute("status", "fullName");
			    response.sendRedirect(request.getContextPath() + StringUtils.REGSITER_PAGE);
			return;
		}
		
		if(!isValidUsername(username)) {
			 request.getSession().setAttribute("status", "username");
			    response.sendRedirect(request.getContextPath() + StringUtils.REGSITER_PAGE);
		return;
		}
		
		if(!isValidPhoneNumber(phoneNumber)) {
			 request.getSession().setAttribute("status", "phoneNumber");
			    response.sendRedirect(request.getContextPath() + StringUtils.REGSITER_PAGE);
			return;
		}
		
		if(!isValidPassword(password,reTypePassword)) {
			 request.getSession().setAttribute("status", "password");
			    response.sendRedirect(request.getContextPath() + StringUtils.REGSITER_PAGE);
			return;
		}
		
		 UserModel usermodel = new UserModel(fullName,phoneNumber,hashedPassword,email,username,userType);
		 int result = userDao.registerAdmin(usermodel);
		 if(password.equals(reTypePassword)) {
			 switch (result) {
			 case 1 ->{
				 request.getSession().setAttribute("status", "Adminsuccess");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
			 }
			 case 0->{
				 request.getSession().setAttribute("status", "Adminfailed");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
			 }
			 case -2 ->{
				 request.getSession().setAttribute("status", "usernameExist");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
			 }
			 case -3 ->{
				 request.getSession().setAttribute("status", "phoneNumberExist");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
			 }
			 case -4 ->{
				 request.getSession().setAttribute("status", "emailExist");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
			 }
			 default ->{
				 request.getSession().setAttribute("status", "default");
				    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
			 }
			 }
			 
		 }
		 else { 
			 request.getSession().setAttribute("status", "password");
			    response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
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
	  
	  private boolean isValidPassword(String password, String retypePassword) {
		  return password.length() > 8 && password.matches(".*\\d.*") && password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*")
	                && password.matches(".*[A-Z].*") && password.equals(retypePassword);
	  }
}
