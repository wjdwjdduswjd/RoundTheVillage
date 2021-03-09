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


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BannerService bService;
	
	@GetMapping("/")
	public String main(Model model) {
		
		List<Banner> bList = bService.selectTodayBanner();
		model.addAttribute("bList", bList);
		
		return "common/main";
	}
}
