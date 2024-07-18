package com.electra.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import com.electra.controller.dbController.DbController;
import com.electra.stringUtils.StringUtils;

public class PasswordDao {
	

	public int changePassword(String newPassword, String userName) {
		try(Connection con = DbController.getCon()){
			PreparedStatement ps = con.prepareStatement(StringUtils.CHANGE_PASSWORD);
			ps.setString(1, newPassword);
			ps.setString(2, userName);
			int result = ps.executeUpdate();
			return result > 0 ?1:0;
		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
}
