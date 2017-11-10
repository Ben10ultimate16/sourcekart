package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Dao.SupplierDAO;
import com.model.Supplier;




@Controller
public class SupplierController 
{
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping(value="/supplier", method=RequestMethod.GET)
	public String showSupplier(Model m)
	{
		Supplier supplier = new Supplier();
		m.addAttribute(supplier);
		List<Supplier> listSupplier = supplierDAO.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "Supplier";
	}
	
	@RequestMapping(value="/AddSupplier", method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier")Supplier supplier, Model m)
	{
		supplierDAO.addSupplier(supplier);
		List<Supplier> listSupplier = supplierDAO.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);
		return "Supplier";
	}
	
	@RequestMapping(value="updateSupplier/{supplierId}", method=RequestMethod.GET)
	public String updateSupplier(@PathVariable("supplierId")int supplierId, Model m)
	{
		Supplier supplier = supplierDAO.getSupplier(supplierId);
		m.addAttribute(supplier);
		List<Supplier> listSupplier = supplierDAO.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "UpdateSupplier";
	}
	
	@RequestMapping(value="UpdateSupplier", method=RequestMethod.POST)
	public String updateMySupplier(@ModelAttribute("supplier")Supplier supplier, Model m)
	{
		supplierDAO.updateSupplier(supplier);
		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);
		List<Supplier> listSupplier = supplierDAO.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "Supplier";
	}
	
	@RequestMapping(value="/deleteSupplier/{supplierId}", method=RequestMethod.GET)
	public String deleteSupplier(@PathVariable("supplierId")int supplierId, Model m)
	{
		Supplier supplier = supplierDAO.getSupplier(supplierId);
		supplierDAO.deleteSupplier(supplier);
		List<Supplier> listSupplier = supplierDAO.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		Supplier supplier1 = new Supplier();
		m.addAttribute(supplier1);
		return "Supplier";
	}
}
