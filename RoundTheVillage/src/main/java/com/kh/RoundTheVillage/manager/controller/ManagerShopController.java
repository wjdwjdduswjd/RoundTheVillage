package com.kh.RoundTheVillage.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.RoundTheVillage.manager.model.service.ManagerShopService;
import com.kh.RoundTheVillage.manager.model.vo.ManagerPageInfo;

import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

@Controller
@RequestMapping("/manager/*")
public class ManagerShopController {

	@Autowired
	private ManagerShopService service;


	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	@RequestMapping("shopList")
	public String shopList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model) {


		ManagerPageInfo pInfo =  service.getManagerPageInfo(cp);

		// 신청된 공방 목록 가져오기 
		List<Shop> sList = service.selectList(pInfo);
		System.out.println(sList);
		if(sList != null && !sList.isEmpty()) {

			model.addAttribute("pInfo", pInfo);
			model.addAttribute("sList", sList);

		}

		return "manager/shopList";
	}

	@RequestMapping("shopListView/{shopNo}")
	public String shopListView(@PathVariable("shopNo") int shopNo,Model model) {



		// 신정한 공방 내용 가져오기
		Shop shop = service.selectShop(shopNo);

		if (shop != null) { // 상세조회 성공 시

			model.addAttribute("shop", shop);

			ShopAttachment thumb = service.selectThumb(shopNo);

			// 조회된 이미지 목록이 있을 경우
			if (thumb != null) {
				model.addAttribute("thumb", thumb);
			}



		}
		return "manager/shopListView";

	}

	
	@RequestMapping("regiCon/{shopNo}")
	public String regCon(@PathVariable("shopNo") int shopNo) {


		int result = service.updateShopFl(shopNo);



		return "redirect:manager/shopListView" + shopNo;

	}



}
