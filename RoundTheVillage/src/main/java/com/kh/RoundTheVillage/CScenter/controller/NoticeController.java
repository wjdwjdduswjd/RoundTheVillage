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
import com.kh.RoundTheVillage.CScenter.model.vo.NoticeAttachment;
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

		List<Notice> nList = service.selectList(pInfo);

		model.addAttribute("nList", nList);
		model.addAttribute("pInfo", pInfo);

		return "CScenter/noticeList";
	}

	// 게시글 상세 조회 Controller
	// ------------------------------------------------------------------------------------
	@RequestMapping("{noticeNo}")
	public String noticeView(@PathVariable("noticeNo") int noticeNo, Model model,
			@RequestHeader(value = "referer", required = false) String referer, RedirectAttributes ra) {

		String url = null;

		Notice notice = service.selectNotice(noticeNo);

		if (notice != null) { // 상세조회성공

			List<NoticeAttachment> attachmentList = service.selectAttachmentList(noticeNo);

			if (attachmentList != null && !attachmentList.isEmpty()) { // 조회된 이미지 목록이 있을 경우
				model.addAttribute("attachmentList", attachmentList);
			}

			model.addAttribute("notice", notice);
			url = "CScenter/noticeView";

		} else { // 이전 요청 주소가 없는 경우
			if (referer == null) {
				url = "redirect:../noticeList";

			} else {
				url = "redirect:" + referer;
			}
			ra.addFlashAttribute("swalIcon", "error");
			ra.addFlashAttribute("swalTitle", "존재하지 않는 게시글입니다.");
		}
		return "CScenter/noticeView";
	}

	// 게시글 등록 화면 전환용 Controller
	// ---------------------------------------------------------------------------------------------------
	@RequestMapping("noticeInsert")
	public String insertView() {
		return "CScenter/noticeInsert";
	}

	// 게시글 등록 Controller
	// --------------------------------------------------------------------------------------------------------------
	@RequestMapping("insertAction")
	public String insertAction(@ModelAttribute Notice notice, HttpServletRequest request, RedirectAttributes ra) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeNo", notice.getNoticeNo());
		map.put("noticeTitle", notice.getNoticeTitle());
		map.put("noticeContent", notice.getNoticeContent());

		String savePath = null;

		// summernote 추가시 수정 부분
		// -------------------------------------------------------------------
		savePath = request.getSession().getServletContext().getRealPath("resources/infoImages/notice");

		// 게시글 삽입 Service 호출
		int result = service.insertNotice(map, savePath);

		String url = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 등록 성공";
			url = "redirect:" + result;

			request.getSession().setAttribute("returnListURL", "/RoundTheVillage/CScenter/noticeList?cp=1");

		} else {
			swalIcon = "error";
			swalTitle = "게시글 삽입 실패";
			url = "redirect:noticeInsert";
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}

	// summernote에 업로드된 이미지 저장 Controller
	@ResponseBody // 응답시 값 자체를 돌려보냄
	@RequestMapping("insertImage")
	public String insertImage(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) {

		// 서버에 파일(이미지)을 저장할 폴더 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/infoImages/notice");

		NoticeAttachment at = service.insertImage(uploadFile, savePath);

		// Java -> js로 객체 전달 : JSON
		return new Gson().toJson(at);
	}

	// 게시글 수정 화면 전환 ----------------------------------------------------------
	@RequestMapping("{noticeNo}/noticeUpdate")
	public String update(@PathVariable("noticeNo") int noticeNo, Model model) {

		Notice notice = service.selectNotice(noticeNo);

		if (notice != null) {
			List<NoticeAttachment> attachmentList = service.selectAttachmentList(noticeNo);
			model.addAttribute("attachmentList", attachmentList);
		}

		model.addAttribute("notice", notice);

		return "CScenter/noticeUpdate";
	}

	// 게시글 수정 -------------------------------------------------------------------
	@RequestMapping("{noticeNo}/updateAction")
	public String updateAction(@PathVariable("noticeNo") int noticeNo, @ModelAttribute Notice updateNotice, Model model,
			RedirectAttributes ra, HttpServletRequest request) {

		// noticeNo를 updateNotice에 세팅
		updateNotice.setNoticeNo(noticeNo);

		// System.out.println(updateNotice);

		// 파일 저장 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/infoImages/notice");

		// 게시글 수정
		int result = service.updateNotice(updateNotice);

		String url = null;

		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 수정 성공";
			url = "redirect:../" + noticeNo;

		} else {
			swalIcon = "error";
			swalTitle = "게시글 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;

	}

	// 게시글 삭제
	// ----------------------------------------------------------------------------------------------------
	@RequestMapping("{noticeNo}/delete")
	public String delete(@PathVariable("noticeNo") int noticeNo, Model model, RedirectAttributes ra,
			HttpServletRequest request) {

		//System.out.println("notice delete() called");
		int result = service.deleteNotice(noticeNo);

		String url = null;
		
		System.out.println("result:"+result);
		
		if (result > 0) {
			swalIcon = "success";
			swalTitle = "게시글 삭제 성공";
			String rawString = (String)request.getSession().getAttribute("returnListURL");
			String pageNum = rawString.split("CScenter/")[1];

			url = "redirect:../"+pageNum;
			//System.out.println("url:"+url);
			
		} else {
			swalIcon = "error";
			swalTitle = "게시글 삭제 실패";
			url = "redirect:" + request.getHeader("referer");
		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;

	}

	/*
	 * 
	 * 
	 * // 게시글 검색
	 * -----------------------------------------------------------------------------
	 * ---------------------------- public String searchAction() {
	 * 
	 * String searchKey = request.getParameter("sk"); String searchValue =
	 * request.getParameter("sv"); String cp = request.getParameter("cp");
	 * 
	 * return null; }
	 */

}
