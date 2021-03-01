package com.kh.RoundTheVillage.CScenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller // 컨트롤러임을 알려줌 + bean 등록
@SessionAttributes({"loginMember"})
@RequestMapping("/notice/*") // 최상위 요청
public class NoticeController {
	
	@RequestMapping("list/{type}")
	public String noticeList(@PathVariable("type") int type,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {
		
		return "CScenter/noticeList";
	}
	

}
