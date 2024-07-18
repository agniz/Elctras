package com.electra.model;

import java.util.Date;

public class OrderDetailsModel {
private int orderDetailId;
private int orderId;
private int orderProductId;
private int orderProductQuantity;
private int orderStatus; 
//orderStatus 0 means  pending
	// orderStatus 1 means shipping
// orderStatus 2 means delivered
private String customerUserName;
private double totalAmount;
private String order_date;
private String product_name;





public OrderDetailsModel( int orderId, int orderProductId, int orderProductQuantity) {
	super();
	
	this.orderId = orderId;
	this.orderProductId = orderProductId;
	this.orderProductQuantity = orderProductQuantity;
}


public OrderDetailsModel(int orderDetailId,int orderId, int orderProductQuantity, int orderStatus, String customerUserName,
		double totalAmount, String order_date, String product_name) {
	super();
	this.orderDetailId =  orderDetailId;
	this.orderId = orderId;
	this.orderProductQuantity = orderProductQuantity;
	this.orderStatus = orderStatus;
	this.customerUserName = customerUserName;
	this.totalAmount = totalAmount;
	this.order_date = order_date;
	this.product_name = product_name;
}


public String getCustomerUserName() {
	return customerUserName;
}


public void setCustomerUserName(String customerUserName) {
	this.customerUserName = customerUserName;
}


public double getTotalAmount() {
	return totalAmount;
}


public void setTotalAmount(double totalAmount) {
	this.totalAmount = totalAmount;
}


public String getOrder_date() {
	return order_date;
}


public void setOrder_date(String order_date) {
	this.order_date = order_date;
}


public String getProduct_name() {
	return product_name;
}


public void setProduct_name(String product_name) {
	this.product_name = product_name;
}


public int getOrderDetailId() {
	return orderDetailId;
}
public void setOrderDetailId(int orderDetailId) {
	this.orderDetailId = orderDetailId;
}
public int getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}
public int getOrderProductId() {
	return orderProductId;
}
public void setOrderProductId(int orderProductId) {
	this.orderProductId = orderProductId;
}
public int getOrderProductQuantity() {
	return orderProductQuantity;
}
public void setOrderProductQuantity(int orderProductQuantity) {
	this.orderProductQuantity = orderProductQuantity;
}
public int getOrderStatus() {
	return orderStatus;
}
public void setOrderStatus(int orderStatus) {
	this.orderStatus = orderStatus;
}

}
