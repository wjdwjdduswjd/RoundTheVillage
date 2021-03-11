package com.kh.RoundTheVillage.lesson.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.RoundTheVillage.lesson.model.service.LessonService;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonDetail;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.lesson.model.vo.LessonQuestion;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReview;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReviewReport;
import com.kh.RoundTheVillage.member.model.vo.Member;
import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Controller
@SessionAttributes({ "loginMember" })
public class LessonController {
	
	@Autowired
	LessonService service;
	
	@GetMapping("/lesson")
	public String list(Model model,
					   String region, String region2, String minPrice, String maxPrice,
					   @RequestParam(value="category[]", required=false) String[] category) {
		List<Lesson> list = new ArrayList<Lesson>();
		List<LessonFile> fileList = new ArrayList<LessonFile>();
		List<Shop> shopList = new ArrayList<>();
		List<Lesson> sumParti = new ArrayList<>();
		Map<String, List> map = new HashMap<String, List>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("region", region);
		searchMap.put("region2", region2);
		searchMap.put("category", category);
		searchMap.put("minPrice", minPrice);
		searchMap.put("maxPrice", maxPrice);
		map = service.selectList(searchMap);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("fileList", map.get("fileList"));
		model.addAttribute("shopList", map.get("shopList"));
		model.addAttribute("sumParti", map.get("sumParti"));
		return "lesson/list";
	}
	
	@ResponseBody
	@GetMapping("/lesson/search")
	public Map<String, List> searchList(Model model, String region, String region2, String minPrice, String maxPrice, String sort,
										@RequestParam(value="category[]", required=false) String[] category) {
		List<Lesson> list = new ArrayList<Lesson>();
		List<LessonFile> fileList = new ArrayList<LessonFile>();
		List<Shop> shopList = new ArrayList<>();
		List<Lesson> sumParti = new ArrayList<>();
		Map<String, List> map = new HashMap<String, List>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("region", region);
		searchMap.put("region2", region2);
		searchMap.put("category", category);
		searchMap.put("minPrice", minPrice);
		searchMap.put("maxPrice", maxPrice);
		searchMap.put("sort", sort);
		map = service.selectList(searchMap);
		return map;
	}
	
	@GetMapping("/lesson/view/{lesNo}")
	public String view(@PathVariable("lesNo") int lesNo,
					   Model model) {
		Lesson lesson = service.selectLesson(lesNo); 
		List<LessonDetail> detailList = new ArrayList<>();
		detailList = service.selectDetailList(lesNo);
		LessonFile file = service.selectFile(lesNo);
		Shop shopInfo = service.selectShopInfo(lesson.getCraftshopNo());
		model.addAttribute("lesson", lesson);
		model.addAttribute("detailList", detailList);
		model.addAttribute("file", file);
		model.addAttribute("shopInfo", shopInfo);
		return "lesson/view";
	}
	
	@GetMapping("/lesson/insertForm")
	public String insertForm() {
		return "lesson/insertForm";
	}
	
	@PostMapping("/lesson/insert")
	public String insert(@ModelAttribute Lesson lesson,
						 @ModelAttribute("loginMember") Member loginMember,
						 @RequestParam("date") String[] date,
						 @RequestParam("start-time") String[] startTime, 
						 @RequestParam("end-time") String[] endTime,
						 @RequestParam("lesLimit") String lesLimit,
						 @RequestParam("mainimageFile") MultipartFile mainimageFile,
						 @RequestHeader(value="referer", required=false) String referer,
						 HttpServletRequest request, RedirectAttributes ra) {
		int lesNo = service.selectNextNo();
		lesson.setLesNo(lesNo);
		lesson.setCraftshopNo(loginMember.getMemberNo());
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/lesson");
		int result1 = service.insertInfo(lesson); // 기본정보 저장
		int result2 = service.insertDate(date, startTime, endTime, lesLimit, lesNo);  // 날짜, 시간 저장
		int result3 = service.insertImageFile(savePath, mainimageFile, lesNo); //대표이미지 저장3
		if(result1 * result2 >= 0) {
			ra.addFlashAttribute("alert", "등록 성공했습니다");
		}
		return "redirect:..";
	}
	
