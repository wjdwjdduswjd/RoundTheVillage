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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.RoundTheVillage.pay.model.service.PayService;
import com.kh.RoundTheVillage.pay.model.vo.Coupon;
import com.kh.RoundTheVillage.pay.model.vo.Pay;
import com.kh.RoundTheVillage.pay.model.vo.PayLes;

import oracle.net.aso.i;

import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.lesson.model.service.LessonServiceImpl;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;
	
	// 결제 화면
	@RequestMapping("{lesNo}")
	public String pay(@PathVariable("lesNo") int lesNo, @RequestParam(value = "lesTime") int lesTime, @RequestParam(value = "lesAmount") int lesAmount,
			@ModelAttribute("loginMember") Member loginMember, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lesTime", lesTime);
		map.put("lesAmount", lesAmount);
		
		List<Coupon> cList = service.selectCupon(loginMember.getMemberNo());
		PayLes lesson = service.selectLesson(lesNo);
		
		model.addAttribute("cList", cList);
		model.addAttribute("lesson", lesson);
		model.addAttribute("map", map);
		
		return "pay/pay";
	}
	
	// 결제 삽입
	@ResponseBody
	@RequestMapping("payAction")
	public int payAction(
			@ModelAttribute Pay pay,
			@RequestParam("dateStr") String dateStr, @ModelAttribute("loginMember") Member loginMember) throws ParseException {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = (Date) transFormat.parse(dateStr);
		
		pay.setResDate(new java.sql.Timestamp(date.getTime()));
		pay.setMemNo(loginMember.getMemberNo());
		
		int result = service.insertPay(pay);
		
		if(result > 0 && pay.getCouponNo() != 0)
			result = service.updateCoupon(pay.getCouponNo());
			
		return result;
	}
	
	// 결제 완료 페이지
	@RequestMapping("complete")
	public String complete(@RequestParam("impUid") String impUid, Model model) {
		
		Pay pay = service.selectPayByUid(impUid);
		model.addAttribute("pay", pay);
		
		return "pay/complete";
	}
	
	// 예약 목록
	@RequestMapping("list")
	public String payList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model, @ModelAttribute("loginMember") Member loginMember) {
		
		PageInfo pInfo = service.getPageInfo(loginMember.getMemberNo(), cp);
		List<Pay> pList = service.selectList(pInfo, loginMember.getMemberNo());
		
		model.addAttribute("pList", pList);
		model.addAttribute("pInfo", pInfo);
		
		return "pay/list";
	}
	
	// 예약 상세
	@RequestMapping("view/{payNo}")
	public String payView(@PathVariable("payNo") int payNo, Model model, 
							@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {
		
		Pay pay = service.selectPay(payNo);
		String url = null;
		
		if(pay != null) {
			model.addAttribute("pay", pay);
			url = "pay/view";
			
		} else {
			if(referer == null) // 이전 요청 주소가 없는 경우
				url = "redirect:../list";
			else
				url = "redirect:" + referer;

			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 예약 내역입니다.");
		}
		
		return url;
	}
	
	@RequestMapping("cancelPay/{payNo}")
	public String cancelPay(@PathVariable("payNo") int payNo) {
		
		int result = service.cancelPay(payNo);
		return "redirect:../view" + payNo;
	}
}