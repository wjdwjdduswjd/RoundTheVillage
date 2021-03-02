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

	// 게시글 목록 조회 컨트롤러
	// ---------------------------------------------------------------------------------------------
	@RequestMapping("noticeList")
	public String boardList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		PageInfo2 pInfo = service.getPageInfo(cp);

		List<Notice> bList = service.selectList(pInfo);

		model.addAttribute("bList", bList);
		model.addAttribute("pInfo", pInfo);

		return "CScenter/noticeList";
	}

	// 게시글 상세 조회 Controller
	// ------------------------------------------------------------------------------------
	@RequestMapping("noticeNo")
	public String boardView(@PathVariable("type") int type, @PathVariable("noticeNo") int noticeNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		String url = null;

		Notice notice = service.selectNotice(noticeNo);


		if (notice != null) { // 상세조회성공

			List<Attachment> attachmentList = service.selectAttachmentList(noticeNo);

			if (attachmentList != null && !attachmentList.isEmpty()) { // 조회된 이미지 목록이 있을 경우
				model.addAttribute("attachmentList", attachmentList);
			}

			model.addAttribute("notice", notice);
			url = "notice/noticeView";

		} else { // 이전 요청 주소가 없는 경우
			if (referer == null) {
				url = "redirect:../list/";

			} else {
				url = "redirect:" + referer;
			}
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}
		return url;
	}
	
	
	// 게시글 등록 화면 전환용 Controller ---------------------------------------------------------------------------------------------------
		@RequestMapping("noticeInsert")
		public String insertView() {
			
			return "CScenter/noticeInsert";
			
		}
	
	
	
	
	

}
