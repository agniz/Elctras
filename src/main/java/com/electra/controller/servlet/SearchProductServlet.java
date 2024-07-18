package com.electra.controller.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electra.controller.dao.ProductDao;
import com.electra.model.ProductModel;
import com.electra.stringUtils.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.SEARCH_PRODUCT_SERVLET })
public class SearchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   ProductDao productDao = new ProductDao();
    public SearchProductServlet() {
        super();
       
    }

	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchParameter = request.getParameter("search");
      
        String redirectURL = "/pages/search.jsp?search=" + URLEncoder.encode(searchParameter, "UTF-8");
        response.sendRedirect(request.getContextPath() + redirectURL);
    }


}
