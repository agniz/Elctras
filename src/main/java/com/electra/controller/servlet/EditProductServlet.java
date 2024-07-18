package com.electra.controller.servlet;

import java.io.File;
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

import com.electra.controller.dao.ProductDao;
import com.electra.model.ProductModel;
import com.electra.stringUtils.StringUtils;

@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.EDIT_PRODUCT_SERVLET })
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   ProductDao productDao = new ProductDao();
   
    public EditProductServlet() {
        super();
        
    }

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String strProductId = request.getParameter("productId");
    	int productId = Integer.parseInt(strProductId);
    
    	
    	String defaultImageName = request.getParameter("image");
    	
    	String productName =  request.getParameter("productName");
		String StringProductCategoryId = request.getParameter("category");
		 int productCategoryId = Integer.parseInt(StringProductCategoryId);
		
		String descriptionTitle1 = request.getParameter("productDescriptionTitle1");
		String descriptionTitle2 = request.getParameter("productDescriptionTitle2");
		String descriptionTitle3 = request.getParameter("productDescriptionTitle3");
		String descriptionTitle4 = request.getParameter("productDescriptionTitle4");
		String descriptionTitle5 = request.getParameter("productDescriptionTitle5");
		
		if(descriptionTitle4.isBlank()) {
			descriptionTitle4 = null;
		}
		if(descriptionTitle5.isBlank()) {
			descriptionTitle5 = null;
		}
		
		String descriptionText1 = request.getParameter("productDescriptionText1");
		String descriptionText2 = request.getParameter("productDescriptionText2");
		String descriptionText3 = request.getParameter("productDescriptionText3");
		String descriptionText4 = request.getParameter("productDescriptionText4");
		String descriptionText5 = request.getParameter("productDescriptionText5");
		
		if(descriptionText4.isBlank()) {
			descriptionText4 = null;
		}
		if(descriptionText5.isBlank()) {
			descriptionText5 = null;
		}

		Part file = request.getPart("productImage");
		String imageFileName = file.getSubmittedFileName();
		if(imageFileName.isBlank()) {
			imageFileName = defaultImageName;
		}else {
			 String uplodPath = "D:/Informatics/Java/Eclipse/Electra/src/main/webapp/resources/images/products/"+File.separator+imageFileName;
			 
			 try {
				 FileOutputStream fos = new FileOutputStream(uplodPath);
				 InputStream is = file.getInputStream();
				 
				 byte[] data = new byte[is.available()];
				 is.read(data);
				 fos.write(data);
				 fos.close();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		}
		 
		
		 String priceString = request.getParameter("price");
	        double price = Double.parseDouble(priceString);
	        
	        String stockString = request.getParameter("stock");
	        int stock = Integer.parseInt(stockString);
	        
	        String featured = request.getParameter("feature");
	        int featuredProduct = 0; // default value
	        if(featured!=null && featured.equals("yes")) {
	        	featuredProduct = 1;
	        }
	        
	        String trending = request.getParameter("trending");
	        int trendingProduct = 0; // default value
	        if(trending!=null && trending.equals("yes")) {
	        	trendingProduct = 1;
	        }

	        ProductModel product =  new ProductModel(productCategoryId,productName,imageFileName,price,stock,trendingProduct,featuredProduct,descriptionTitle1,descriptionTitle2,descriptionTitle3,descriptionTitle4,descriptionTitle5,descriptionText1,descriptionText2,descriptionText3,descriptionText4,descriptionText5);
	        int result = productDao.editProduct(product,productId );
	        switch(result) {
	        case 1 ->{
	        	request.getSession().setAttribute("status", "successEdit");
	        	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE);
	        }
	        case 0 ->{
	        	 request.getSession().setAttribute("status", "failedEdit");
				 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
	        }
	        case -1 ->{
	        	request.getSession().setAttribute("status", "server");
				 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
	        }
	        case -2 ->{
	        	request.getSession().setAttribute("status", "existsPro");
				 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
	        }
	        default ->{
	        	request.getSession().setAttribute("status", "default");
				 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
	        }
	        }
		
	}

}
