package com.hibernateConfig;
import java.util.Properties;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.Dao.*;
import com.DaoImpl.UserDaoImpl;
import com.model.*;


@Configuration
@EnableTransactionManagement
@ComponentScan("com")
public class hiberConfig
{
   @Autowired
   @Bean(name="datasource")
   public DataSource getH2data()
   {
	  System.out.println("Hibernate initated......"); 
	  DriverManagerDataSource dt=new DriverManagerDataSource();
	  dt.setDriverClassName("org.h2.Driver");
	  dt.setUrl("jdbc:h2:tcp://localhost/~/shopping");
	  dt.setUsername("sa");
	  dt.setPassword("");
	  System.out.println("Connection is established....");
	  return dt;
	  
   }
 public Properties getHiberProps()
 {
	 Properties p=new Properties();
	 p.put("hibernate.dilacet","org.hibernate.dilacet.H2Dilacet");
	 p.put("hibernate.show_sql","true");
	 p.put("hibernate.hbm2ddl.auto","update");
	 
	 System.out.println("Data table created in  H2");
	 return p;
 }
 
@Autowired
@Bean(name= "sessionFactory")
public SessionFactory getSessionFactory(DataSource datasource)
{
	LocalSessionFactoryBuilder sb=new LocalSessionFactoryBuilder(datasource);
	sb.addProperties(getHiberProps());
	sb.addAnnotatedClass(User.class);
	SessionFactory sessionFactory=sb.buildSessionFactory();
	System.out.println("session Factory is started");
	return sessionFactory;
}


@Autowired
@Bean(name="UserDaoImpl")
public UserDao getUserData(SessionFactory sessionFac)
{
	return new UserDaoImpl(sessionFac);
}

@Autowired
@Bean
public HibernateTransactionManager getTranscationManager(SessionFactory sessionFactory)
{
  HibernateTransactionManager tm=new HibernateTransactionManager(sessionFactory);
  return tm;
}


}
