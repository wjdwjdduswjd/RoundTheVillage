package com.kh.RoundTheVillage.lesson.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.RoundTheVillage.lesson.model.dao.LessonDAO;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonDetail;

@Service
public class LessonService {

	@Autowired
	LessonDAO dao;

	public List<Lesson> selectList() {
		return dao.selectList();
	}
	
	public Lesson selectLesson(int lesNo) {
		return dao.selectLesson(lesNo);
	}

	public List<LessonDetail> selectDateList(int lesNo) {
		return dao.selectDateList(lesNo);
	}

	public int insert(Map<String, Object> map) {
		return 0;
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertInfo(Lesson lesson) {
		return dao.insertInfo(lesson);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertDate(String[] date, String[] startTime, String[] endTime, String lesLimit) {
		for(int i=0; i<date.length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			String lesTime = startTime[i] + "," + endTime[i];
			map.put("date", date[i]);
			map.put("lesTime", lesTime);
			map.put("lesLimit", lesLimit);
			int result = dao.insertDate(map);
		}
		return 0;
	}
}
