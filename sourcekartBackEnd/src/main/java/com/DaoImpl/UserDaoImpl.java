package com.DaoImpl;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.*;
import com.model.*;

@Repository("userDAO")
public class UserDaoImpl implements UserDao{
	@Autowired
	SessionFactory sessionFac;
	
	
	public boolean insertUser(User user) {
		Session session=sessionFac.openSession();
		session.beginTransaction();
		session.persist(user);
		session.getTransaction().commit();
		return false;
	
	}
	
	
	public User getUser(String userEmail)
	{
		Session session=sessionFac.openSession();
		User user=(User)session.get(User.class, userEmail);
		session.close();
		return user;
	}

}
