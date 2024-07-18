package com.electra.controller.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.electra.controller.dao.CartDao;
import com.electra.controller.dao.OrderDao;
import com.electra.controller.dao.OrderDetailsDao;
import com.electra.controller.dao.ProductDao;
import com.electra.controller.dao.UserDao;
import com.electra.model.CartModel;
import com.electra.model.OrderDetailsModel;
import com.electra.model.OrderModel;
import com.electra.stringUtils.StringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.CHECKOUT_SERVLET })
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	UserDao userDao = new UserDao();
	CartDao cartDao = new CartDao();
	OrderDao orderDao = new OrderDao();
	ProductDao productDao = new ProductDao();
	OrderDetailsDao orderDetailsDao = new OrderDetailsDao();
	
    public CheckoutServlet() {
        super();
       
    }

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 String userName = (String) session.getAttribute("name");
		 int userId = userDao.getUserId(userName);
		 
		 List <CartModel> order = cartDao.getAllCartItems(userId);
		 double totalAmount = 0;
		 for(CartModel orders: order) {
			 double price = orders.getProductPrice();
			 int quantity = orders.getProductQuantity();
			 totalAmount += price * quantity;
		 }
		// store in orders table in db
		 OrderModel orders = new OrderModel(userId, new Date(),(totalAmount + 150));
		 int orderId = orderDao.saveOrder(orders);
		 
		 // store in orderDetails table in db
		 for(CartModel orderItem:order) {
			 int orderProductId = orderItem.getProductId();
			 int orderProductQuantity = orderItem.getProductQuantity();
			 OrderDetailsModel orderDetail = new OrderDetailsModel(orderId,orderProductId,orderProductQuantity);
			 orderDetailsDao.saveOrderDetail(orderDetail);
			 
			 // minus the stock from the product
			 int productStock = productDao.getProductStock(orderProductId);
			 if(productStock>0) {
				 int newStock = productStock - orderProductQuantity;
				 // update the new stock in db
				 productDao.updateProductStock(orderProductId, newStock);
			 }else {
				 request.getSession().setAttribute("status", "orderPlacedFailed");
				 response.sendRedirect(request.getContextPath() + StringUtils.CHECKOUT_PAGE);
				 return;
			 }
			 
		 }
		 
		 // remove all products from cart
		 if(orderId != -5) {
			 int result = cartDao.deleteAllCartItems(userId);
			 
				switch(result) {
				case 1  ->{
					request.getSession().setAttribute("status", "orderPlaced");
					response.sendRedirect(request.getContextPath() + StringUtils.HOME_PAGE);
				}
				case 0  ->{
					 request.getSession().setAttribute("status", "orderPlacedFailed");
					 response.sendRedirect(request.getContextPath() + StringUtils.CHECKOUT_PAGE);
				}
				case -1 ->{
					request.getSession().setAttribute("status", "server");
					 response.sendRedirect(request.getContextPath() + StringUtils.CHECKOUT_PAGE);
				}
				default ->{
					request.getSession().setAttribute("status", "default");
					 response.sendRedirect(request.getContextPath() + StringUtils.CHECKOUT_PAGE);
				}
				}
			 
		 }else {
			 request.getSession().setAttribute("status", "orderPlacedFailed");
			 response.sendRedirect(request.getContextPath() + StringUtils.CHECKOUT_PAGE);
		 }
		 
	}

}
