package com.electra.controller.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.electra.controller.dbController.DbController;
import com.electra.model.UserModel;
import com.electra.stringUtils.StringUtils;

public class UserDao {
	public int registerUser(UserModel user) {		
		try (Connection con = DbController.getCon()){
//			Check for existing username as username must be unique
			PreparedStatement checkUsernamepst = con.prepareStatement(StringUtils.GET_USERNAME);
			checkUsernamepst.setString(1, user.getUsername());
			ResultSet checkUsernamers = checkUsernamepst.executeQuery();
			checkUsernamers.next();
			if(checkUsernamers.getInt(1) > 0) {
				return -2;
			}
//			Check for existing phone number
			PreparedStatement checkPhoneSt = con.prepareStatement(StringUtils.GET_PHONENUMBER);
			checkPhoneSt.setString(1, user.getPhoneNumber());
			ResultSet checkPhoneRs = checkPhoneSt.executeQuery();
			checkPhoneRs.next();
			if(checkPhoneRs.getInt(1)>0) {
				return -3;
			}
//			Check for existing email
			PreparedStatement checkEmailSt = con.prepareStatement(StringUtils.GET_EMAIL);
			checkEmailSt.setString(1, user.getEmail());
			ResultSet checkEmailRs = checkEmailSt.executeQuery();
			checkEmailRs.next();
			if(checkEmailRs.getInt(1)>0) {
				return -4;
			}
			
			PreparedStatement pst = con.prepareStatement(StringUtils.INSERT_USER);
			pst.setString(1, user.getFullName());
			pst.setString(2, user.getPhoneNumber());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getUsername());
			pst.setString(5, user.getEmail());
			int rowCount = pst.executeUpdate();
//			return 1 if rowCount is greater than 0 else return 0; 
			return rowCount > 0 ? 1 : 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
	
	public int registerAdmin(UserModel user) {		
		try (Connection con = DbController.getCon()){
//			Check for existing username as username must be unique
			PreparedStatement checkUsernamepst = con.prepareStatement(StringUtils.GET_USERNAME);
			checkUsernamepst.setString(1, user.getUsername());
			ResultSet checkUsernamers = checkUsernamepst.executeQuery();
			checkUsernamers.next();
			if(checkUsernamers.getInt(1) > 0) {
				return -2;
			}
//			Check for existing phone number
			PreparedStatement checkPhoneSt = con.prepareStatement(StringUtils.GET_PHONENUMBER);
			checkPhoneSt.setString(1, user.getPhoneNumber());
			ResultSet checkPhoneRs = checkPhoneSt.executeQuery();
			checkPhoneRs.next();
			if(checkPhoneRs.getInt(1)>0) {
				return -3;
			}
//			Check for existing email
			PreparedStatement checkEmailSt = con.prepareStatement(StringUtils.GET_EMAIL);
			checkEmailSt.setString(1, user.getEmail());
			ResultSet checkEmailRs = checkEmailSt.executeQuery();
			checkEmailRs.next();
			if(checkEmailRs.getInt(1)>0) {
				return -4;
			}
			
			PreparedStatement pst = con.prepareStatement(StringUtils.INSERT_ADMIN_USER);
			pst.setString(1, user.getFullName());
			pst.setString(2, user.getPhoneNumber());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getUsername());
			pst.setString(5, user.getEmail());
			pst.setInt(6, user.getUserType());
			int rowCount = pst.executeUpdate();
//			return 1 if rowCount is greater than 0 else return 0; 
			return rowCount > 0 ? 1 : 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
	
	//method to edit profile for user
	public int editUserDetails(int user_id, UserModel user) {
		try (Connection con = DbController.getCon()){
//			Check for existing username as username must be unique
			PreparedStatement checkUsernamepst = con.prepareStatement(StringUtils.GET_USERNAME_FOR_UPDATE);
			checkUsernamepst.setString(1, user.getUsername());
			checkUsernamepst.setInt(2,  user_id);
			ResultSet checkUsernamers = checkUsernamepst.executeQuery();
			checkUsernamers.next();
			if(checkUsernamers.getInt(1) > 0) {
				return -2;
			}
//			Check for existing phone number
			PreparedStatement checkPhoneSt = con.prepareStatement(StringUtils.GET_PHONENUMBER_FOR_UPDATE);
			checkPhoneSt.setString(1, user.getPhoneNumber());
			checkPhoneSt.setInt(2,  user_id);
			ResultSet checkPhoneRs = checkPhoneSt.executeQuery();
			checkPhoneRs.next();
			if(checkPhoneRs.getInt(1)>0) {
				return -3;
			}
//			Check for existing email
			PreparedStatement checkEmailSt = con.prepareStatement(StringUtils.GET_EMAIL_FOR_UPDATE);
			checkEmailSt.setString(1, user.getEmail());
			checkEmailSt.setInt(2,  user_id);
			ResultSet checkEmailRs = checkEmailSt.executeQuery();
			checkEmailRs.next();
			if(checkEmailRs.getInt(1)>0) {
				return -4;
			}
			
			PreparedStatement pst = con.prepareStatement(StringUtils.UPDATE_USER);
			pst.setString(1, user.getFullName());
			pst.setString(2, user.getPhoneNumber());
			pst.setString(3, user.getUsername());
			pst.setString(4, user.getEmail());
			pst.setInt(5,user_id);
			int rowCount = pst.executeUpdate();
//			return 1 if rowCount is greater than 0 else return 0; 
			return rowCount > 0 ? 1 : 0;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			 ex.getMessage();
			return -1;
		}
	}
	
//get hashed password from database
	public String getHashedPassword(String username) {
		try(Connection con = DbController.getCon()){
		PreparedStatement st = con.prepareStatement(StringUtils.GET_HASHED_PASSWORD);
		st.setString(1, username);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			String hashPassword = rs.getString("password");
			return hashPassword;
		}else {
			return null;
		}
		
		}
		 catch (SQLException | ClassNotFoundException ex) {
		        ex.printStackTrace();
		        return null; 
		    }
	}
	
//	get loginDetails
	public int getLoginDetails(String username, String password) {
		try(Connection con = DbController.getCon()){
			PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_INFO);
			st.setString(1, username);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				int userType = rs.getInt("user_type");
				System.out.println(userType);
//				return 1 if user is admin
				if(userType == 1) {
					return 1;
//					return 0 if user is customer
				}else if(userType == 0) {
					return 0;
				}
				
			}
//			return 5 if no user found
			return 5;
		}
		catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	        return -5; 
	    }
	}
	
