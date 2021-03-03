package com.kh.RoundTheVillage.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.RoundTheVillage.shop.model.service.ShopService;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;



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
		   
		return "shop/shopRegistration";
		   
	   }
	   
	   // 공방 등록 Controller
	   @RequestMapping("RegistrationAction")
	   public String RegistrationAction (@ModelAttribute Shop shop,
			  							RedirectAttributes ra, HttpServletRequest request,
			  							@RequestParam("image") MultipartFile image
			  							) {
		   
		   
		   int result = service.registrateShop(shop,image);
		   
		   
		   
		   if(result>0) {

			   System.out.println(result);
		   }
	
		   
		   
		   
		   return "shop/shopView";
	   }
	   
	   
	   
	  
	 // ----------------------------------summernote------------------------------------
	 // summernote에 업로드 된 이미지 저장 Controller 
	  @ResponseBody // 응답 시 값 자체를 돌려보냄
	  @RequestMapping("insertImage")
	  public String insertImage(HttpServletRequest request,
	                    @RequestParam("uploadFile") MultipartFile uploadFile) {
	
		 // 서버에 파일(이미지)을 저장할 폴더 경로 얻어오기
		 String savePath = 
		       request.getSession().getServletContext().getRealPath("resources/infoImages");
		 
		 ShopAttachment at = service.insertImage(uploadFile, savePath);
		 
		 // java -> js로 객체 전달 : JSON
		     
	     return new Gson().toJson(at);
	 }
	   
	   

}
