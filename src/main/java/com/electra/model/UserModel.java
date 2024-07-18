package com.electra.model;

public class UserModel {
//	declaring variables for users information
	
	private String fullName;
	private String phoneNumber;  //must be unique
	private String password;
	private String email;    //must be unique
	private String username;  //must be unique
	private int userType;
//	if userType = 0 then user is customer
//	if userType = 1 then user is admin
	
	
//	Constructor for creating customer user
	public UserModel( String fullName, String phoneNumber, String password, String email, String username) {
		super();
		this.fullName = fullName;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.email = email;
		this.username = username;
	}
	
public UserModel() {
	
}
	
//	Constructor for creating admin user
public UserModel( String fullName, String phoneNumber, String password, String email, String username,
		int userType) {
	super();
	this.fullName = fullName;
	this.phoneNumber = phoneNumber;
	this.password = password;
	this.email = email;
	this.username = username;
	this.userType = userType;
}

// Constrctor for edit profile
public UserModel(String fullName, String phoneNumber, String email, String username) {
	super();
	this.fullName = fullName;
	this.phoneNumber = phoneNumber;
	this.email = email;
	this.username = username;
}

//getters and setters
public String getFullName() {
	return fullName;
}


public void setFullName(String fullName) {
	this.fullName = fullName;
}


public String getPhoneNumber() {
	return phoneNumber;
}


public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getUsername() {
	return username;
}


public void setUsername(String username) {
	this.username = username;
}


public int getUserType() {
	return userType;
}


public void setUserType(int userType) {
	this.userType = userType;
}
	


	
	
	
}
