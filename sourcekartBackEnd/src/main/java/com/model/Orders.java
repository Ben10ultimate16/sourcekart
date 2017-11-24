package com.model;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class Orders 
{
@Id
@GeneratedValue
private int orderId;
@ManyToOne
@JoinColumn(name="email")
private User user;
private Date orderDate;
private String paymentMode;
private double orderAmount;
public int getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public Date getOrderDate() {
	return orderDate;
}
public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
}
public String getPaymentMode() {
	return paymentMode;
}
public void setPaymentMode(String paymentMode) {
	this.paymentMode = paymentMode;
}
public double getOrderAmount() {
	return orderAmount;
}
public void setOrderAmount(double orderAmount) {
	this.orderAmount = orderAmount;
}


	
}
