package com.kh.RoundTheVillage.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.RoundTheVillage.board.model.vo.Attachment;
import com.kh.RoundTheVillage.manager.model.service.ManagerReportService;
import com.kh.RoundTheVillage.manager.model.vo.ManagerPageInfo;
import com.kh.RoundTheVillage.manager.model.vo.ManagerReport;

@Controller
@RequestMapping("/manager/*")
public class ManagerReportController {
	
	@Autowired
	private ManagerReportService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("reportList")
	public String reportList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
							Model model) {
		
		ManagerPageInfo pInfo =  service.getManagerPageInfo(cp);
		
		
		List<ManagerReport> rList = service.selectList(pInfo);
		
		if (rList != null && !rList.isEmpty()) { 
		
			model.addAttribute("rList", rList);
			model.addAttribute("pInfo", pInfo);
		}

		return "manager/reportList";

		
	}
	
	
	@RequestMapping("deleteReport")
	public String deleteReport(@RequestParam("boardNo") int boardNo, RedirectAttributes ra,
							HttpServletRequest request, @RequestParam(value = "referer", required = false) String referer){
		
		int result = service.deleteReport(boardNo);
		
		String url = null;
		
		if(result > 0) {
			
			 swalIcon = "success";
     		 swalTitle = "게시글이 삭제되었습니다.";
     		 url = "redirect:reportlist";
			
			
		}else {
			
			 swalIcon = "error";
      		 swalTitle = "게시글 삭제 실패하였습니다.";
      		 url = "redirect:" + request.getHeader("referer");
			
		}
		
	
		 ra.addFlashAttribute("swalIcon", swalIcon);
		 ra.addFlashAttribute("swalTitle", swalTitle);
								
								
		return url;
		
	}
	
	/*
	 * public String deleteMember(@RequestParam("memberNo") int memberNo,
	 * RedirectAttributes ra, HttpServletRequest request, @RequestParam(value =
	 * "referer", required = false) String referer) {
	 * 
	 * int result = service.deleteMember(memberNo);
	 * 
	 * String url = null;
	 * 
	 * if(result > 0) { swalIcon = "success"; swalTitle = "회원정지 되었습니다."; url =
	 * "redirect:list";
	 * 
	 * }else {
	 * 
	 * swalIcon = "error"; swalTitle = "회원정지에 실패하였습니다."; url = "redirect:" +
	 * request.getHeader("referer");
	 * 
	 * }
	 * 
	 * ra.addFlashAttribute("swalIcon", swalIcon); ra.addFlashAttribute("swalTitle",
	 * swalTitle);
	 * 
	 * 
	 * return url;
	 * 
	 * 
	 * }
	 */
	
	
	// 후기 게시글 또는 리뷰 상태 변경 Controller
	@ResponseBody
	@RequestMapping("updateStatus")
	public int updateStatus(int no, String status, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("status", status);
		map.put("type", type);
		
		return service.updateStatus(map);
	}
	

	   
	   

	

	
	
	
	
	
	
			
	
	
	
	

}
