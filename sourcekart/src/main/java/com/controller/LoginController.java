/*package com.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Dao.UserDao;
import com.model.User;

@Controller
public class LoginController 
{
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	UserDao userDAO;
	
	@RequestMapping("/gotologin")
	public String login(@RequestParam(value="error",required=false) String error,
			@RequestParam(value="logout",required=false) String logout,Model model)
	{
		if(error != null)
		{
			model.addAttribute("error","Username or Password Incorrect");
		}
		
		if(logout != null)
		{
			model.addAttribute("logout","Logged out Sucessful");
		}
		return "Login";
	}
	
	@RequestMapping(value="/gotologin",method=RequestMethod.GET)
	public String showProduct(Model m)
	{
		User user=new User();
		m.addAttribute(user);
		List<User> listUser = userDAO.retrieveUser();
		m.addAttribute("userList",listUser);
		
		return "login";
	}
	
	@RequestMapping("/userLogged")
	public String userLogged(Model m, HttpSession session)
	{	
		String roleName=null;
		boolean loggedIn=false;
		int userId=0;
		String userName = null;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loggedUsername = auth.getName();
		session.setAttribute("username", loggedUsername);
		Collection<GrantedAuthority> auths = (Collection<GrantedAuthority>)auth.getAuthorities();
		for(GrantedAuthority role:auths)
		{
			if(role.getAuthority().equals("ROLE_ADMIN"))
			{
				loggedIn = true;
				roleName = "admin";
			}
			else
			{
				loggedIn = true;
				roleName = "user";
			}
		}
		List<User> userList = userDAO.findByUsername(loggedUsername);
		for(User u:userList)
		{
			userName = u.getName();
		}
		session.setAttribute("userId", userId);
		session.setAttribute("userName", userName);
		session.setAttribute("loggedIn", loggedIn);
		session.setAttribute("roleName", roleName);
		
		return "redirect:/";
	}
}
*/