package com.kh.RoundTheVillage.main.Controller;

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
import com.kh.RoundTheVillage.board.model.vo.Attachment;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.board.model.vo.Search;
import com.kh.RoundTheVillage.main.model.service.MainService;
import com.kh.RoundTheVillage.main.model.vo.mainPageInfo;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

@Controller 
@SessionAttributes({ "loginMember" })
@RequestMapping("/common/*")
public class MainController {

	@Autowired 
	private MainService service;


	// 인기 공방 (좋아요 기준) top12 ---------------------------------------------------------------------------------------------
	@RequestMapping("likeCraft")
	public String likeCraftList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model) {

		//mainPageInfo pInfo = service.getPageInfo(cp);

		List<Shop> likeList = service.likeCraftList();

		if(!likeList.isEmpty()) {
			List<ShopAttachment> thList = service.selectThumbnailList(likeList);
			
			model.addAttribute("thList", thList);
		}
		
		model.addAttribute("likeList", likeList);

		return "common/main";
	}

	
}
