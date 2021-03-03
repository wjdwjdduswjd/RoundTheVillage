package com.kh.RoundTheVillage.pay.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.RoundTheVillage.pay.model.service.PayService;
import com.kh.RoundTheVillage.pay.model.vo.Coupon;
import com.kh.RoundTheVillage.pay.model.vo.Pay;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.lesson.model.service.LessonService;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService service;
	
	@Autowired
	private LessonService lesService;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	// 게시글 등록 화면 전환용 Controller
	@RequestMapping("{lesNo}")
	public String pay(@PathVariable("lesNo") int lesNo/* , @ModelAttribute("loginMember") Member loginMember */, Model model) {
		
		List<Coupon> cList = service.selectCupon(1);
		Lesson lesson = lesService.selectLesson(lesNo);
		System.out.println(cList);
		model.addAttribute("cList", cList);
		model.addAttribute("lesson", lesson);
		
		return "pay/pay";
	}
	
	// 게시글 등록 Controller
	@RequestMapping("payAction")
	public String payAction(
			@ModelAttribute Pay pay, @RequestParam("dateStr") String dateStr,/* @ModelAttribute("loginMember") Member loginMember, */
			@RequestParam("lesNo") int lesNo, HttpServletRequest request, RedirectAttributes ra) throws ParseException {
		
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = (Date) transFormat.parse(dateStr);
		
		pay.setResDate(new java.sql.Timestamp(date.getTime()));
		
		int result = service.insertPay(pay);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "예약 성공";
			url = "pay/complete";
			
		} else {
			swalIcon = "error";
			swalTitle = "예약 실패";
			url = "redirect:" + lesNo;
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		return url;
	}
	
	// 예약 목록
	@RequestMapping("list")
	public String payList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		
		PageInfo pInfo = service.getPageInfo(1, cp);
		List<Pay> pList = service.selectList(pInfo);
		System.out.println(pList);
		
//		if(pList != null && !pList.isEmpty()) {
//			List<Attachment> thumbnailList = service.selectThumbnailList(bList);
//			
//			if(thumbnailList != null)
//				model.addAttribute("thList", thumbnailList);
//		}
		
		model.addAttribute("pList", pList);
		model.addAttribute("pInfo", pInfo);
		
		return "pay/list";
	}
	
	// 예약 상세
	@RequestMapping("view/{payNo}")
	public String payView(@PathVariable("payNo") int payNo, Model model, 
							@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		
		Pay pay = service.selectPay(payNo);
		System.out.println(pay);
		String url = null;
		
		if(pay != null) {
//			Lesson lesson = service
			
//			Attachment attachment = service.selectAttachmentList(payNo);
//			
//			model.addAttribute("attachmentList", attachmentList);
			model.addAttribute("pay", pay);
			url = "pay/view";
			
		} else {
			if(referer == null) // 이전 요청 주소가 없는 경우
				url = "redirect:../list";
			else
				url = "redirect:" + referer;

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}
		
		return url;
	}
}