package com.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CartDao;
import com.Dao.CategoryDAO;
import com.Dao.OrdersDao;
import com.Dao.ProductDAO;
import com.Dao.SupplierDAO;
import com.Dao.UserDao;
import com.model.Cart;
import com.model.Orders;
import com.model.Product;
import com.model.User;


@Controller
public class CartController
{
@Autowired
SessionFactory sessionFactory;
	@Autowired
	UserDao userDao;
	@Autowired
	CategoryDAO categoryDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	ProductDAO productDao;
	@Autowired 
	SupplierDAO supplierDao;
	@Autowired
	OrdersDao orderDao;
	
	@RequestMapping(value="/MyCart",method=RequestMethod.GET)
	public String myCart(HttpSession session,Model m,HttpServletRequest req)
	{
		Principal principal=req.getUserPrincipal();
		String userEmail=principal.getName();
		List<Cart> userCartList=cartDao.retriveCart(userEmail);
		m.addAttribute("userCartList",userCartList);
		return "Cart";
	}	
	@RequestMapping(value="/AddCart",method=RequestMethod.POST)
	public String addCart(HttpSession session,Model m,HttpServletRequest req)
	
	{
		Principal principal=req.getUserPrincipal();
		String userEmail=principal.getName();
		int cartId=0;
		int productId=Integer.valueOf(req.getParameter("cartProductId"));
		int Quantity=Integer.valueOf(req.getParameter("cartQnty"));
		Product p=productDao.getProduct(productId);
		double price=p.getPrice();
		User u=userDao.getUser(userEmail);
	
		List<Cart> cartExist=cartDao.checkCartExist(userEmail, productId);
		if(cartExist.isEmpty())
		{
			Cart cm=new Cart();
			cm.setUser(u);
			cm.setProduct(p);
			cm.setCartQnty(Quantity);
			cm.setCartPrice(price);
			cartDao.insert(cm);
			
			
		}
		else
		{
			List<Cart> cartList=cartDao.getCartById(userEmail, productId);
			if(cartList.isEmpty())
			{
				Cart cm=new Cart();
				cm.setUser(u);
				cm.setProduct(p);
				cm.setCartQnty(Quantity);
				cm.setCartPrice(price);
				cartDao.insert(cm);
				
			}
			else
			{
				for(Cart c:cartList)
				{
					cartId=c.getCartId();
					Cart cm=new Cart();
					cm.setCartId(cartId);
					cm.setUser(u);
					cm.setProduct(p);
					cm.setCartQnty(Quantity);
					cm.setCartPrice(price);
					cartDao.updateCart(cm);
				}
			}
			
		}
		List<Cart> userCartList=cartDao.retriveCart(userEmail);
		m.addAttribute("userCartList",userCartList);
		return "Cart";
	}
	
	@RequestMapping(value="/placeorder",method=RequestMethod.GET)
	public String placeorderprocess(HttpSession session,Model m,HttpServletRequest req)
	{
	
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
		User user = userDao.getUser(userEmail);
		List<Cart> cart = cartDao.retriveCart(userEmail);
		m.addAttribute("user", user);
		m.addAttribute("cart", cart);
		return "Shippingaddress";
				
	}
	
	@RequestMapping(value="/invoiceProcess",method=RequestMethod.POST)
	public ModelAndView invoiceprocess(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("invoice");
		Double d = Double.parseDouble(req.getParameter("total"));
		String pmt = req.getParameter("payment");
		Principal principal = req.getUserPrincipal();
		String email = principal.getName();
		User usr = userDao.getUser(email);
		
		Orders os= new Orders();
		os.setUser(usr);
		os.setOrderDate(new Date());
		os.setPaymentMode(pmt);
		os.setOrderAmount(d);
		orderDao.createOrder(os);		
		mv.addObject("userDetails", usr);
		return mv;
	
		
	}
	
	/*@RequestMapping(value="/ack")
	public String ack(HttpServletRequest req)
	{
		Principal principal = req.getUserPrincipal();
		String email = principal.getName();
		List<Cart> userCartlist =cartDao.retriveCart(email);
		for(Cart c:userCartlist)
		{
			int cartId = c.getCartId();
			Cart cr=cartDao.getBycartId(cartId);
			cartDao.deleteCart(cr);
			

		}
		return "AckOrder";
	}*/
	@RequestMapping(value="/deleteCart/{cartId}",method=RequestMethod.GET)
	public String deleteCart(@PathVariable("cartId")int cartId,Model m,HttpServletRequest req)
	{
		Principal principal = req.getUserPrincipal();
		String email = principal.getName();
		Cart cart=cartDao.getBycartId(cartId);
		cartDao.deleteCart(cart);
		List<Cart> userCartList=cartDao.retriveCart(email);
		m.addAttribute("userCartList",userCartList);
		return "Cart";
		
	}
	
	
	
}