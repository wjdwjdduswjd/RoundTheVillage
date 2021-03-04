package com.kh.RoundTheVillage.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.RoundTheVillage.member.model.vo.Member;
import com.kh.RoundTheVillage.shop.model.service.ShopService;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;



@Controller
@SessionAttributes("loginMember")
@RequestMapping("/shop/*")
public class ShopController {
	
	@Autowired
	private ShopService service;
	
	
	   private String swalIcon = null;
	   private String swalTitle = null;
	   private String swalText = null;
	   
	   // 공방 상세 조회Controller
	   @RequestMapping("{shopNo}")
	   public String shopView(@PathVariable("shopNo") int shopNo, Model model) {
		   	Shop shop = service.selectShop(shopNo);
			int csGoodCount = service.selectCsGoodCount(shopNo);
			model.addAttribute("shop", shop);
			model.addAttribute("csGoodCount", csGoodCount);
	
			return "shop/shopView";
	   }
	   
	   
	   
		// 공방 등록 화면 전환용 Controller
		@RequestMapping("registration")
		public String registration(@ModelAttribute("loginMember") Member loginMember, Model model,
								RedirectAttributes ra) {
			// 등록한 공방이 없으면(-1) 공방 등록 페이지로 이동
			// 등록한 공방이 있지만 관리자가 수락을 안했으면(0) 메인 페이지로 이동하여 "수락 대기중" 메세지 출력
			// 공방이 있고 수락 됐으면(1) 공방 상세 조회 페이지로 화면 전환

			int result = service.selectRegistrationFlag(loginMember.getMemberNo());

			String url = null;

			if (result == 1) {
				url = "redirect:" + loginMember.getMemberNo();

			} else if (result == -1) {
				url = "shop/shopRegistration";
				
			} else { // 0
				ra.addFlashAttribute("swalIcon", "info");
				ra.addFlashAttribute("swalTitle", "수락 대기중");
				url = "redirect:/";
			}

			return url;

		}
	   
	   // 공방 등록 Controller
	   @RequestMapping("RegistrationAction")
	   public String RegistrationAction (@ModelAttribute Shop shop,
			  							RedirectAttributes ra, HttpServletRequest request,
			  							@RequestParam("image") MultipartFile image,
			  							@ModelAttribute Member loginMember
			  							) {
		   
		   
		   int shopNo = loginMember.getMemberNo();
		   
		   shop.setShopNo(shopNo);
		   
		   String savePath = null;
	         
		   
		   int result = service.registrateShop(shop,image,savePath);
		   
		   
		   String url = null;
		   
		   if(result>0) { //등록 성공 했을 때
			   swalIcon = "success";
	            swalTitle = "공방 등록 성공";
			 
		   }else {
			   
			   swalIcon = "error";
	            swalTitle = "공방 등록 실패";
			   
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