	@PostMapping("/lesson/updateForm")
	public String updateForm(@RequestParam int lesNo,
							 Model model) {
		Lesson lesson = service.selectLesson(lesNo); 
		List<LessonDetail> detailList = new ArrayList<>();
		detailList = service.selectDetailList(lesNo);
		LessonFile file = service.selectFile(lesNo);
		Shop shopInfo = service.selectShopInfo(lesson.getCraftshopNo());
		lesson.setLesCurri(lesson.getLesCurri().replaceAll("<br>", ""));
		model.addAttribute("lesson", lesson);
		model.addAttribute("detailList", detailList);
		model.addAttribute("file", file);
		model.addAttribute("shopInfo", shopInfo);
		return "lesson/updateForm";
	}
	
	@PostMapping("/lesson/update/{lesNo}")
	public String update(@ModelAttribute Lesson lesson,
						 @RequestParam("date") String[] date,
						 @RequestParam("start-time") String[] startTime, 
						 @RequestParam("end-time") String[] endTime,
						 @RequestParam("lesLimit") String lesLimit,
						 @RequestParam("mainimageFile") MultipartFile mainimageFile,
						 @PathVariable("lesNo") int lesNo,
						 @RequestHeader(value="referer", required=false) String referer,
						 HttpServletRequest request, RedirectAttributes ra) {
		lesson.setLesNo(lesNo);
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/lesson");
		int result1 = service.updateInfo(lesson); // 기본정보 저장
		int result2 = service.insertDate(date, startTime, endTime, lesLimit, lesNo);  // 날짜, 시간 저장
		if(!mainimageFile.getOriginalFilename().equals("")) {
			int result3 = service.updateImageFile(savePath, mainimageFile, lesNo); //대표이미지 저장
		}
		if(result1 * result2 >= 0) {
			ra.addFlashAttribute("alert", "수정 성공했습니다");
		}
		return "redirect:..";
	}

	@GetMapping("/lesson/deleteLesson/{lesNo}")
	public String deleteLesson(@PathVariable int lesNo, RedirectAttributes ra) {
		int result = service.deleteLesson(lesNo);
		ra.addFlashAttribute("alert", "삭제 성공했습니다");
		return "redirect:..";
	}
	
	@ResponseBody
	@PostMapping("/lesson/insertImage")
	public String insertImage(HttpServletRequest request,
							  MultipartFile uploadFile) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/lesson");
		LessonFile file = service.insertImage(uploadFile, savePath);
		return new Gson().toJson(file);
	}
	
	@ResponseBody
	@PostMapping("/lesson/selectReview/{lesNo}")
	public List<LessonReview> selectReview(@PathVariable int lesNo) {
		List<LessonReview> list = new ArrayList<LessonReview>();
		list = service.selectReview(lesNo);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/lesson/insertReview")
	public int insertReview(@ModelAttribute LessonReview review) {
		int result = service.insertReview(review);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson/updateReview/{revNo}")
	public int updateReview(@PathVariable int revNo,
							@ModelAttribute LessonReview review) {
		review.setRevNo(revNo);
		int result = service.updateReview(review);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson/deleteReview/{revNo}")
	public int deleteReview(@PathVariable int revNo) {
		int result = service.deleteReview(revNo);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson/selectQuestion/{lesNo}")
	public List<LessonQuestion> selectQuestion(@PathVariable int lesNo) {
		List<LessonQuestion> list = new ArrayList<LessonQuestion>();
		list = service.selectQuestion(lesNo);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/lesson/insertQuestion/{lesNo}")
	public int insertQuestion(@PathVariable int lesNo,
							  @ModelAttribute LessonQuestion question) {
		question.setLesNo(lesNo);
		int result = service.insertQuestion(question);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson/insertAnswer/{queParentNo}")
	public int insertAnswer(@PathVariable int queParentNo,
			@ModelAttribute LessonQuestion question) {
		question.setQueParentNo(queParentNo);
		int result = service.insertAnswer(question);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson/deleteQuestion/{queNo}")
	public int deleteQuestion(@PathVariable int queNo) {
		int result = service.deleteQuestion(queNo);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/lesson/updateQuestion/{queNo}")
	public int updateQuestion(@PathVariable int queNo,
							  @ModelAttribute LessonQuestion question) {
		question.setLesNo(queNo);
		int result = service.updateQuestion(question);
		return result;
	}
	
	@GetMapping("/lesson/reportForm/{revNo}")
	public String reportForm(@PathVariable int revNo, Model model) {
		model.addAttribute(revNo);
		return "lesson/report";
	}
	
	@GetMapping("/lesson/report/{revNo}")
	public String report(@PathVariable int revNo,
						 @ModelAttribute LessonReviewReport report,
						 Model model) {
		int result = service.report(report);
		model.addAttribute("result", result);
		return "lesson/close";
	}
}
