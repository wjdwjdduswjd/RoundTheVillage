package com.kh.RoundTheVillage.lesson.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.RoundTheVillage.lesson.model.dao.LessonDAO;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;

@Service
public class LessonService {

	@Autowired
	LessonDAO dao;

	public Lesson selectLesson(int lessonNo) {
		return dao.selectLesson(lessonNo);
	}
}
