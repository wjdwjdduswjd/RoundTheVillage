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
	
	
}
