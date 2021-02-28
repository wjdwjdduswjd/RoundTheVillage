package com.kh.RoundTheVillage.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.RoundTheVillage.shop.model.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopControler {
	
	@Autowired
	private ShopService service;
	
	
	   private String swalIcon = null;
	   private String swalTitle = null;
	   private String swalText = null;
	   
	  
	   
	   
	   

}
