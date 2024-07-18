package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.electra.controller.dao.CartDao;
import com.electra.controller.dao.UserDao;
import com.electra.model.CartModel;
import com.electra.stringUtils.StringUtils;


@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.CART_SERVLET})
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDao userDao = new UserDao();
	CartDao cartDao = new CartDao();
    public CartServlet() {
        super();
       
    }



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		
		String sProductQuantity =  request.getParameter("quantity");
					
		 int productQuantity = Integer.parseInt(sProductQuantity);
		
		 
		
		 String sProductId = request.getParameter("productId");
		 int productId = Integer.parseInt(sProductId);
		 
		 
		 String userName = (String) session.getAttribute("name");
		 if(userName == null) {
			 request.getSession().setAttribute("status", "login");
			 String pageLink = request.getHeader("referer");	
				response.sendRedirect(pageLink);
			    return;
		 }
		 int userId = userDao.getUserId(userName);
		 if(userId<0) {
			 request.getSession().setAttribute("status", "error");
			 String pageLink = request.getHeader("referer");	
				response.sendRedirect(pageLink);
			    return;
		 }
		 
		 CartModel cartmodel = new CartModel(userId,productId,productQuantity);
		 int result = cartDao.addToCart(cartmodel);
		 switch(result) {
		 case 1 ->{
			 request.getSession().setAttribute("status", "cartAdded");
			 String pageLink = request.getHeader("referer");	
				response.sendRedirect(pageLink);
			  
		 }
		 case 0 ->{
			 request.getSession().setAttribute("status", "error");
			 String pageLink = request.getHeader("referer");	
				response.sendRedirect(pageLink);
			    
		 }
		 case -1 ->{
			 request.getSession().setAttribute("status", "error");
			 String pageLink = request.getHeader("referer");	
				response.sendRedirect(pageLink);
			   
		 }
		 default ->{
			 request.getSession().setAttribute("status", "error");
			 String pageLink = request.getHeader("referer");	
				response.sendRedirect(pageLink);
			    
		 }
		 }
		 
	}

}
