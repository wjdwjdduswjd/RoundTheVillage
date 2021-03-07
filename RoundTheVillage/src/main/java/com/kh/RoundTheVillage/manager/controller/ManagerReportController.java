package com.kh.RoundTheVillage.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.RoundTheVillage.manager.model.service.ManagerReportService;

@Controller
@RequestMapping("/manager/*")
public class ManagerReportController {
	
	@Autowired
	private ManagerReportService service;
	
	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("reportList")
	public String reportList() {
		
		
		
		
		return "manager/reportList";
		
	}
	
	
	

}
