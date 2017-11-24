package com.Dao;

import java.util.List;

import com.model.Cart;

public interface CartDao 
{
	public boolean insert(Cart cart);
	public List<Cart> getCartById(String userEmail,int productId);
	public List<Cart> checkCartExist(String userEmail,int productId);
	public List<Cart> retriveCart(String userEmail);	
	public boolean deleteCart(Cart cart);
	public boolean updateCart(Cart cr);
	public Cart getBycartId(int cartId);
}
