package com.electra.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.electra.controller.dbController.DbController;
import com.electra.model.CartModel;
import com.electra.stringUtils.StringUtils;

public class CartDao {
	public int addToCart(CartModel cart) {
		try(Connection con = DbController.getCon()){
			PreparedStatement pst = con.prepareStatement(StringUtils.INSERT_INTO_CART);
			pst.setInt(1, cart.getUserId());
			pst.setInt(2,cart.getProductId());
			pst.setInt(3, cart.getProductQuantity());
			int rowCount = pst.executeUpdate();
			return rowCount >0 ?1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
	
	public List <CartModel> getAllCartItems(int userId){
		List <CartModel> allCartItem = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DbController.getCon();
			ps = con.prepareStatement(StringUtils.GET_CART_DETAILS);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				String productName = rs.getString("product_name");
				double productPrice = rs.getDouble("product_price");
				String productImage = rs.getString("product_image");
				int productQuantity = rs.getInt("product_quantity");
				int productId = rs.getInt("product_id");
				CartModel cartModel = new CartModel(productId,productQuantity,productName,productPrice,productImage);
				allCartItem.add(cartModel);
			}
			}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
		}finally {
			 try {
		            if (rs != null) rs.close();
		            if (ps != null) ps.close();
		            if (con != null) con.close();
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
		}
		return allCartItem;
	}
	
	// method to delete one specific items from cart
	public int deleteCart(int productId, int userId) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.DELETE_CART_ITEM);
			ps.setInt(1, productId);
			ps.setInt(2, userId);
			int rowCount = ps.executeUpdate();
			return rowCount > 0 ?1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
	
	// method to delete all items from the cart
	public int deleteAllCartItems(int userId) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.DELETE_ALL_ITEM_FROM_CART);
			ps.setInt(1, userId);
			int rowCount = ps.executeUpdate();
			return rowCount > 0 ?1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
	
	public int updateCartQuantity(int productId, int userId, int quantity) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.UPDATE_CART_QUANTITY);
			ps.setInt(1, quantity);
			ps.setInt(2, productId);
			ps.setInt(3, userId);
			int rowCount = ps.executeUpdate();
			return rowCount >0 ?1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
}
