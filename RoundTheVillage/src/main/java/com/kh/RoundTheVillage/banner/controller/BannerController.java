package com.kh.RoundTheVillage.banner.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.RoundTheVillage.banner.model.service.BannerService;
import com.kh.RoundTheVillage.banner.model.vo.Banner;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/banner/*")
public class BannerController {
	
	@Autowired
	private BannerService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	// 배너 등록
	@RequestMapping("pay")
	public String pay(Model model) {
		
		Calendar cal = Calendar.getInstance();
		
		Set<String> dList = service.selectDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DATE));
		model.addAttribute("dList", dList);
		
		return "banner/pay";
	}
	
	@RequestMapping("insertImage")
	@ResponseBody
	public String insertImage(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/bannerImages"); // 서버에 파일 저장할 폴더 경로
		String fileName = service.insertImage(uploadFile, savePath);
		
		return new Gson().toJson(fileName);
	}
	
	@RequestMapping("selectDate")
	@ResponseBody
	public String selectDate(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("date") int date) {
        
        Set<String> dList = service.selectDate(year, month, date);
		return new Gson().toJson(dList);
	}
	
	@ResponseBody
	@RequestMapping("payAction")
	public int payAction(@ModelAttribute Banner banner, @RequestParam("startStr") String startStr,
			@RequestParam("endStr") String endStr, @ModelAttribute("loginMember") Member loginMember) throws ParseException {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = (Date) transFormat.parse(startStr);
		Date endDate = (Date) transFormat.parse(endStr);
		
		banner.setStartDate(new java.sql.Date(startDate.getTime()));
		banner.setEndDate(new java.sql.Date(endDate.getTime()));
		banner.setMemNo(loginMember.getMemberNo());
		
		return service.insertBanner(banner);
	}
	
	@RequestMapping("payComplete")
	public String payComplete(@RequestParam("impUid") String impUid, Model model) {
		
		Banner banner = service.selectBannerByUid(impUid);
		model.addAttribute("banner", banner);
		
		return "banner/payComplete";
	}
	
	// 배너 결제 내역
	@RequestMapping("payList")
	public String payList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, 
							@ModelAttribute("loginMember") Member loginMember, Model model) {
		
		PageInfo pInfo = service.getPageInfo(1, cp);
		List<Banner> bList = service.selectList(pInfo, loginMember.getMemberNo());
		
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("bList", bList);
		
		return "banner/payList";
	}
	
	@RequestMapping("payView/{banNo}")
	public String payView(@PathVariable("banNo") int banNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		
		Banner banner = service.selectBanner(banNo);
		model.addAttribute("banner", banner);
		
		String url = null;
		
		if(banner != null)
			url = "banner/payView";
		else {
			if(referer == null) // 이전 요청 주소가 없는 경우
				url = "redirect:../list";
			else
				url = "redirect:" + referer;
			
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 내역입니다.");
		}
		
		return url;
	}
	
	// 배너 결제 취소
	@RequestMapping("cancelBanner/{banNo}")
	public String cancelBanner(@PathVariable("banNo") int banNo, RedirectAttributes ra) {
		
		int result = service.cancelBanner(banNo);
		
		if(result > 0) {
			ra.addFlashAttribute("swalIcon", "success");
			ra.addFlashAttribute("swalTitle", "취소되었습니다.");
		} else {
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "취소 실패하였습니다.");
		}
		
		return "redirect:../payView/" + banNo;
	}
	
	// 관리자
	@RequestMapping("list")
	public String list(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		
		PageInfo pInfo = service.getPageInfo(0, cp);
		List<Banner> bList = service.selectList(pInfo, 0);
		
		model.addAttribute("pInfo", pInfo);
		model.addAttribute("bList", bList);
		
		return "banner/list";
	}
	
	@RequestMapping("view/{banNo}")
	public String view(@PathVariable("banNo") int banNo, Model model, RedirectAttributes ra) {
		
		Banner banner = service.selectBanner(banNo);
		
		String url = null;
		
		if(banner != null) {
			model.addAttribute("banner", banner);
			url = "banner/view";
		} else {
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 배너입니다.");
			
			url = "redirect:../list";
		}
		
		return url;
	}
	
	@RequestMapping("reg/{banNo}")
	public String reg(@PathVariable("banNo") int banNo, RedirectAttributes ra) {
		
		int result = service.updateBanFl(banNo);
		
		if(result > 0) {
			ra.addFlashAttribute("swalIcon", "success");
			ra.addFlashAttribute("swalTitle", "승인되었습니다.");
		} else {
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "승인 실패하였습니다.");
		}
		
		return "redirect:../view/" + banNo;
	}
}
