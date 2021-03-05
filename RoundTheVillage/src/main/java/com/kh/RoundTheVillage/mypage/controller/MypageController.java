package com.kh.RoundTheVillage.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.RoundTheVillage.member.model.vo.Member;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	// 내 정보 수정 연결
	@RequestMapping("myInfoChange")
	public String myInfoChange(){
		return "mypage/myInfoChange";
	}
	
	//비밀번호 변경
	@RequestMapping("changePwd")
	public String changePwd() {
		return "mypage/changePwd";
	}
	
	// 회원 탈퇴
	@RequestMapping("secession")
	public String secession() {
		return "mypage/secession";
	}
	
	// 내 정보 수정 
	@RequestMapping("updateAction")
	public String updateAction(@ModelAttribute Member updateMember,
								Model model, RedirectAttributes ra,
								@ModelAttribute(name="loginMember", binding = false) Member loginMember) {
		
		return null;
	}
	
	
	
		
}
