package com.electra.model;

public class CartModel {
	private int cartId;
	private int userId;
	private int productId;
	private int productQuantity;
	private String productName;
	private double productPrice;
	private String productImage;
	
	// constructor to call while adding product in cart db
	public CartModel( int userId, int productId, int productQuantity) {
		super();
		
		this.userId = userId;
		this.productId = productId;
		this.productQuantity = productQuantity;
	}
	
	

	// constructor to call while getting cart and products details from  db
	public CartModel(int productId, int productQuantity, String productName, double productPrice, String productImage) {
		super();
		this.productId = productId;
		this.productQuantity = productQuantity;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productImage = productImage;
	}




	public int getCartId() {
		return cartId;
	}


	public void setCartId(int cartId) {
		this.cartId = cartId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public int getProductQuantity() {
		return productQuantity;
	}


	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public double getProductPrice() {
		return productPrice;
	}



	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}



	public String getProductImage() {
		return productImage;
	}



	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}



	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	
	
}
