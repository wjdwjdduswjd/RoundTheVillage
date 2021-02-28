package com.kh.RoundTheVillage.banner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.RoundTheVillage.banner.model.service.BannerService;

@Controller
@RequestMapping("/banner/*")
public class BannerController {
	
	@Autowired
	private BannerService service;
	
	@RequestMapping("reg")
	public String reg() {
		return "banner/reg";
	}
	
	@RequestMapping("pay")
	public String pay() {
		return "banner/pay";
	}
	
	@RequestMapping("payComplete")
	public String payComplete() {
		return "banner/payComplete";
	}
	
	@RequestMapping("payList")
	public String payList() {
		return "banner/payList";
	}
	
	@RequestMapping("payView")
	public String payView() {
		return "banner/payView";
	}
}
