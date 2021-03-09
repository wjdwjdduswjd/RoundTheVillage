package com.kh.RoundTheVillage;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.RoundTheVillage.banner.model.service.BannerService;
import com.kh.RoundTheVillage.banner.model.vo.Banner;
import com.kh.RoundTheVillage.main.model.service.MainService;
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
	public String main(Model model) {
		
		List<Banner> bList = bService.selectTodayBanner();
		model.addAttribute("bList", bList);
		
		
		//mainPageInfo pInfo = service.getPageInfo(cp);

		List<Shop> likeList = service.likeCraftList();
	
		if(!likeList.isEmpty()) {
			List<ShopAttachment> thList = service.selectThumbnailList(likeList);
			
			model.addAttribute("thList", thList);
		}
		
		model.addAttribute("likeList", likeList);
	
		return "common/main";
	}
}
