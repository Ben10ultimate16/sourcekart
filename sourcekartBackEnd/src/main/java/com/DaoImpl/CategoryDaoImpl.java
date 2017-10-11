package com.DaoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Dao.*;
import com.model.*;

@Repository


public class CategoryDaoImpl implements UserDao
{
  @Autowired
  SessionFactory sessionFac;
  public void insertUser(User user)
  {
	  Session session=sessionFac.openSession();
	  session.beginTransaction();
	  session.persist(user);
	  session.getTransaction().commit();
  }
@Autowired
public CategoryDaoImpl(SessionFactory sessionFactory)
{
	super();
	sessionFac=sessionFactory;
	
}

public List<Category>  retrieve()
{
	Session session=sessionFac.openSession();
	session.beginTransaction();
	@SuppressWarnings("unchecked")
	List<Category> li=session.createQuery("from category").list();
	session.getTransaction().commit();
    return li;
}

}