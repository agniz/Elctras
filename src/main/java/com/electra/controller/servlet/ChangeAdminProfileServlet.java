package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.electra.controller.dao.PasswordDao;
import com.electra.controller.dao.UserDao;
import com.electra.stringUtils.StringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.ADMIN_CHANGE_PASSWORD_SERVLET })
public class ChangeAdminProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PasswordDao passwordDao = new PasswordDao();
    UserDao userdao = new UserDao();
  
    public ChangeAdminProfileServlet() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String reTypeNewPassword = request.getParameter("rePassword");
		String userName = (String) session.getAttribute("name");
		
		if(isValidPassword(newPassword,reTypeNewPassword)) {
//			getting hashed password from db
			String hashedPassword = userdao.getHashedPassword(userName);
			String inputHashedPassword = userdao.encryptPassword(newPassword);
			String inputCurrentHashPassword = userdao.encryptPassword(currentPassword);
		
			if(inputCurrentHashPassword.equals(hashedPassword)) {
				int result = passwordDao.changePassword(inputHashedPassword, userName);
				switch (result) {
				case 1 -> {
					request.getSession().setAttribute("status", "pwChangeSuccess");
		        	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE_PROFILE);
				}
				case 0 ->{
					request.getSession().setAttribute("status", "failed");
		        	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE_PROFILE);
				}
				case -1 -> {
					request.getSession().setAttribute("status", "server");
		        	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE_PROFILE);
				}
				default ->{
					request.getSession().setAttribute("status", "failed");
		        	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE_PROFILE);
				}
				}
			}else {
				request.getSession().setAttribute("status", "worngPassword");
	        	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE_PROFILE);
			}
			
		}else {
			request.getSession().setAttribute("status", "checkPass");
       	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE_PROFILE);
		}

	}

	 private boolean isValidPassword(String password, String retypePassword) {
		  return password.length() > 8 && password.matches(".*\\d.*") && password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*")
	                && password.matches(".*[A-Z].*") && password.equals(retypePassword);
	  }


}
