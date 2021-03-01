package com.kh.RoundTheVillage.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.RoundTheVillage.pay.model.service.PayService;

import sun.print.resources.serviceui;

@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService service;
	
	@RequestMapping("pay")
	public String pay() {
		return "pay/pay";
	}
	
	@RequestMapping("complete")
	public String complete() {
		return "pay/complete";
	}
	
	@RequestMapping("list")
	public String list() {
		return "pay/list";
	}
	
	@RequestMapping("payView")
	public String view() {
		return "pay/view";
	}
}
