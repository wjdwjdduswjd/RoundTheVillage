package com.kh.RoundTheVillage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kh.RoundTheVillage.banner.model.service.BannerService;
import com.kh.RoundTheVillage.banner.model.vo.Banner;
import com.kh.RoundTheVillage.main.model.service.MainService;
import com.kh.RoundTheVillage.member.model.vo.Member;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BannerService bService;
	
	@Autowired 
	private MainService service;

	
	@GetMapping("/")
	public String main(Model model, HttpServletRequest request) {
		
		// 결제 신청 후 배너 리스트 노출
		List<Banner> bList = bService.selectTodayBanner();
		model.addAttribute("bList", bList);
		
		
		
		// 좋아요 기준 12개 공방 리스트 조회 ---------------------------------------------
		List<Shop> likeList = service.likeCraftList();
	
		if(!likeList.isEmpty()) {
			List<ShopAttachment> thList = service.selectThumbnailList(likeList);
			model.addAttribute("thList", thList);
		}
		model.addAttribute("likeList", likeList);
		
		
		
		// 회원가입시 입력받은 주소 기준으로 동네 공방 조회 -------------------------------------
		
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		
		if(loginMember != null) {
			String addr = loginMember.getMemberAddr();
			String[] addrArr = addr.split(" ");
			
			List<Shop> addrList = service.aroundList(addrArr[1]);
			
			if(!addrList.isEmpty()) {
				List<ShopAttachment> addrThList = service.selectThumbnailList(addrList);
				model.addAttribute("addrThList", addrThList);
			}
			model.addAttribute("addrList", addrList);
		}
		
		
		
		
		// 관심 분야 -------------------------------------------------------------------
        if(request.getSession().getAttribute("loginMember") != null) {
           
        	String interest = ((Member) request.getSession().getAttribute("loginMember")).getMemberIntrs();
           
           if(interest != null) {
              String[] interestArr = interest.split(",");
              int ran = (int) (Math.random() * interestArr.length);
              
              List<Shop> intList = service.searchShopList(interestArr[ran]);
              
              if(!intList.isEmpty()) {
                 List<ShopAttachment> intfList = service.selectThumbnailList(intList);
                 if(!intfList.isEmpty()) 
                    request.setAttribute("intfList", intfList);
              }
              request.setAttribute("intList", intList);
           }
        }
        
        
        
        
		// 신규 공방 -------------------------------------------------------------------
		List<Shop> newList = service.newList();

		if (!likeList.isEmpty()) {
			List<ShopAttachment> newthList = service.selectThumbnailList(newList);
			model.addAttribute("newthList", newthList);
		}
		model.addAttribute("newList", newList);

		return "common/main";
	}
}
