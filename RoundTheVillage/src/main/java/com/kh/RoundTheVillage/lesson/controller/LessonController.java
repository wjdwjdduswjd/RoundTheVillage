package com.kh.RoundTheVillage.lesson.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.RoundTheVillage.lesson.model.service.LessonService;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonDetail;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.lesson.model.vo.LessonQuestion;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReview;
import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Controller
public class LessonController {
	
	@Autowired
	LessonService service;
	
	@GetMapping("/lesson")
	public String list(Model model) {
		List<Lesson> list = new ArrayList<Lesson>();
		List<LessonFile> fileList = new ArrayList<LessonFile>();
		List<Shop> shopList = new ArrayList<>();
		List<Lesson> sumParti = new ArrayList<>();
		list = service.selectList();
		fileList = service.selectFileList();
		shopList = service.selectShopList();
		sumParti = service.selectSumParti();
		model.addAttribute("list", list);
		model.addAttribute("fileList", fileList);
		model.addAttribute("shopList", shopList);
		model.addAttribute("sumParti", sumParti);
		return "lesson/list";
	}
	
	@GetMapping("/lesson/view/{lesNo}")
	public String view(@PathVariable("lesNo") int lesNo,
					   Model model) {
		Lesson lesson = service.selectLesson(lesNo); // 제목이나 내용
		List<LessonDetail> detailList = new ArrayList<>();
		detailList = service.selectDetailList(lesNo); // 정원, 참가자 , 날짜 등등
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
						 @RequestParam("date") String[] date,
						 @RequestParam("start-time") String[] startTime, 
						 @RequestParam("end-time") String[] endTime,
						 @RequestParam("lesLimit") String lesLimit,
						 @RequestParam("mainimageFile") MultipartFile mainimageFile,
						 HttpServletRequest request) {
		int lesNo = service.selectNextNo();
		lesson.setLesNo(lesNo);
		String savePath = request.getSession().getServletContext().getRealPath("resources/images/lesson");
		int result1 = service.insertInfo(lesson); // 기본정보 저장
		int result2 = service.insertDate(date, startTime, endTime, lesLimit, lesNo);  // 날짜, 시간 저장
		int result3 = service.insertImageFile(savePath, mainimageFile, lesNo); //대표이미지 저장
		return "lesson/list";
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
	@PostMapping("/lesson/reviewInsert")
	public int insertReview(@ModelAttribute LessonReview review) {
		System.out.println(review);
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
	
}
