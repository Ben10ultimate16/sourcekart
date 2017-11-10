package com.DaoImpl;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.UserDao;
import com.model.User;

@Repository

public class Userdaoimpl implements UserDao {
	@Autowired
	SessionFactory sessionFac;
	public void insertUser(User user)	
	{
		Session session= sessionFac.openSession();
		session.beginTransaction();
		session.persist(user);
		session.getTransaction().commit();
	}
		
	@Autowired
	public Userdaoimpl(SessionFactory sessionFactory)
	{
		super();
		sessionFac= sessionFactory;
	}

	/*public Object retrieve()
	{
		// TODO Auto-generated method stub
		return null;
	}*/


}
