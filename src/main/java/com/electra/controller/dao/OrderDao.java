package com.electra.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import com.electra.controller.dbController.DbController;
import com.electra.model.OrderModel;
import com.electra.stringUtils.StringUtils;


public class OrderDao {

	public int saveOrder(OrderModel order) {
		try(Connection con = DbController.getCon()){
			PreparedStatement pst = con.prepareStatement(StringUtils.INSERT_INTO_ORDERS,Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, order.getUserId());
			pst.setTimestamp(2, new Timestamp(order.getOrderDate().getTime()));
			pst.setDouble(3, order.getTotalAmount());
			
			int rowsCount = pst.executeUpdate();
			
			if(rowsCount > 0) {
				// order id ho key chai
				ResultSet key = pst.getGeneratedKeys();
				if(key.next()) {
					return key.getInt(1);
				}
			}
			
		}catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
		// insert fail vo vani
		return -5;
	}
	
}
