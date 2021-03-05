package com.kh.RoundTheVillage.banner.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.RoundTheVillage.banner.model.service.BannerService;
import com.kh.RoundTheVillage.banner.model.vo.Banner;
import com.kh.RoundTheVillage.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/banner/*")
public class BannerController {
	
	@Autowired
	private BannerService service;
	
	@RequestMapping("pay")
	public String pay() {
		return "banner/pay";
	}
	
	@RequestMapping("insertImage")
	@ResponseBody
	public String insertImage(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) {
		System.out.println(uploadFile);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/bannerImages"); // 서버에 파일 저장할 폴더 경로
		String fileName = service.insertImage(uploadFile, savePath);
		
		return new Gson().toJson(fileName);
	}
	
	@ResponseBody
	@RequestMapping("payAction")
	public int payAction(@ModelAttribute Banner banner, @RequestParam("startStr") String startStr,
			@RequestParam("endStr") String endStr/* , @ModelAttribute("loginMember") Member loginMember */) throws ParseException {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = (Date) transFormat.parse(startStr);
		Date endDate = (Date) transFormat.parse(endStr);
		
		banner.setStartDate(new java.sql.Date(startDate.getTime()));
		banner.setEndDate(new java.sql.Date(endDate.getTime()));
//		banner.setMemNo(loginMember.getMemberNo());
		banner.setMemNo(1);
		System.out.println(banner);
		
		return service.insertBanner(banner);
	}
	
	@RequestMapping("payComplete")
	public String payComplete(@RequestParam("impUid") String impUid, Model model) {
		
		Banner banner = service.selectBannerByUid(impUid);
		model.addAttribute("banner", banner);
		System.out.println(banner);
		
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
	
	@RequestMapping("reg")
	public String reg() {
		return "banner/reg";
	}
}
