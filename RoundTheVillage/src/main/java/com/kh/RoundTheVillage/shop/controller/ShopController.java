package com.kh.RoundTheVillage.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.RoundTheVillage.shop.model.service.ShopService;
import com.kh.RoundTheVillage.shop.model.vo.Shop;


@Controller
@RequestMapping("/shop/*")
public class ShopController {
	
	@Autowired
	private ShopService service;
	
	
	   private String swalIcon = null;
	   private String swalTitle = null;
	   private String swalText = null;
	   
	   
	   
	   // 공방 등록 화면 전환용 Controller
	   @RequestMapping("registration")
	   public String registration() {
		   
		return "redirect:";
		   
	   }
	   
	   // 공방 등록 Controller
	   @RequestMapping("RegistrationAction")
	   public String RegistrationAction (@ModelAttribute Shop shopRegistration,
			  							RedirectAttributes ra) {
		   
		   
		   
		   
		   return "shop/shopView";
	   }
	   
	   
	   
	  
	   
	   
	   

}
