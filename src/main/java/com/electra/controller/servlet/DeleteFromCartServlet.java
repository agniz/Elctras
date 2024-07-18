package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electra.controller.dao.CartDao;
import com.electra.stringUtils.StringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.DELETE_CART_SERVLET })
public class DeleteFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CartDao cartDao = new CartDao();
    public DeleteFromCartServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sProductId = request.getParameter("productId");
		String sUserId = request.getParameter("userId");
		int productId = Integer.parseInt(sProductId);
		int userId = Integer.parseInt(sUserId);
		
		int result = cartDao.deleteCart(productId, userId);
		
		switch(result) {
		case 1  ->{
			request.getSession().setAttribute("status", "deleteSuccess");
			String pageLink = request.getHeader("referer");	
			response.sendRedirect(pageLink);
		}
		case 0  ->{
			 request.getSession().setAttribute("status", "Deletefailed");
			 String pageLink = request.getHeader("referer");	
				response.sendRedirect(pageLink);
		}
		case -1 ->{
			request.getSession().setAttribute("status", "server");
			String pageLink = request.getHeader("referer");	
			response.sendRedirect(pageLink);
		}
		default ->{
			request.getSession().setAttribute("status", "default");
			String pageLink = request.getHeader("referer");	
			response.sendRedirect(pageLink);
		}
		}
	}

	
	

}
