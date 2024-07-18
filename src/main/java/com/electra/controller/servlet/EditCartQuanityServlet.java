package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electra.controller.dao.CartDao;
import com.electra.stringUtils.StringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.EDIT_CART_QUANTITY_SERVLET })
public class EditCartQuanityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CartDao cartDao = new CartDao();
    public EditCartQuanityServlet() {
        super();

      
    }

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sProductId = request.getParameter("productId");
		String sUserId = request.getParameter("userId");
		String sQuantity = request.getParameter("quantity");
		
		int productId = Integer.parseInt(sProductId);
		int userId = Integer.parseInt(sUserId);
		int quantity = Integer.parseInt(sQuantity);
		
		int result = cartDao.updateCartQuantity(productId, userId, quantity);
		
		switch(result) {
		case 1  ->{
			request.getSession().setAttribute("status", "updateSuccess");
			String pageLink = request.getHeader("referer");	
			response.sendRedirect(pageLink);
		}
		case 0  ->{
			 request.getSession().setAttribute("status", "updatefailed");
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

