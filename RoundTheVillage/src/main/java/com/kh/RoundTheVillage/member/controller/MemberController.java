package com.kh.RoundTheVillage.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	//회원가입 연결
	@RequestMapping("signUp")
	public String signUp() {
		return "member/signUp";
	}
	
	// 로그인화면 연결
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	
}
