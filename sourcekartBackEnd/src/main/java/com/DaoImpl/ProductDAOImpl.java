package com.DaoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.ProductDAO;
import com.model.Product;





@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO 
{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public boolean addProduct(Product product) 
	{
		try
		{
			sessionFactory.getCurrentSession().save(product);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
	@Transactional
	public boolean deleteProduct(Product product) 
	{
		try
		{
			sessionFactory.getCurrentSession().delete(product);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	public List<Product> retrieveProduct() 
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("From Product");
		List<Product> listProduct=query.list();
		session.close();
		return listProduct;
	}

	

	@Transactional
	public Product getProduct(int productId) 
	{
		Session session=sessionFactory.openSession();
		Product product=(Product)session.get(Product.class,productId);
		session.close();
		return product;
	}

	@Transactional
	public boolean updateProduct(Product product) 
	{
		try 
		{
			sessionFactory.getCurrentSession().saveOrUpdate(product);
			return true;
		}
		catch(Exception e)
		{	
			System.out.println("Execption Arised:"+e);
			return false;
		}
	}

	public List<Product> retriveLatestProduct()
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product p order by p.productId desc");
		query.setMaxResults(3);
		List<Product> listProduct=query.list();
		session.close();
		return listProduct;

}

	public List<Product> getCategoryProduct(int categoryId)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product where catId="+categoryId);
		List<Product> listProduct=query.list();
		session.close();
		return listProduct;
}

}
