package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.electra.controller.dao.UserDao;
import com.electra.stringUtils.StringUtils;



@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.LOGIN_SERVLET })
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   UserDao userdao = new UserDao();
    public loginServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String hashedPassword = userdao.getHashedPassword(username);
		String inputHashedPassword = userdao.encryptPassword(password);
		

		
		if(hashedPassword == null) {

			request.getSession().setAttribute("status", "notExist");
		    response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
			return;
		}
		
		int result = userdao.getLoginDetails(username, inputHashedPassword);
		if(inputHashedPassword.equals(hashedPassword)) {
			switch (result) {
			case 1 ->{
				HttpSession session = request.getSession();
				session.setAttribute("name", username);
				session.setAttribute("type", "admin" );
				session.setMaxInactiveInterval(30 * 60);
				response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
			}
			case 0 ->{
				HttpSession session = request.getSession();
				session.setAttribute("name", username);
				session.setAttribute("type", "customer" );
				session.setMaxInactiveInterval(30 * 60);
				response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
			}
			case 5 ->{
		
					request.getSession().setAttribute("status", "notFound");
				    response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
			}
			case -5 ->{					
					request.getSession().setAttribute("status", "error");
				    response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
			}
			default ->{
	
					request.getSession().setAttribute("status", "error");
				    response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
			}
			}
		}else {
				 request.getSession().setAttribute("status", "notMatch");
				    response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
		}
		
	}

}
