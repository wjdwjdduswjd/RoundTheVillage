package com.kh.RoundTheVillage.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReview;
import com.kh.RoundTheVillage.member.model.vo.Member;
import com.kh.RoundTheVillage.shop.model.service.ShopService;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;


@Controller
@SessionAttributes("loginMember")
@RequestMapping("/shop/*")
public class ShopController {

	@Autowired
	private ShopService service;

	private String swalIcon = null;
	private String swalTitle = null;
	private String swalText = null;

	// 공방 상세 조회Controller
	@RequestMapping("{shopNo}")
	public String shopView(@PathVariable("shopNo") int shopNo, Model model, @ModelAttribute Lesson lesson) {

		// 공방 상세조회 Service 호출
		Shop shop = service.selectShop(shopNo);

		if (shop != null) { // 상세조회 성공 시

			model.addAttribute("shop", shop);

			ShopAttachment thumb = service.selectThumb(shopNo);

			// 조회된 이미지 목록이 있을 경우
			if (thumb != null) {
				model.addAttribute("thumb", thumb);
			}


			// 수업 리스트
			// 가져오기----------------------------------------------------------------------------------

			List<Lesson> lesList = service.selectlesList(shopNo);

			if (lesList != null && !lesList.isEmpty()) { // 게시글 목록 조회 성공 시
				List<LessonFile> thumbnailList = service.selectThumbnailList(lesList);

				if (thumbnailList != null) {

					model.addAttribute("thList", thumbnailList);
					System.out.println(thumbnailList);
				}
			}
			model.addAttribute("lesList", lesList);
			System.out.println(lesList);
			// 리뷰 목록 가져 오기----------------------------------------

			List<LessonReview> reviewList = service.selectReviewList(shopNo);

			model.addAttribute("reviewList", reviewList);

		}

		return "shop/shopView";

	}

	// 공방 등록 화면 전환용 Controller
	@RequestMapping("registration")
	public String registration(@ModelAttribute("loginMember") Member loginMember, Model model, RedirectAttributes ra) {
		// 등록한 공방이 없으면(-1) 공방 등록 페이지로 이동
		// 등록한 공방이 있지만 관리자가 수락을 안했으면(0) 메인 페이지로 이동하여 "수락 대기중" 메세지 출력
		// 공방이 있고 수락 됐으면(1) 공방 상세 조회 페이지로 화면 전환

		int result = service.selectRegistrationFlag(loginMember.getMemberNo());

		String url = null;

		if (result == 1) {
			url = "redirect:" + loginMember.getMemberNo();

		} else if (result == -1) {
			url = "shop/shopRegistration";

		} else { // 0
			ra.addFlashAttribute("swalIcon", "info");
			ra.addFlashAttribute("swalTitle", "수락 대기중");
			url = "redirect:/";
		}

		return url;

	}

	// 공방 등록 Controller
	@RequestMapping("RegistrationAction")
	public String RegistrationAction(@ModelAttribute Shop shop, RedirectAttributes ra, HttpServletRequest request,
			@RequestParam(value = "images", required = false) List<MultipartFile> images,
			@ModelAttribute("loginMember") Member loginMember) {

		int shopNo = loginMember.getMemberNo();

		if (shopNo > 0) {
			shop.setShopNo(shopNo);
		}

		String savePath = null;

		savePath = request.getSession().getServletContext().getRealPath("resources/images/shop");

		// 공방 등록 Service
		int result = service.registrateShop(shop, images, savePath);

		System.out.println("result : " + result);

		String url = null;

		if (result > 0) { // 등록 성공 했을 때
			swalIcon = "success";
			swalTitle = "공방 등록 성공";

			url = "redirect:/";

		} else {

			swalIcon = "error";
			swalTitle = "공방 등록 실패";

			url = "redirect:shopRegistration";

		}

		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);

