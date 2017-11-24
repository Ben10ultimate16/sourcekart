package com.DaoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.CartDao;
import com.model.Cart;

@Repository("cartDao")
public class CartDaoImpl implements CartDao 
{

	@Autowired
	SessionFactory sessionFactory;
	
	/*public CartDaoImpl() 
	{
		// TODO Auto-generated constructor stub
	}*/

	@Transactional
	public boolean insert(Cart cart) 
	{
		try
		{
			sessionFactory.getCurrentSession().saveOrUpdate(cart);
			return true;
		}
		catch(Exception e)
		{
			return false;
			
		}
	}
	
	@Transactional
	public boolean deleteCart(Cart cart) 
	{
		try
		{
			sessionFactory.getCurrentSession().delete(cart);
			return true;
		}
		catch(Exception e)
		{
			return false;
			
		}
	}

	public List<Cart> getCartById(String userEmail, int productId) 
	{
		Session session=sessionFactory.openSession();
		List<Cart> cr=null;
		try
		{
			session.beginTransaction();
			cr=(List<Cart>)session.createQuery("from Cart where email=:userEmail and productId=:productId").setString("userEmail", userEmail).setInteger("productId", productId).list();
			session.getTransaction().commit();
		}
		catch(HibernateException e)
		{
			session.getTransaction().rollback();
		}
		return cr;
	}

	public List<Cart> checkCartExist(String userEmail, int productId) 
	{
		Session session=sessionFactory.openSession();
		List<Cart> cr=null;
		try
		{
			session.beginTransaction();
			cr=(List<Cart>)session.createQuery("from Cart where email=:userEmail and productId=:productId").setString("userEmail", userEmail).setInteger("productId", productId).getResultList();
			session.getTransaction().commit();
		}
		catch(HibernateException e)
		{
			session.getTransaction().rollback();
		}
		
		return cr;
	}

	public List<Cart> retriveCart(String userEmail) 
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Cart where email=:userEmail").setString("userEmail", userEmail);
		List<Cart> listCart=query.list();
		session.close();
		return listCart;
	}

	@Transactional
	public boolean updateCart(Cart cart) 
	{
		try
		{
			sessionFactory.getCurrentSession().saveOrUpdate(cart);
			return true;
		}
		catch(Exception e)
		{
			return false;
			
		}
	}

	public Cart getBycartId(int cartId) 
	{
		Session session=sessionFactory.openSession();
		Cart cart=(Cart)session.get(Cart.class,cartId);
		session.close();
		return cart;
	}

}