//	function for hashing password
	 public String encryptPassword(String password) {
		    try {
		        MessageDigest md = MessageDigest.getInstance("MD5");
		        byte[] messageDigest = md.digest(password.getBytes());
		        BigInteger bigInt = new BigInteger(1, messageDigest);
		        return bigInt.toString(16);
		    } catch (NoSuchAlgorithmException e) {
		        e.printStackTrace(); 
		        return null; 
		    }
		}
	 
//	 method to get user_id from userName
	 public int getUserId(String userName) {
		 try {
			 Connection con = DbController.getCon();
			 PreparedStatement ps = con.prepareStatement(StringUtils.GET_USERID);
			 ps.setString(1,userName);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 int userId = rs.getInt("user_id");
				 return userId;
			 }
			 return -3;
		 }catch (SQLException | ClassNotFoundException ex) {
		        ex.printStackTrace();
		        return -5; 
		    }
	 }
	 
	 public UserModel getUserDetailByUserName(String username){
		 UserModel singleUser = null;
		 try(Connection con = DbController.getCon()){
			 PreparedStatement ps = con.prepareStatement(StringUtils.USER_DETAIL_BY_USERNAME);
			 ps.setString(1, username);
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 String fullName = rs.getString("full_name");
				 String phoneNumber = rs.getString("phone_number");
				 String userName = rs.getString("username");
				 String email = rs.getString("email");
				 singleUser = new UserModel();
				 singleUser.setFullName(fullName);
				 singleUser.setPhoneNumber(phoneNumber);
				 singleUser.setUsername(userName);
				 singleUser.setEmail(email);
			 }
		 }catch (SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				 ex.getMessage();
			}
		 return singleUser;
	 }
	 
	 // get all customers
	 public List<UserModel> getAllUsers(){
		 List<UserModel> allUsers = new ArrayList<>();
		 try(Connection con = DbController.getCon()){
			 PreparedStatement ps = con.prepareStatement(StringUtils.GET_ALL_USER);
			 ResultSet rs = ps.executeQuery();
			 while (rs.next()) {
				 
				 String fullName = rs.getString("full_name");
				 String phoneNumber = rs.getString("phone_number");
				 String username = rs.getString("username");
				 int userType = rs.getInt("user_type");
				 String email = rs.getString("email");
				 UserModel usermodel = new UserModel();
				 usermodel.setFullName(fullName);
				 usermodel.setPhoneNumber(phoneNumber);
				 usermodel.setUsername(username);
				 usermodel.setEmail(email);
				 usermodel.setUserType(userType);
				 allUsers.add(usermodel);
			 }
		 }catch (SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
				 ex.getMessage();
			}
		 return allUsers;
	 }

}