		return url;
	}

	// ----------------------------------summernote------------------------------------
	// summernote에 업로드 된 이미지 저장 Controller
	@ResponseBody // 응답 시 값 자체를 돌려보냄
	@RequestMapping(value={"insertImage", "update/insertImage"})
	public String insertImage(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) {

		// 서버에 파일(이미지)을 저장할 폴더 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/shop");

		ShopAttachment at = service.insertImage(uploadFile, savePath);

		return new Gson().toJson(at);
	}

	
	// 공방 수정 화면 전환용 Controller
	@RequestMapping("update/{shopNo}")
	public String  shopUpdate(@PathVariable("shopNo") int shopNo, Model model ) {
		
		// 1) 공방 상세 조회
		Shop shop = service.selectShop(shopNo);
		
		// 2) 해당 공방에 포함된 썸네일 조회
		if(shop != null) {
			ShopAttachment thumb = service.selectThumb(shopNo);
			
			model.addAttribute("thumb", thumb);
		}
		
		model.addAttribute("shop" , shop);
		
		return "shop/shopUpdate";
	}
	
	
	// 공방 수정 Controller
	@RequestMapping("updateAction/{shopNo}")
	public String  shopUpdateAction(@PathVariable("shopNo") int shopNo, Model model,
									@ModelAttribute Shop shop, RedirectAttributes ra,
									HttpServletRequest request,
									@RequestParam(value="images", required = false) List<MultipartFile> images) {
		
		// shopNo를 shop에 세팅
		shop.setShopNo(shopNo);
		
		// 파일 저장 경로 얻어오기
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/shop");
		
		// 파일 수정 Service 호출
		int result= service.updateShop(shop, images, savePath);
		
		String url = null;
		
		if(result > 0) {
			swalIcon = "success";
			swalTitle = "공방 수정 성공";
			url = "redirect:../"+shopNo;
		}else {
			swalIcon = "error";
			swalTitle = "공방 수정 실패";
			url = "redirect:" + request.getHeader("referer");
		}
		
		ra.addFlashAttribute("swalIcon", swalIcon);
		ra.addFlashAttribute("swalTitle", swalTitle);
		
		
		return url;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ---------------------- 좋 아 요 ---------------------------

	// 좋아요 추가 Contoller
	@ResponseBody
	@RequestMapping("insertLike")
	public int insertLike(@RequestParam("shopNo") int shopNo, @ModelAttribute("loginMember") Member loginMember) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("shopNo", shopNo);
		map.put("memberNo", loginMember.getMemberNo());

		int result = service.insertLike(map);

		return result;
	}

	// 좋아요 삭제 Contoller
	@ResponseBody
	@RequestMapping("deleteLike")
	public int deleteLike(@RequestParam("shopNo") int shopNo, @ModelAttribute("loginMember") Member loginMember) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("shopNo", shopNo);
		map.put("memberNo", loginMember.getMemberNo());

		int result = service.deleteLike(map);

		return result;
	}

	// 좋아요 카운트 Contoller
	@ResponseBody
	@RequestMapping("selectLikeCount")
	public int selectLikeCount(@RequestParam("shopNo") int shopNo) {

		return service.selectLikeCount(shopNo);
	}
	
	@ResponseBody
	@RequestMapping("selectLikeFl")
	public int selectLikeFl(@RequestParam("shopNo") int shopNo, @ModelAttribute("loginMember") Member loginMember) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("shopNo", shopNo);
		map.put("memberNo", loginMember.getMemberNo());
		return service.selectLikeFl(map);
	}
	
	@RequestMapping("shopMap")
	public String a() {
		return "shop/shopMap";
	}
	
	
	@ResponseBody
	@RequestMapping("selectShopList")
	public List<Shop> selectShopList(String region1, String region2) {
	  Map<String, String> map = new HashMap<String, String>();
	  map.put("region1", region1);
	  map.put("region2", region2);
	  
	  return service.selectShopList(map);
	}
	
	
	
	
	
	
	
}
