package com.kh.RoundTheVillage.CScenter.controller;

import java.util.Arrays;
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

import com.google.gson.Gson;
import com.kh.RoundTheVillage.CScenter.model.service.NoticeService;
import com.kh.RoundTheVillage.CScenter.model.vo.Attachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;

@Controller // 컨트롤러 + 빈 등록
@SessionAttributes({ "loginMember" })
@RequestMapping("/CScenter/*")
public class NoticeController {

	// Service 객체 의존성 주입
	@Autowired // 등록된 bean 중에서 같은 타입인 bean을 자동적으로 의존성 주입
	private NoticeService service;

	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	// /board/list/1

	// @PathVariable : @RequestMapping에 작성된 URL 경로에 있는 특정 값을 변수로 사용할 수 있게하는 어노테이션
	// 게시글 목록 조회 컨트롤러
	@RequestMapping("noticeList")
	public String boardList(@RequestParam(value="cp", required = false, defaultValue = "1" )int cp, Model model) {
		
		PageInfo2 pInfo = service.getPageInfo(cp);

		List<Notice> bList = service.selectList(pInfo);
		
		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);
		
		
		return "CScenter/noticeList";
	}

	
	
	
	
	
	
	
}
