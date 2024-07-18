package com.electra.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electra.controller.dao.OrderDetailsDao;
import com.electra.stringUtils.StringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { StringUtils.UPDATE_ORDER_STATUS })
public class UpdateOderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    OrderDetailsDao orderDetail = new OrderDetailsDao();
    public UpdateOderStatus() {
        super();
       
    }

	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strStatus = request.getParameter("orderStatus");
		String strOrderDetailId = request.getParameter("orderId");
		
		int status = Integer.parseInt(strStatus);
		int orderDetailId = Integer.parseInt(strOrderDetailId);
		int resut = orderDetail.updateOrderStatus(orderDetailId, status);
		switch(resut) {
		case 1 -> {
			request.getSession().setAttribute("status", "updated");
        	response.sendRedirect(request.getContextPath()+StringUtils.ADMIN_PAGE);
		} case 0 ->{
       	 request.getSession().setAttribute("status", "failedStatus");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
       }case -1 ->{
       	request.getSession().setAttribute("status", "server");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
       }default ->{
       	request.getSession().setAttribute("status", "default");
			 response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
       }
		}
	}

}
