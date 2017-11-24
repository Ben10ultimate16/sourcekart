package com.DaoImpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.OrdersDao;
import com.model.Orders;

@Repository("orderDao")
public class OrdersDaoImpl implements OrdersDao
{
	@Autowired
	SessionFactory sessionFac;
	@Transactional

	public boolean createOrder(Orders orders)
	{
		try
		{
			sessionFac.getCurrentSession().saveOrUpdate(orders);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}

	}

	
}
