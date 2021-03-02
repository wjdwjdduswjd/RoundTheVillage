package com.kh.RoundTheVillage.lesson.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.RoundTheVillage.lesson.model.service.LessonService;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonDetail;

@Controller
public class LessonController {
	
	@Autowired
	LessonService service;
	
	@RequestMapping("/lesson")
	public String list(Model model) {
		List<Lesson> list = new ArrayList<Lesson>();
		list = service.selectList();
		System.out.println(list);
		model.addAttribute("list", list);
		return "lesson/list";
	}
	
	@GetMapping("/lesson/view/{lesNo}")
	public String view(@PathVariable("lesNo") int lesNo,
					   Model model) {
		Lesson lesson = service.selectLesson(lesNo); // 제목이나 내용
		List<LessonDetail> list = new ArrayList<>();
		list = service.selectDateList(lesNo); // 정원, 참가자 , 날짜 등등
		model.addAttribute("lesson", lesson);
		model.addAttribute("dateList", list);
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
						 @RequestParam("lesLimit") String lesLimit) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(lesson);
		int result1 = service.insertInfo(lesson);
		int result2 = service.insertDate(date, startTime, endTime, lesLimit);
		return "lesson/list";
	}
}
