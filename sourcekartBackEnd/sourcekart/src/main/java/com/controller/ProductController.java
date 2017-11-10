package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Dao.CategoryDAO;
import com.Dao.ProductDAO;
import com.Dao.SupplierDAO;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
public class ProductController 
{
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	
	@RequestMapping(value="/product",method=RequestMethod.GET)
	public String showProduct(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		List<Product> listProduct = productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		m.addAttribute("categoryList",this.getCategories());
		
		return "Product";
	}
	
	public LinkedHashMap<Integer,String> getCategories()
	{
		List<Category> listCategories=categoryDAO.retrieveCategory();
		LinkedHashMap<Integer,String> categoriesList=new LinkedHashMap<Integer,String>();
		
		for(Category category:listCategories)
		{
			categoriesList.put(category.getCatId(),category.getCatName());
		}
		
		return categoriesList;
	}
	public LinkedHashMap<Integer,String> getSupplier()
	{
		List<Supplier> listSuppliers=supplierDAO.retrieveSupplier();
		LinkedHashMap<Integer,String> suppliersList=new LinkedHashMap<Integer,String>();
		
		for(Supplier supplier:listSuppliers)
		{
			suppliersList.put(supplier.getSupplierId(),supplier.getSupplierName());
		}
		
		return suppliersList;
	}
	
	@RequestMapping(value="/InsertProduct", method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product")Product product, HttpServletRequest request, @RequestParam("pimage")MultipartFile fileDetail, Model m)
	{
		productDAO.addProduct(product);
		int insertProductId = Integer.valueOf(product.getProductId());
		
		String path = "E:\\sourcekart\\sourcekart\\src\\main\\webapp\\WEB-INF\\resources";
		String orginalFilename = fileDetail.getOriginalFilename();
		/*Session session = sessionFactory.openSession();
		String imageUpdateQuery = "UPDATE Product set imageName = :imageName WHERE productId = :productId";
		Query query = session.createQuery(imageUpdateQuery);
		query.setParameter("imageName", orginalFilename);
		query.setParameter("productId", insertProductId);
		query.executeUpdate();*/
		
		String totalFileWithPath=path+String.valueOf(product.getProductId())+".jpg";
		File productImage = new File(totalFileWithPath);
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte fileBuffer[] = fileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(productImage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);;
				bs.close();
			}
			catch(Exception e)
			{
				m.addAttribute("error", e.getMessage());
			}
		}
		else
		{
			m.addAttribute("error", "Problem in file uploading.");
		}
		List<Product> listProduct = productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		Product product1 = new Product();
		m.addAttribute(product1);
		return "Product";
	}
	
	@RequestMapping(value="updateProduct/{productId}",method=RequestMethod.GET)
	public String updateProduct(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		m.addAttribute(product);
		
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		m.addAttribute("categoryList",this.getCategories());
		m.addAttribute("supplierId",this.getSupplier());
		
		return "UpdateProduct";
	}
	
	@RequestMapping(value="UpdateProduct",method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product")Product product,@RequestParam("pimage")MultipartFile fileDetail,Model m)
	{
		productDAO.updateProduct(product);
		Product product1=new Product();
		m.addAttribute(product1 );
		
		String path="E:\\sourcekart\\sourcekart\\src\\main\\webapp\\WEB-INF\\resources";
		String totalFileWithPath=path+String.valueOf(product.getProductId())+".jpg";
		File productImage=new File(totalFileWithPath);
		
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte fileBuffer[]=fileDetail.getBytes();
				FileOutputStream fos=new FileOutputStream(productImage);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			}
			catch (Exception e)
			{
				m.addAttribute("error",e.getMessage());
			}
		}
		else
		{
			m.addAttribute("error","Problem in File Uploading");
		}
		List<Product> listProduct = productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		m.addAttribute("categoryList",this.getCategories());
		m.addAttribute("supplierList",this.getSupplier());
		return "Product";
	}
	
	@RequestMapping(value="deleteProduct/{productId}",method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		productDAO.deleteProduct(product);
		Product product1=new Product();
		m.addAttribute(product1);
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		return "Product";
	}
}
