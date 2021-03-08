package com.kh.RoundTheVillage.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	

}
