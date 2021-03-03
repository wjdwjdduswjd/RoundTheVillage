package com.kh.RoundTheVillage.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.RoundTheVillage.member.model.service.MemberService;
import com.kh.RoundTheVillage.member.model.vo.Member;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	//회원가입 연결
	@RequestMapping("signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	//아이디 중복 체크 Controller (AJAX)
	@RequestMapping("idDupCheck")
	@ResponseBody
	public int idDupCheck( @RequestParam("memberId") String memberId) { 
		
		// 아이디 중복 검사 서비스 호출
		int result = service.idDupCheck(memberId);
		
		return result;
	}
	
	//이메일 중복 체크 Controller (AJAX)
	@RequestMapping("emailDupCheck")
	@ResponseBody
	public int emailDupCheck( @RequestParam("memberEmail") String memberEmail) { 
		
		// 아이디 중복 검사 서비스 호출
		int result = service.emailDupCheck(memberEmail);
		
		//System.out.println(result);
		
		return result;
	}
	
	//닉네임 중복 체크  Controller
	@RequestMapping("nickNameDupCheck")
	@ResponseBody
	public int nickNameDupCheck( @RequestParam("memberNickname") String memberNickname) {
		int result = service.nickNameDupCheck(memberNickname);
		
		//System.out.println(result);
		return result;
	}
	
	
	// 회원가입 동작
	@RequestMapping("signUpAction")
	public String signUpAction(@ModelAttribute Member signUpMember ,
								RedirectAttributes ra) {
		
		String returnUrl = null;
		//System.out.println(signUpMember);
		
		int result = service.signUp(signUpMember);
		
		if(result > 0) {        //추후 얼러트 창으로 바꿀 예정
			returnUrl = "/";
		}else {
			returnUrl = "member/signUp";
		}
		
		return "redirect:" + returnUrl ;
	}
	
	
	// 로그인화면 연결
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	// 로그인 동작
	@RequestMapping("loginAction")
	public String loginAction() {
		
		
		
		
		
		return "";
	}
	
	
	
	
	
	
	
	// 아이디/비밀번호 찾기 연결
	@RequestMapping("idFind")
	public String idFind() {
		return "member/idFind";
	}
	// 아이디/비밀번호 찾기 연결
	@RequestMapping("pwdFind")
	public String pwdFind() {
		return "member/pwdFind";
	}
	
	// 아이지 찾기 성공 페이지
	@RequestMapping("idFindComplete")
	public String idFindComplete() {
		return "member/idFindComplete";
	}
	
	
	// 아이지 찾기 성공 페이지
	@RequestMapping("pwdFindComplete")
	public String pwdFindComplete() {
		return "member/pwdFindComplete";
	}
	
	
	
	
	
}
