package com.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.ProductDAO;
/*import com.Dao.ProductDAO;*/
import com.DaoImpl.UserDaoImpl;
import com.model.Product;
/*import com.model.Product;*/
import com.model.User;

@Controller
public class indexController
{
	@Autowired
	   UserDaoImpl userdaoimpl;
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping("/")
	   public String index(Model m)
		{
		List<Product> listLatestProduct=productDAO.retriveLatestProduct();
		m.addAttribute("listLatestProduct", listLatestProduct);
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		
		return "index";
	
		}		

	
  /* @RequestMapping("/")
   public String index(Model m)
	{
		List<Product> listLatestProduct=productDao.retrieveProduct();
		m.addAttribute("listLatestProduct", listLatestProduct);
		return "index";
	}
*/
   /* @RequestMapping("/register")
   public String registration()
   {
	   return "register";
   }*/
   
  @RequestMapping(value="/register", method=RequestMethod.GET)
   public ModelAndView goToregister()
   {
	   ModelAndView mv=new ModelAndView(); 
       mv.addObject("user",new User());
       mv.setViewName("register");
       return mv;
	   }
   
   @RequestMapping(value="saveregister", method=RequestMethod.POST)
   public ModelAndView saveUser(@ModelAttribute("user")User user)
   {
       ModelAndView mv=new ModelAndView();
	   user.setRole("ROLE_USER");
	   userdaoimpl.insertUser(user);
	   mv.setViewName("index");
	   return mv;
   }
   
   @RequestMapping("/goTologin")
	public String goTologin(Model m)
	{
		User user= new User();
		m.addAttribute(user);
		return "login";
	}
   
   
	
	@RequestMapping("/userLogged")
	public String userLogged(Model m,HttpSession session)
	{
		String roleName=null;
		boolean loggedIn=false;
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		String loggedUsername=auth.getName();
		session.setAttribute("username", loggedUsername);
		Collection<GrantedAuthority> auths=(Collection<GrantedAuthority>)auth.getAuthorities();
		for(GrantedAuthority role:auths)
		{
			if(role.getAuthority().equals("ROLE_ADMIN"))
			{
				roleName="admin";
				loggedIn=true;
			}
			else
			{
				roleName="user";
				loggedIn=true;
			}
		}
		
		session.setAttribute("roleName", roleName);
		session.setAttribute("loggedIn", loggedIn);
		
		
		return "redirect:/";
	}
	
	@RequestMapping("/error")
	public String errorPage(Model m,HttpSession session)
	{
		return "error";
	}
   
	@RequestMapping("/ProductList")
	public String Page(Model m)
	{
		List<Product> listProduct = productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		return "ProductList";
	}
	
	@RequestMapping(value="/ProductDesc/{ProductId}",method=RequestMethod.GET)
	public String viewProduct(@PathVariable("productId")int ProductId,Model m)
	{
		Product product=productDAO.getProduct(ProductId);
		m.addAttribute(product);
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("ProductList",listProduct);
		return "ProductDesc";
	}
   
   
 /*  @RequestMapping("/Login")
  	public String login(@RequestParam(value = "error", required = false) String error, 
  			@RequestParam(value = "logout", required = false) String logout, Model model)
  	{
  		if(error != null) {
  			model.addAttribute("error", "Username or Password Incorrect");
  			}
  		
  		if(logout != null) {
  			model.addAttribute("logout", "Logged out Successfully");
  			}
  		return "Login";
  		}
*/

}
