package com.electra.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.electra.controller.dbController.DbController;
import com.electra.model.OrderDetailsModel;
import com.electra.stringUtils.StringUtils;


public class OrderDetailsDao {
	public void saveOrderDetail(OrderDetailsModel orderDetail) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.INSERT_INTO_ORDER_DETAIL);
			ps.setInt(1, orderDetail.getOrderId());
			ps.setInt(2, orderDetail.getOrderProductId());
			ps.setInt(3, orderDetail.getOrderProductQuantity());
			int rowCount = ps.executeUpdate();
			if(rowCount <=0) {
				System.out.println("Error vayo la insert garda");
			}
			
		} catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
          
            
        }
	}
	
	public List<OrderDetailsModel> getAllOrders(){
		List<OrderDetailsModel> allOrder = new ArrayList <>();
		 Connection con = null;
		  PreparedStatement ps = null;
		    ResultSet rs = null;
		    try {
		    	con = DbController.getCon();
		    	ps=con.prepareStatement(StringUtils.GET_ORDER_DETAILS);
		    	rs = ps.executeQuery();
		    	while(rs.next()) {
		    		int orderId = rs.getInt("order_id");
		    		String userName = rs.getString("username");
		    		String productName = rs.getString("product_name");
		    		int order_quantity = rs.getInt("order_quantity");
		    		double total = rs.getDouble("total");
		    		Timestamp orderTimestamp = rs.getTimestamp("order_date");
		    		//Date orderDate = new Date(orderTimestamp.getTime());
		    		LocalDateTime localDateTime = orderTimestamp.toLocalDateTime();
		    		int year = localDateTime.getYear();
		    		int month = localDateTime.getMonthValue();
		    		int day = localDateTime.getDayOfMonth();
		    		String orderDate = year + "/" + month + "/"+ day;
		    		int orderStatus = rs.getInt("order_status");
		    		int orderDetailId = rs.getInt("order_detail_id");
		    		
		    		OrderDetailsModel orderDetail = new OrderDetailsModel(orderDetailId,orderId,order_quantity,orderStatus,userName,total,orderDate,productName);
		    		allOrder.add(orderDetail);
		    		
		    	}
		    }catch (SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				 ex.getMessage();
			}
		 finally {
		        try {
		            if (rs != null) rs.close();
		            if (ps != null) ps.close();
		            if (con != null) con.close();
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		      
	}
		    return allOrder;
		    }
	
	public int updateOrderStatus(int orderDetailId, int status) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.UPDATE_ORDER_STATUS_QUERY);
			ps.setInt(1, status);
			ps.setInt(2, orderDetailId);
			int rowCount = ps.executeUpdate();
			return rowCount > 0 ? 1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			 return -1;
		}
	}
	
	}
