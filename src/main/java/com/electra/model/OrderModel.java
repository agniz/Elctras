package com.electra.model;

import java.util.Date;

public class OrderModel {
	private int orderId;
	private int userId;
	private Date orderDate;

	private double totalAmount;
	

	// use this constructor to while adding order in database
	public OrderModel(int userId, Date orderDate, double totalAmount) {
		super();
		this.userId = userId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
	}

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	
	
}
