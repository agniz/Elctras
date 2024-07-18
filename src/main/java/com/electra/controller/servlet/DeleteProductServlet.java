package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electra.controller.dao.ProductDao;
import com.electra.stringUtils.StringUtils;


@WebServlet(StringUtils.DELETE_PRODUCT_SERVLET)
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  ProductDao productDao = new ProductDao();
    public DeleteProductServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String stringProductId = request.getParameter("productId");
		int productId = Integer.parseInt(stringProductId);
		int result = productDao.deleteProduct(productId);
		
		switch(result) {
		case 1  ->{
			request.getSession().setAttribute("status", "deleteSuccess");
        	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE);
		}
		case 0  ->{
			 request.getSession().setAttribute("status", "Deletefailed");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
		}
		case -1 ->{
			request.getSession().setAttribute("status", "server");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
		}
		default ->{
			request.getSession().setAttribute("status", "default");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
		}
		}
	}

	
	

}
