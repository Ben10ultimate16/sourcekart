package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.Userdaoimpl;
import com.model.User;

@Controller
public class indexController
{
	@Autowired
	   Userdaoimpl userdaoimpl;

   @RequestMapping("/")
   public String index()
   {
	   return "index";
   }
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
   
   @RequestMapping("/Login")
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


}