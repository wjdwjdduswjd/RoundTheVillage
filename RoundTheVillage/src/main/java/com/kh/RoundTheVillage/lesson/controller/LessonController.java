package com.kh.RoundTheVillage.lesson.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.RoundTheVillage.lesson.model.service.LessonService;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;

@Controller
public class LessonController {
	
	@Autowired
	LessonService service;
	@GetMapping("/lesson")
	public String list() {
		return "lesson/list";
	}
	
	@GetMapping("/lesson/view/{lessonNo}")
	public String view(@PathVariable("lessonNo") int lessonNo,
					   Model model) {
		//Lesson lesson = service.selectLesson(lessonNo);
		Lesson lesson = new Lesson();
		lesson.setLesNo(lessonNo); //>>>>>>>> 지울꺼 
		model.addAttribute("lesson", lesson);
		return "lesson/view";
	}
	
	@GetMapping("/lesson/insert")
	public String insert() {
		return "lesson/insertForm";
	}
}
